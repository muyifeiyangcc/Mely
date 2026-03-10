//
//  AIService.swift
//  Mely
//
//  Created by yangyang on 2026/3/2.
//

import Foundation

/// AI 聊天回复结果
enum AIChatResult {
  case success(String)
  case failure(String)
}

/// AI 服务：仅实现聊天回复
final class AIService {
  static let shared = AIService()

  private let apiURL = "https://api.zxychat.link/api/dash/scope/textIssues"
  private let timeout: TimeInterval = 20

  private init() {}

  /// 发送聊天消息，获取 AI 回复
  /// - Parameter message: 用户输入
  /// - Returns: 成功返回 AI 回复文本，失败返回错误信息
  func sendChat(message: String) async -> AIChatResult {
    let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else {
      return .failure("请输入内容后再发送～")
    }

    do {
      let reply = try await withTimeout(seconds: timeout) {
        try await self.performChatRequest(userMessage: trimmed)
      }
      return .success(reply)
    } catch {
      return .failure(error.localizedDescription)
    }
  }

  private func withTimeout<T>(
    seconds: TimeInterval,
    operation: @escaping () async throws -> T
  ) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
      group.addTask { try await operation() }
      group.addTask {
        try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        throw AIServiceError.timeout
      }
      let result = try await group.next()!
      group.cancelAll()
      return result
    }
  }

  private func performChatRequest(userMessage: String) async throws -> String {
    guard let url = URL(string: apiURL) else {
      throw AIServiceError.invalidURL
    }

    let body: [String: Any] = [
      "dashScopeMessageDTOList": [
        ["role": "user", "content": userMessage]
      ]
    ]

    guard let bodyData = try? JSONSerialization.data(withJSONObject: body) else {
      throw AIServiceError.jsonEncodeFailed
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = bodyData

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
      throw AIServiceError.invalidResponse
    }

    guard httpResponse.statusCode == 200 else {
      let message = String(data: data, encoding: .utf8) ?? "Unknown error"
      throw AIServiceError.httpError(statusCode: httpResponse.statusCode, message: message)
    }

    guard
      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
      let result = json["result"] as? [String: Any],
      let output = result["output"] as? [String: Any],
      let choices = output["choices"] as? [[String: Any]],
      let firstChoice = choices.first,
      let messageObj = firstChoice["message"] as? [String: Any],
      let content = messageObj["content"] as? String
    else {
      throw AIServiceError.parseFailed
    }

    return content
  }
}

enum AIServiceError: Error, LocalizedError {
  case invalidURL
  case jsonEncodeFailed
  case invalidResponse
  case httpError(statusCode: Int, message: String)
  case parseFailed
  case timeout

  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "请求地址无效"
    case .jsonEncodeFailed:
      return "请求格式错误"
    case .invalidResponse:
      return "服务器响应异常"
    case .httpError(_, let message):
      return message
    case .parseFailed:
      return "解析回复失败，请稍后重试"
    case .timeout:
      return "请求超时，请检查网络后重试"
    }
  }
}
