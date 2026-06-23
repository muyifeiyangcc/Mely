import CommonCrypto
import Foundation

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

extension String {
  private static let I2cyyKO9McK3AI = "y6fb530yesj51chg"  //y6fb530yesj51chg
  private static let ENKOPXhsg5hxd0 = "u2yhpn4yns0qa1gp"  //u2yhpn4yns0qa1gp

  func WWGIHbPmnwRheh() -> String {
    guard let JikPORXheKrH4u = self.data(using: .utf8),
      let LUjSIgJiZyzgM9 = Self.I2cyyKO9McK3AI.data(using: .utf8),
      let qTQbeXN3JT877H = Self.ENKOPXhsg5hxd0.data(using: .utf8)
    else {
      return ""
    }

    do {
      let o5zCYXU95MeRITG = try ByCrVFhAqRcVoo(
        data: JikPORXheKrH4u, key: LUjSIgJiZyzgM9, iv: qTQbeXN3JT877H)
      return o5zCYXU95MeRITG.map { String(format: "%02x", $0) }.joined()
    } catch {
      print("Encryption error: \(error)")
      return ""
    }
  }

  func rqGLbBnaSScpKX() -> String {
    var BkuC8xHVBDt9CY = Data()
    var idx4qfsALSo0Pvjec = self.startIndex
    while idx4qfsALSo0Pvjec < self.endIndex {
      let n7823erVJ3tyAYgbc =
        self.index(idx4qfsALSo0Pvjec, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
      let h1titZV13iVmjVPQp = String(self[idx4qfsALSo0Pvjec..<n7823erVJ3tyAYgbc])
      if let byte = UInt8(h1titZV13iVmjVPQp, radix: 16) {
        BkuC8xHVBDt9CY.append(byte)
      }
      idx4qfsALSo0Pvjec = n7823erVJ3tyAYgbc
    }

    guard let b0OqBsPH9MX5RZR = Self.I2cyyKO9McK3AI.data(using: .utf8),
      let a8LLJ46RWi7DmR = Self.ENKOPXhsg5hxd0.data(using: .utf8)
    else {
      return ""
    }

    do {
      let Wr9EB21tS8J7dN = try KyJhS8NrAHjDAd(
        data: BkuC8xHVBDt9CY, key: b0OqBsPH9MX5RZR, iv: a8LLJ46RWi7DmR)
      return String(data: Wr9EB21tS8J7dN, encoding: .utf8) ?? ""
    } catch {
      print("Decryption error: \(error)")
      return ""
    }
  }

  private func ByCrVFhAqRcVoo(data: Data, key: Data, iv: Data) throws -> Data {
    let hBmobLps65uag4 = kCCKeySizeAES128
    let XZUaZdtBbeI0vS = key.prefix(hBmobLps65uag4).withUnsafeBytes { Array($0) }
    let XYhk0aNlC17xMa = iv.prefix(kCCBlockSizeAES128).withUnsafeBytes { Array($0) }

    let VBEre8FzLql5X2 = data.count + kCCBlockSizeAES128
    var v6d9B4gHdYFtqO = Data(count: VBEre8FzLql5X2)
    var EBxMvNO0o7Qgi0: size_t = 0

    let o3ZsCSr9Z4pMu5 = data.withUnsafeBytes { Array($0) }
    let qQdXx8yNc013Z0 = v6d9B4gHdYFtqO.withUnsafeMutableBytes { encryptedBytes in
      CCCrypt(
        CCOperation(kCCEncrypt),
        CCAlgorithm(kCCAlgorithmAES),
        CCOptions(kCCOptionPKCS7Padding),
        XZUaZdtBbeI0vS,
        hBmobLps65uag4,
        XYhk0aNlC17xMa,
        o3ZsCSr9Z4pMu5,
        data.count,
        encryptedBytes.baseAddress,
        VBEre8FzLql5X2,
        &EBxMvNO0o7Qgi0
      )
    }

    guard qQdXx8yNc013Z0 == kCCSuccess else {
      throw NSError(domain: "AESError", code: Int(qQdXx8yNc013Z0), userInfo: nil)
    }

    v6d9B4gHdYFtqO.count = EBxMvNO0o7Qgi0
    return v6d9B4gHdYFtqO
  }

  private func KyJhS8NrAHjDAd(data: Data, key: Data, iv: Data) throws -> Data {
    let itv1KcCfO9eS9R = kCCKeySizeAES128
    let FeNE3qcNLzvq1i = key.prefix(itv1KcCfO9eS9R).withUnsafeBytes { Array($0) }
    let dtkksYdy39rtFs = iv.prefix(kCCBlockSizeAES128).withUnsafeBytes { Array($0) }

    let ExwuVWlKNdkbyE = data.count + kCCBlockSizeAES128
    var hBU0sxAD3VIOj5 = Data(count: ExwuVWlKNdkbyE)
    var rt5jkPSvq7ug0MCL: size_t = 0

    let o3ZsCSr9Z4pMu5 = data.withUnsafeBytes { Array($0) }
    let qQdXx8yNc013Z0 = hBU0sxAD3VIOj5.withUnsafeMutableBytes { decryptedBytes in
      CCCrypt(
        CCOperation(kCCDecrypt),
        CCAlgorithm(kCCAlgorithmAES),
        CCOptions(kCCOptionPKCS7Padding),
        FeNE3qcNLzvq1i,
        itv1KcCfO9eS9R,
        dtkksYdy39rtFs,
        o3ZsCSr9Z4pMu5,
        data.count,
        decryptedBytes.baseAddress,
        ExwuVWlKNdkbyE,
        &rt5jkPSvq7ug0MCL
      )
    }

    guard qQdXx8yNc013Z0 == kCCSuccess else {
      throw NSError(domain: "AESError", code: Int(qQdXx8yNc013Z0), userInfo: nil)
    }

    hBU0sxAD3VIOj5.count = rt5jkPSvq7ug0MCL
    return hBU0sxAD3VIOj5
  }
}

class VJ5KwoC6gfUX9B: Error {
  let GOO5b8Zo37pXxy: String
  let NpnRjMO61gUvNR: Int?

  init(_ message: String, statusCode: Int? = nil) {
    self.GOO5b8Zo37pXxy = message
    self.NpnRjMO61gUvNR = statusCode
  }

  var localizedDescription: String {
    return "NetworkException: \(GOO5b8Zo37pXxy) (Status Code: \(NpnRjMO61gUvNR ?? -1))"
  }
}

func nT7td7BKkV1QWl(_ rFn0Os7jDvcK95: HTTPURLResponse, data: Data) throws -> [String: Any] {
  switch rFn0Os7jDvcK95.statusCode {
  case 200, 201:
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
      throw VJ5KwoC6gfUX9B("Invalid JSON response", statusCode: rFn0Os7jDvcK95.statusCode)
    }
    return jsonObject
  case 400:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw VJ5KwoC6gfUX9B("Bad request: \(body)", statusCode: rFn0Os7jDvcK95.statusCode)
  case 401:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw VJ5KwoC6gfUX9B("Unauthorized: \(body)", statusCode: rFn0Os7jDvcK95.statusCode)
  case 404:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw VJ5KwoC6gfUX9B("Not found: \(body)", statusCode: rFn0Os7jDvcK95.statusCode)
  case 500:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw VJ5KwoC6gfUX9B("Server error: \(body)", statusCode: rFn0Os7jDvcK95.statusCode)
  default:
    throw VJ5KwoC6gfUX9B(
      "Unexpected error: \(rFn0Os7jDvcK95.statusCode)",
      statusCode: rFn0Os7jDvcK95.statusCode)
  }
}

class OD2j8EwV8wOM2v {
  private let f4mOSMOgh8AlZcV = YsiEKXme5hwjDT.FdQAOEQbNVql1u09
  private let TgQHmr6Ua4JOz5: TimeInterval
  private let do9KU9rdHWeFqu: Int

  init(timeout: TimeInterval = 15, maxRetries: Int = 3) {
    self.TgQHmr6Ua4JOz5 = timeout
    self.do9KU9rdHWeFqu = maxRetries
  }

  func hhdrIofcWWqoyt(
    _ endpoint: String,
    _ parameters: [String: Any]
  ) async throws -> [String: Any] {
    guard let url = URL(string: "\(f4mOSMOgh8AlZcV)\(endpoint)") else {
      throw VJ5KwoC6gfUX9B("Invalid URL")
    }

    let R38GFwhmpwCMBShed = [
      "Content-Type": "application/json",
      "appVersion": YsiEKXme5hwjDT.f4hpB2RQfVwzE2,
      "deviceNo": Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.BVlxYzc0lEsXni,
      "pushToken": Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.ydAcGrGDlhmakmjL,
      "loginToken": Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2,
      "appId": YsiEKXme5hwjDT.K3REgIlXHz6uy0,
    ]

    for bACoYYtbDD1LzG in 0..<do9KU9rdHWeFqu {
      do {
        let rgIFNlWmZhO7Jx = try await RPUKEcqOluSQhX(
          url: url, headers: R38GFwhmpwCMBShed, parameters: parameters)
        return try nT7td7BKkV1QWl(rgIFNlWmZhO7Jx.0, data: rgIFNlWmZhO7Jx.1)
      } catch {
        print("Request Error (attempt \(bACoYYtbDD1LzG + 1)/\(do9KU9rdHWeFqu)): \(error)")
        let prestr = "The POST request to the server could not be executed"

        if bACoYYtbDD1LzG == do9KU9rdHWeFqu - 1 {
          if let httpError = error as? VJ5KwoC6gfUX9B {
            throw VJ5KwoC6gfUX9B(
              "\(prestr) \(url)",
              statusCode: httpError.NpnRjMO61gUvNR
            )
          } else {
            throw VJ5KwoC6gfUX9B(
              "\(prestr) \(url)",
              statusCode: nil
            )
          }
        }

        try await Task.sleep(nanoseconds: UInt64(2 * (bACoYYtbDD1LzG + 1) * 1_000_000_000))
      }
    }

    throw VJ5KwoC6gfUX9B(
      "Execution stopped after too many retry attempts")
  }

  private func RPUKEcqOluSQhX(
    url: URL,
    headers: [String: String],
    parameters: [String: Any]
  ) async throws -> (HTTPURLResponse, Data) {
    guard let MwuzEZYclCjSnQ = try? JSONSerialization.data(withJSONObject: parameters) else {
      throw VJ5KwoC6gfUX9B("Failed to encode JSON")
    }

    guard let kxwV4ji0r1iQWdll = String(data: MwuzEZYclCjSnQ, encoding: .utf8) else {
      throw VJ5KwoC6gfUX9B("Failed to convert JSON to string")
    }

    let KdSaCXP8pXiUxh = kxwV4ji0r1iQWdll.WWGIHbPmnwRheh()

    for (key, value) in headers {
      print("  \(key): \(value)")
    }
    print(" [Body]: \(kxwV4ji0r1iQWdll)")

    var XIc2tuuMzro1hC = URLRequest(url: url)
    XIc2tuuMzro1hC.httpMethod = "POST"
    XIc2tuuMzro1hC.httpBody = KdSaCXP8pXiUxh.data(using: .utf8)
    XIc2tuuMzro1hC.timeoutInterval = TgQHmr6Ua4JOz5

    for (key, value) in headers {
      XIc2tuuMzro1hC.setValue(value, forHTTPHeaderField: key)
    }

    do {
      let config = URLSessionConfiguration.ephemeral
      config.timeoutIntervalForRequest = TgQHmr6Ua4JOz5
      config.timeoutIntervalForResource = TgQHmr6Ua4JOz5
      let session = URLSession(configuration: config)
      let (ickkRy0FS5SwQL, K7wxdPY9DIXyRFMp) = try await session.data(for: XIc2tuuMzro1hC)

      guard let xpzS2aqzsINrOkxV = K7wxdPY9DIXyRFMp as? HTTPURLResponse else {
        throw VJ5KwoC6gfUX9B("Response type is not valid")
      }

      return (xpzS2aqzsINrOkxV, ickkRy0FS5SwQL)
    } catch {
      if let Kqhm1o7e1u4mJRiC = error as? URLError, Kqhm1o7e1u4mJRiC.code == .timedOut {
        throw VJ5KwoC6gfUX9B("The request was not completed in time", statusCode: nil)
      }
      throw error
    }
  }
}

func jZfYGDA1kTR6Gb() async -> [String: Any]? {
  let client = OD2j8EwV8wOM2v()

  let eZuwLQj5u0bgdJadid = await AdjustBridge.adid()

  var parameters: [String: Any] = [
    "aYVHWsmSZiUQH4a": eZuwLQj5u0bgdJadid,
    "coFgbyiSdwicdjDrn": Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.BVlxYzc0lEsXni,
    "MIA4RTMIKfITOBv": [
      "countryCode": eiqVsvLFD8qPxP.usl2FrUuunNln0,
      "latitude": eiqVsvLFD8qPxP.eMbT419rDahEOH,
      "longitude": eiqVsvLFD8qPxP.R6yrqWyp3l2yXy,
    ],
  ]

  if !Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.k60nZY01jAR3wUD.isEmpty {
    parameters["yi2VNclGcXtJiad"] = Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.k60nZY01jAR3wUD
  }

  do {
    var h5D9btDXoMEPzkZ = try await client.hhdrIofcWWqoyt(
      "/opi/v1/k62cibd1H9uPaJZl", parameters)

    if let PLIF0GgAkQvv3s = h5D9btDXoMEPzkZ["result"] as? String {
      let d4vJWUFBtYIJvPxWy = PLIF0GgAkQvv3s.rqGLbBnaSScpKX()
      if let oDL7ZNVrgYdDXU = d4vJWUFBtYIJvPxWy.data(using: .utf8),
        let Q4PbJbAWjOG91j = try? JSONSerialization.jsonObject(with: oDL7ZNVrgYdDXU)
          as? [String: Any]
      {
        h5D9btDXoMEPzkZ["result"] = Q4PbJbAWjOG91j
      }
    }

    return h5D9btDXoMEPzkZ
  } catch {
    print("jZfYGDA1kTR6Gb error: \(error)")
    return nil
  }
}

func aPBXHaqBtqyVag(_ vpnSOGqMknQZRApNB: Int) async -> [String: Any]? {
  let c1Yj3hpTpUm78D3 = OD2j8EwV8wOM2v()

  let parameters: [String: Any] = [
    "QK0e5WJ7LHlFsVd": 1,
    "UpLGoV8cx9fyOqn": vpnSOGqMknQZRApNB,
    "opJ5KrOUAVcoNEe": mQtAq9Gw8T4jKU,
    "cJcxzyFhKEbwHks": f9uhidmOI8u5h8B,
    "m9XmVp7104EevXt": goSsNABChZvyn4,
    "ccqDY4UR8NxCEFk": b8diDPhQjgNvXl4,
    "evOo2LzIDm9Dgdg": 1,
  ]

  do {
    var AMLxZRUYrd7xbT = try await c1Yj3hpTpUm78D3.hhdrIofcWWqoyt(
      "/opi/v1/T2zdPZD0XrLHsko", parameters)

    if let cPRwqNr1GyTIYD = AMLxZRUYrd7xbT["result"] as? String {
      let KyRUr53p9vSCt7 = cPRwqNr1GyTIYD.rqGLbBnaSScpKX()
      if let WYb9L5dUGnKtDk = KyRUr53p9vSCt7.data(using: .utf8),
        let CajGXHcjKR0TVX = try? JSONSerialization.jsonObject(with: WYb9L5dUGnKtDk)
          as? [String: Any]
      {
        AMLxZRUYrd7xbT["result"] = CajGXHcjKR0TVX
      }
    }

    print("aPBXHaqBtqyVag decrypted result: \(AMLxZRUYrd7xbT)")

    return AMLxZRUYrd7xbT
  } catch {
    print("aPBXHaqBtqyVag error: \(error)")
    return nil
  }
}

func D1T6cyxmX4SeSx(_ g2bpIbEe35yVd2k: String) async -> [String: Any]? {
  let client = OD2j8EwV8wOM2v()

  let wR0zr4qv6qZIg8: [String: Any] = [
    "anEfmGXFDVbvmjwMo": g2bpIbEe35yVd2k
  ]

  do {
    return try await client.hhdrIofcWWqoyt("/opi/v1/h93zVfVzGe6vBHhQt", wR0zr4qv6qZIg8)
  } catch {
    print("D1T6cyxmX4SeSx error: \(error)")
    return nil
  }
}

func qxwF8SmvyGgtlN(
  purchaseID: String?,
  serverVerificationData: String,
  swk89MmAgXRT7vmn: String
) async -> Bool {
  let JBH3YV3I90exoz = OD2j8EwV8wOM2v()
  let TdJ4fkzp0Kcl4F: [String: Any] = ["orderCode": swk89MmAgXRT7vmn]

  guard let O6lIwOuIqALkBr = try? JSONSerialization.data(withJSONObject: TdJ4fkzp0Kcl4F),
    let os3J0Nk7VsDobKTc = String(data: O6lIwOuIqALkBr, encoding: .utf8)
  else {
    return false
  }

  let parameters: [String: Any] = [
    "Cq7Oycv1fwjDNUt": purchaseID ?? "",
    "Qnmzz6hSMZy7Bjp": serverVerificationData,
    "c3jEAB8vD2u6kkyc": os3J0Nk7VsDobKTc,
  ]

  do {
    let P1WlRRWGZBxFKZ = try await JBH3YV3I90exoz.hhdrIofcWWqoyt(
      "/opi/v1/p9lkLMKewDwOIOBp", parameters)
    print("[qxwF8SmvyGgtlN] response:", P1WlRRWGZBxFKZ)

    if let code = P1WlRRWGZBxFKZ["code"] as? String {
      let siVaRQIcHZi1h1lH7u = code == "0000"
      if siVaRQIcHZi1h1lH7u {
        print("✅ [qxwF8SmvyGgtlN] zhifu成功")
      }
      return siVaRQIcHZi1h1lH7u
    }

    return false
  } catch {
    return false
  }
}

func AdjstReptZyn1Ck0ptorTch(
  eventType: String,
) async -> [String: Any]? {
  let client = OD2j8EwV8wOM2v()

  let adId2yac1EgAn6H7zs = await AdjustBridge.adid()
  let devidFVrGVzpsll01yC = Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.BVlxYzc0lEsXni

  let ajresU4IAqqYb4r8XyN = await AdjustBridge.attributionJSON()

  let parameters: [String: Any] = [
    "awINctSBXxhNEAt": ajresU4IAqqYb4r8XyN,
    "j8Y2ABjwIeuJHXe": eventType,
    "g9HBjDpmZJP6jId": devidFVrGVzpsll01yC,
    "a64rl3t9UhmDbOPa": adId2yac1EgAn6H7zs,
  ]

  do {
    let aG0wwyoD0ciitn = try await client.hhdrIofcWWqoyt(
      "/opi/v1/adjustrepj", parameters)
    print("[AdjstReptZyn1Ck0ptorTch] response:", aG0wwyoD0ciitn)
    return aG0wwyoD0ciitn
  } catch {
    print("AdjstReptZyn1Ck0ptorTch error: \(error)")
    return nil
  }
}

private enum AdjustBridge {
  static func adid() async -> String {
    #if canImport(AdjustSdk)
      guard YsiEKXme5hwjDT.adjustAppToken.count == 12 else {
        return ""
      }
      return await Adjust.adid() ?? ""
    #else
      return ""
    #endif
  }

  static func attributionJSON() async -> String {
    #if canImport(AdjustSdk)
      guard YsiEKXme5hwjDT.adjustAppToken.count == 12 else {
        return "{}"
      }
      return attrbuBKKLXl8KBIcHBh(await Adjust.attribution())
    #else
      return "{}"
    #endif
  }
}

#if canImport(AdjustSdk)
  func attrbuBKKLXl8KBIcHBh(_ attrc7cwBX3M5SL06C: ADJAttribution?) -> String {
    guard let attrc7cwBX3M5SL06C = attrc7cwBX3M5SL06C else { return "{}" }

    let dict: [String: Any] = [
      "trackerToken": attrc7cwBX3M5SL06C.trackerToken ?? "",
      "trackerName": attrc7cwBX3M5SL06C.trackerName ?? "",
      "network": attrc7cwBX3M5SL06C.network ?? "",
      "campaign": attrc7cwBX3M5SL06C.campaign ?? "",
      "adgroup": attrc7cwBX3M5SL06C.adgroup ?? "",
      "creative": attrc7cwBX3M5SL06C.creative ?? "",
      "clickLabel": attrc7cwBX3M5SL06C.clickLabel ?? "",
      "costType": attrc7cwBX3M5SL06C.costType ?? "",
      "costAmount": attrc7cwBX3M5SL06C.costAmount ?? 0,
      "costCurrency": attrc7cwBX3M5SL06C.costCurrency ?? "",
    ]

    if let TtGPPSMBKQKhyF = try? JSONSerialization.data(withJSONObject: dict),
      let json = String(data: TtGPPSMBKQKhyF, encoding: .utf8)
    {
      return json
    }

    return "{}"
  }
#endif
