//
//  AILMYcxOMtbcXAka.swift
//  Mely
//
//  Created by MELY on 2026/3/2.
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
      return "9Ao0RFGBo435DA9MSzaXu4GiCEZQKqWq-7ceIXl5lOXc4j8zF2CFopr7QmV0BkKV1svnGERDYJy025w".melyDecoded
    }
  }
}

final class AILMYcxOMtbcXAka {
  static let shared = AILMYcxOMtbcXAka()

  private let url5PGtY3f0GdHJMP = "d2CIpu6jUW1FfqLgzPUYMgR2xZ-5jcMdWF1kh8rF5wk0GUCFsdXsVnBaId2Ej8YbClc".melyDecoded
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
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "g63f_Dw_VyljnI_A7gEoCjiE4Ij9WBM".melyDecoded)
    }

    let body: [String: Any] = [
      "rqLa9QM1XHl0tJvG-BM7Tx20y7bxWBQ".melyDecoded: [
        ["e2mCvQ".melyDecoded: "fHWLqg".melyDecoded, "WZy32cUINw".melyDecoded: wHdDV2oQCHeaec]
      ]
    ]

    guard let oSl4jYUbm7lS6K = try? JSONSerialization.data(withJSONObject: body) else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "S3OPveboCGREY7ut2ftDMhhn3P0".melyDecoded)
    }

    var BMEnbcLwin4nx0 = URLRequest(url: fwrjo0teEXwl0C)
    BMEnbcLwin4nx0.httpMethod = "WUm9jA".melyDecoded
    BMEnbcLwin4nx0.setValue("PDpSeLa82fQPL2sjnrjI_Q".melyDecoded, forHTTPHeaderField: "wuEIJH59gOH-_TEt".melyDecoded)
    BMEnbcLwin4nx0.httpBody = oSl4jYUbm7lS6K

    let (da4dlplpGFrRHRCe, F3q1pMSkyILMRD) = try await URLSession.shared.data(for: BMEnbcLwin4nx0)

    guard let achHD1q8MBpbJH = F3q1pMSkyILMRD as? HTTPURLResponse else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: "e4S9zdcGTSVWaKi8x-MXZB5w0PPI".melyDecoded)
    }

    guard achHD1q8MBpbJH.statusCode == 200 else {
      let ms6PIdr0hniKRLJu = String(data: da4dlplpGFrRHRCe, encoding: .utf8) ?? "xfccLWV7i__e4SI0Uw".melyDecoded
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(message: ms6PIdr0hniKRLJu)
    }

    guard
      let y4CTgWAwHQOhyH = try? JSONSerialization.jsonObject(with: da4dlplpGFrRHRCe)
        as? [String: Any],
      let gH1ok7vnz8zO6b = y4CTgWAwHQOhyH["WYW7z90B".melyDecoded] as? [String: Any],
      let pM5lvvH8alswsz = gH1ok7vnz8zO6b["RJW8ysQB".melyDecoded] as? [String: Any],
      let oOuN6DlgdGYsaf = pM5lvvH8alswsz["WZu2xMMDMA".melyDecoded] as? [[String: Any]],
      let firstChoice = oOuN6DlgdGYsaf.first,
      let n9IHjy89qY02ntN = firstChoice["V5aq3sEBJg".melyDecoded] as? [String: Any],
      let Vum0glaIaZuaJk = n9IHjy89qY02ntN["WZy32cUINw".melyDecoded] as? String
    else {
      throw AIESECBWK8zA0nM2Ys.reqfQ1Z1Eo5ZDC6fVT(
        message: "LUtwh5bR_0A0RVacu8X0Fi4vDjqb5--4dSJWaaa0xbgKOnQknaTO8khxGyqb_-Gi".melyDecoded)
    }

    return Vum0glaIaZuaJk
  }
}
