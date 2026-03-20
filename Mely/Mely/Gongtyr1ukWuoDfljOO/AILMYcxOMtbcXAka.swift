//
//  AILMYcxOMtbcXAka.swift
//  Mely
//
//  Created by yangyang on 2026/3/2.
//

import Foundation

enum AIResMfAAILzVfeg7Ad {
  case scC6f67Li7DcgICB(String)
  case faBIYIRvwNGimPq6(String)
}

enum AIESECBWK8zA0nM2Ys: Error, LocalizedError {
  case reqfQ1Z1Eo5ZDC6fVT(message: String)
  case timeout

  var errorDescription: String? {
    switch self {
    case .reqfQ1Z1Eo5ZDC6fVT(let message):
      return message
    case .timeout:
      return "Request timed out. Please check your network and try again."
    }
  }
}

final class AILMYcxOMtbcXAka {
  static let shared = AILMYcxOMtbcXAka()

  private let url5PGtY3f0GdHJMP = "https://api.zxychat.link/api/dash/scope/textIssues"
  private let toutLtOHiGTOK8cGKn: TimeInterval = 20

  private init() {}

  func toAIchatYTalmxKhx8MrpD(message: String) async -> AIResMfAAILzVfeg7Ad {
    let cpv3PDaYVDUnqx = message.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !cpv3PDaYVDUnqx.isEmpty else {
      return .faBIYIRvwNGimPq6("")
    }

    do {
      let re7nWdSuAVqB2F4z = try await wihchao7nWdSuAVqB2F4z(seconds: toutLtOHiGTOK8cGKn) {
        try await self.qingqiuDwemAN3eNFREpZ(wHdDV2oQCHeaec: cpv3PDaYVDUnqx)
      }
      return .scC6f67Li7DcgICB(re7nWdSuAVqB2F4z)
    } catch {
      return .faBIYIRvwNGimPq6(error.localizedDescription)
    }
  }

  private func wihchao7nWdSuAVqB2F4z<T>(
    seconds: TimeInterval,
    operation: @escaping () async throws -> T
  ) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
      group.addTask { try await operation() }
      group.addTask {
        try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        throw AIESECBWK8zA0nM2Ys.timeout
      }
      let JsKG35IfHHmbs6 = try await group.next()!
      group.cancelAll()
      return JsKG35IfHHmbs6
    }
  }

  private func qingqiuDwemAN3eNFREpZ(wHdDV2oQCHeaec: String) async throws -> String {
    guard let fwrjo0teEXwl0C = URL(string: url5PGtY3f0GdHJMP) else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "Invalid request address")
    }

    let body: [String: Any] = [
      "dashScopeMessageDTOList": [
        ["role": "user", "content": wHdDV2oQCHeaec]
      ]
    ]

    guard let oSl4jYUbm7lS6K = try? JSONSerialization.data(withJSONObject: body) else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "Request format error")
    }

    var BMEnbcLwin4nx0 = URLRequest(url: fwrjo0teEXwl0C)
    BMEnbcLwin4nx0.httpMethod = "POST"
    BMEnbcLwin4nx0.setValue("application/json", forHTTPHeaderField: "Content-Type")
    BMEnbcLwin4nx0.httpBody = oSl4jYUbm7lS6K

    let (da4dlplpGFrRHRCe, F3q1pMSkyILMRD) = try await URLSession.shared.data(for: BMEnbcLwin4nx0)

    guard let achHD1q8MBpbJH = F3q1pMSkyILMRD as? HTTPURLResponse else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "Server response error")
    }

    guard achHD1q8MBpbJH.statusCode == 200 else {
      let ms6PIdr0hniKRLJu = String(data: da4dlplpGFrRHRCe, encoding: .utf8) ?? "Unknown error"
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: ms6PIdr0hniKRLJu)
    }

    guard
      let y4CTgWAwHQOhyH = try? JSONSerialization.jsonObject(with: da4dlplpGFrRHRCe)
        as? [String: Any],
      let gH1ok7vnz8zO6b = y4CTgWAwHQOhyH["result"] as? [String: Any],
      let pM5lvvH8alswsz = gH1ok7vnz8zO6b["output"] as? [String: Any],
      let oOuN6DlgdGYsaf = pM5lvvH8alswsz["choices"] as? [[String: Any]],
      let firstChoice = oOuN6DlgdGYsaf.first,
      let n9IHjy89qY02ntN = firstChoice["message"] as? [String: Any],
      let Vum0glaIaZuaJk = n9IHjy89qY02ntN["content"] as? String
    else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(
        message: "Parsing response failed, please try again later.")
    }

    return Vum0glaIaZuaJk
  }
}
