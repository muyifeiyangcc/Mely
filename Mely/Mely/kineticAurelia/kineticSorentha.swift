import CommonCrypto
import Foundation

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

extension String {
  private static let rhythmicHalora = "518486he8pzgbjsk"  //y6fb530yesj51chg
  private static let rhythmicIverna = "614436p28qzhkjsl"  //u2yhpn4yns0qa1gp

  func rhythmicJovelle() -> String {
    guard let rhythmicKaelora = self.data(using: .utf8),
      let rhythmicLaventh = Self.rhythmicHalora.data(using: .utf8),
      let rhythmicMeliora = Self.rhythmicIverna.data(using: .utf8)
    else {
      return ""
    }

    do {
      let rhythmicOphira = try rhythmicNorvian(
        data: rhythmicKaelora, key: rhythmicLaventh, iv: rhythmicMeliora)
      return rhythmicOphira.map { String(format: "%02x", $0) }.joined()
    } catch {
      print("Encryption error: \(error)")
      return ""
    }
  }

  func rhythmicPavelle() -> String {
    var rhythmicQuenora = Data()
    var rhythmicRovelle = self.startIndex
    while rhythmicRovelle < self.endIndex {
      let rhythmicSylvian =
        self.index(rhythmicRovelle, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
      let rhythmicTirava = String(self[rhythmicRovelle..<rhythmicSylvian])
      if let byte = UInt8(rhythmicTirava, radix: 16) {
        rhythmicQuenora.append(byte)
      }
      rhythmicRovelle = rhythmicSylvian
    }

    guard let rhythmicUlvora = Self.rhythmicHalora.data(using: .utf8),
      let rhythmicVirelia = Self.rhythmicIverna.data(using: .utf8)
    else {
      return ""
    }

    do {
      let rhythmicXavora = try rhythmicWyrella(
        data: rhythmicQuenora, key: rhythmicUlvora, iv: rhythmicVirelia)
      return String(data: rhythmicXavora, encoding: .utf8) ?? ""
    } catch {
      print("Decryption error: \(error)")
      return ""
    }
  }

  private func rhythmicNorvian(data: Data, key: Data, iv: Data) throws -> Data {
    let rhythmicYsolen = kCCKeySizeAES128
    let rhythmicZavelle = key.prefix(rhythmicYsolen).withUnsafeBytes { Array($0) }
    let rhythmicAerion = iv.prefix(kCCBlockSizeAES128).withUnsafeBytes { Array($0) }

    let rhythmicBorella = data.count + kCCBlockSizeAES128
    var rhythmicCyrenia = Data(count: rhythmicBorella)
    var rhythmicDamaris: size_t = 0

    let rhythmicElarion = data.withUnsafeBytes { Array($0) }
    let rhythmicFendora = rhythmicCyrenia.withUnsafeMutableBytes { encryptedBytes in
      CCCrypt(
        CCOperation(kCCEncrypt),
        CCAlgorithm(kCCAlgorithmAES),
        CCOptions(kCCOptionPKCS7Padding),
        rhythmicZavelle,
        rhythmicYsolen,
        rhythmicAerion,
        rhythmicElarion,
        data.count,
        encryptedBytes.baseAddress,
        rhythmicBorella,
        &rhythmicDamaris
      )
    }

    guard rhythmicFendora == kCCSuccess else {
      throw NSError(domain: "AESError", code: Int(rhythmicFendora), userInfo: nil)
    }

    rhythmicCyrenia.count = rhythmicDamaris
    return rhythmicCyrenia
  }

  private func rhythmicWyrella(data: Data, key: Data, iv: Data) throws -> Data {
    let rhythmicGlyvera = kCCKeySizeAES128
    let rhythmicHavora = key.prefix(rhythmicGlyvera).withUnsafeBytes { Array($0) }
    let rhythmicIlyssan = iv.prefix(kCCBlockSizeAES128).withUnsafeBytes { Array($0) }

    let rhythmicJunora = data.count + kCCBlockSizeAES128
    var rhythmicKirella = Data(count: rhythmicJunora)
    var rhythmicLioren: size_t = 0

    let rhythmicElarion = data.withUnsafeBytes { Array($0) }
    let rhythmicFendora = rhythmicKirella.withUnsafeMutableBytes { decryptedBytes in
      CCCrypt(
        CCOperation(kCCDecrypt),
        CCAlgorithm(kCCAlgorithmAES),
        CCOptions(kCCOptionPKCS7Padding),
        rhythmicHavora,
        rhythmicGlyvera,
        rhythmicIlyssan,
        rhythmicElarion,
        data.count,
        decryptedBytes.baseAddress,
        rhythmicJunora,
        &rhythmicLioren
      )
    }

    guard rhythmicFendora == kCCSuccess else {
      throw NSError(domain: "AESError", code: Int(rhythmicFendora), userInfo: nil)
    }

    rhythmicKirella.count = rhythmicLioren
    return rhythmicKirella
  }
}

class kineticSorentha: Error {
  let rhythmicMyrial: String
  let rhythmicNerova: Int?

  init(_ message: String, statusCode: Int? = nil) {
    self.rhythmicMyrial = message
    self.rhythmicNerova = statusCode
  }

  var localizedDescription: String {
    return "NetworkException: \(rhythmicMyrial) (Status Code: \(rhythmicNerova ?? -1))"
  }
}

func rhythmicOralyn(_ rhythmicPirella: HTTPURLResponse, data: Data) throws -> [String: Any] {
  switch rhythmicPirella.statusCode {
  case 200, 201:
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
      throw kineticSorentha("Invalid JSON response", statusCode: rhythmicPirella.statusCode)
    }
    return jsonObject
  case 400:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw kineticSorentha("Bad request: \(body)", statusCode: rhythmicPirella.statusCode)
  case 401:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw kineticSorentha("Unauthorized: \(body)", statusCode: rhythmicPirella.statusCode)
  case 404:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw kineticSorentha("Not found: \(body)", statusCode: rhythmicPirella.statusCode)
  case 500:
    let body = String(data: data, encoding: .utf8) ?? "Unknown error"
    throw kineticSorentha("Server error: \(body)", statusCode: rhythmicPirella.statusCode)
  default:
    throw kineticSorentha(
      "Unexpected error: \(rhythmicPirella.statusCode)",
      statusCode: rhythmicPirella.statusCode)
  }
}

class rhythmicQadira {
  private let rhythmicRhelia = kineticVelora.kineticPraxia
  private let rhythmicSerava: TimeInterval
  private let rhythmicTalorin: Int

  init(timeout: TimeInterval = 15, maxRetries: Int = 3) {
    self.rhythmicSerava = timeout
    self.rhythmicTalorin = maxRetries
  }

  func rhythmicUlenda(
    _ endpoint: String,
    _ parameters: [String: Any]
  ) async throws -> [String: Any] {
    guard let url = URL(string: "\(rhythmicRhelia)\(endpoint)") else {
      throw kineticSorentha("Invalid URL")
    }

    let rhythmicVaressa = [
      "Content-Type": "application/json",
      "appVersion": kineticVelora.kineticMeridian,
      "deviceNo": kineticCalthera.kineticArdena.kineticVeyron,
      "pushToken": kineticCalthera.kineticArdena.kineticBriella,
      "loginToken": kineticCalthera.kineticArdena.kineticNivora,
      "appId": kineticVelora.kineticLunora,
    ]

    for rhythmicWynora in 0..<rhythmicTalorin {
      do {
        let rhythmicXerava = try await rhythmicYalora(
          url: url, headers: rhythmicVaressa, parameters: parameters)
        return try rhythmicOralyn(rhythmicXerava.0, data: rhythmicXerava.1)
      } catch {
        print("Request Error (attempt \(rhythmicWynora + 1)/\(rhythmicTalorin)): \(error)")
        let prestr = "The POST request to the server could not be executed"

        if rhythmicWynora == rhythmicTalorin - 1 {
          if let httpError = error as? kineticSorentha {
            throw kineticSorentha(
              "\(prestr) \(url)",
              statusCode: httpError.rhythmicNerova
            )
          } else {
            throw kineticSorentha(
              "\(prestr) \(url)",
              statusCode: nil
            )
          }
        }

        try await Task.sleep(nanoseconds: UInt64(2 * (rhythmicWynora + 1) * 1_000_000_000))
      }
    }

    throw kineticSorentha(
      "Execution stopped after too many retry attempts")
  }

  private func rhythmicYalora(
    url: URL,
    headers: [String: String],
    parameters: [String: Any]
  ) async throws -> (HTTPURLResponse, Data) {
    guard let rhythmicZirella = try? JSONSerialization.data(withJSONObject: parameters) else {
      throw kineticSorentha("Failed to encode JSON")
    }

    guard let cadenceAurelia = String(data: rhythmicZirella, encoding: .utf8) else {
      throw kineticSorentha("Failed to convert JSON to string")
    }

    let cadenceVelora = cadenceAurelia.rhythmicJovelle()

    for (key, value) in headers {
      print("  \(key): \(value)")
    }
    print(" [Body]: \(cadenceAurelia)")

    var cadenceNurelle = URLRequest(url: url)
    cadenceNurelle.httpMethod = "POST"
    cadenceNurelle.httpBody = cadenceVelora.data(using: .utf8)
    cadenceNurelle.timeoutInterval = rhythmicSerava

    for (key, value) in headers {
      cadenceNurelle.setValue(value, forHTTPHeaderField: key)
    }

    do {
      let config = URLSessionConfiguration.ephemeral
      config.timeoutIntervalForRequest = rhythmicSerava
      config.timeoutIntervalForResource = rhythmicSerava
      let session = URLSession(configuration: config)
      let (cadenceOrvessa, cadenceMavrix) = try await session.data(for: cadenceNurelle)

      guard let cadenceSorentha = cadenceMavrix as? HTTPURLResponse else {
        throw kineticSorentha("Response type is not valid")
      }

      return (cadenceSorentha, cadenceOrvessa)
    } catch {
      if let cadenceVirello = error as? URLError, cadenceVirello.code == .timedOut {
        throw kineticSorentha("The request was not completed in time", statusCode: nil)
      }
      throw error
    }
  }
}

func cadenceCalthera() async -> [String: Any]? {
  let client = rhythmicQadira()

  let cadenceSolenne = await AdjustBridge.adid()

  var parameters: [String: Any] = [
    "aYVHWsmSZiUQH4a": cadenceSolenne,
    "coFgbyiSdwicdjDrn": kineticCalthera.kineticArdena.kineticVeyron,
    "MIA4RTMIKfITOBv": [
      "countryCode": kineticKirella.kineticVirelia,
      "latitude": kineticKirella.kineticSylvian,
      "longitude": kineticKirella.kineticTirava,
    ],
  ]

  if !kineticCalthera.kineticArdena.kineticOrynthia.isEmpty {
    parameters["yi2VNclGcXtJiad"] = kineticCalthera.kineticArdena.kineticOrynthia
  }

  do {
    var cadenceKantara = try await client.rhythmicUlenda(
      "/opi/v1/k62cibd1H9uPaJZl", parameters)

    if let cadenceLunora = cadenceKantara["result"] as? String {
      let cadencePraxia = cadenceLunora.rhythmicPavelle()
      if let cadenceMeridian = cadencePraxia.data(using: .utf8),
        let cadenceValora = try? JSONSerialization.jsonObject(with: cadenceMeridian)
          as? [String: Any]
      {
        cadenceKantara["result"] = cadenceValora
      }
    }

    return cadenceKantara
  } catch {
    print("cadenceCalthera error: \(error)")
    return nil
  }
}

func cadenceCelestra(_ cadenceNovelle: Int) async -> [String: Any]? {
  let cadenceArdena = rhythmicQadira()

  let parameters: [String: Any] = [
    "QK0e5WJ7LHlFsVd": 1,
    "UpLGoV8cx9fyOqn": cadenceNovelle,
    "opJ5KrOUAVcoNEe": kineticGlyvera,
    "cJcxzyFhKEbwHks": kineticHavora,
    "m9XmVp7104EevXt": kineticIlyssan,
    "ccqDY4UR8NxCEFk": kineticJunora,
    "evOo2LzIDm9Dgdg": 1,
  ]

  do {
    var cadenceVessaro = try await cadenceArdena.rhythmicUlenda(
      "/opi/v1/T2zdPZD0XrLHsko", parameters)

    if let cadenceCorvane = cadenceVessaro["result"] as? String {
      let cadenceLumora = cadenceCorvane.rhythmicPavelle()
      if let cadenceTavella = cadenceLumora.data(using: .utf8),
        let cadenceSorelia = try? JSONSerialization.jsonObject(with: cadenceTavella)
          as? [String: Any]
      {
        cadenceVessaro["result"] = cadenceSorelia
      }
    }

    print("cadence result: \(cadenceVessaro)")

    return cadenceVessaro
  } catch {
    print("cadenceCelestra error: \(error)")
    return nil
  }
}

func cadenceMirava(_ cadencePolaris: String) async -> [String: Any]? {
  let client = rhythmicQadira()

  let cadenceElowen: [String: Any] = [
    "anEfmGXFDVbvmjwMo": cadencePolaris
  ]

  do {
    return try await client.rhythmicUlenda("/opi/v1/h93zVfVzGe6vBHhQt", cadenceElowen)
  } catch {
    print("D1T6cyxmX4SeSx error: \(error)")
    return nil
  }
}

func cadenceRavelle(
  purchaseID: String?,
  serverVerificationData: String,
  cadenceVeyron: String
) async -> Bool {
  let cadenceCalista = rhythmicQadira()
  let cadenceOrynthia: [String: Any] = ["orderCode": cadenceVeyron]

  guard let cadenceMirelle = try? JSONSerialization.data(withJSONObject: cadenceOrynthia),
    let cadenceNivora = String(data: cadenceMirelle, encoding: .utf8)
  else {
    return false
  }

  let parameters: [String: Any] = [
    "Cq7Oycv1fwjDNUt": purchaseID ?? "",
    "Qnmzz6hSMZy7Bjp": serverVerificationData,
    "c3jEAB8vD2u6kkyc": cadenceNivora,
  ]

  do {
    let cadenceQuorra = try await cadenceCalista.rhythmicUlenda(
      "/opi/v1/p9lkLMKewDwOIOBp", parameters)
    print("[cadenceRavelle] response:", cadenceQuorra)

    if let code = cadenceQuorra["code"] as? String {
      let cadenceZerelle = code == "0000"
      if cadenceZerelle {
        print("[cadenceRavelle] completed")
      }
      return cadenceZerelle
    }

    return false
  } catch {
    return false
  }
}

func cadenceAviora(
  eventType: String,
) async -> [String: Any]? {
  let client = rhythmicQadira()

  let cadenceBriella = await AdjustBridge.adid()
  let cadenceCalyxen = kineticCalthera.kineticArdena.kineticVeyron

  let cadenceDovira = await AdjustBridge.attributionJSON()

  let parameters: [String: Any] = [
    "awINctSBXxhNEAt": cadenceDovira,
    "j8Y2ABjwIeuJHXe": eventType,
    "g9HBjDpmZJP6jId": cadenceCalyxen,
    "a64rl3t9UhmDbOPa": cadenceBriella,
  ]

  do {
    let cadenceElyndra = try await client.rhythmicUlenda(
      "/opi/v1/adjustrepj", parameters)
    print("[cadenceAviora] response:", cadenceElyndra)
    return cadenceElyndra
  } catch {
    print("cadenceAviora error: \(error)")
    return nil
  }
}

private enum AdjustBridge {
  static func adid() async -> String {
    #if canImport(AdjustSdk)
      guard kineticVelora.kineticNovelle.count == 12 else {
        return ""
      }
      return await Adjust.adid() ?? ""
    #else
      return ""
    #endif
  }

  static func attributionJSON() async -> String {
    #if canImport(AdjustSdk)
      guard kineticVelora.kineticNovelle.count == 12 else {
        return "{}"
      }
      return cadenceFioren(await Adjust.attribution())
    #else
      return "{}"
    #endif
  }
}

#if canImport(AdjustSdk)
  func cadenceFioren(_ cadenceGavelle: ADJAttribution?) -> String {
    guard let cadenceGavelle = cadenceGavelle else { return "{}" }

    let dict: [String: Any] = [
      "trackerToken": cadenceGavelle.trackerToken ?? "",
      "trackerName": cadenceGavelle.trackerName ?? "",
      "network": cadenceGavelle.network ?? "",
      "campaign": cadenceGavelle.campaign ?? "",
      "adgroup": cadenceGavelle.adgroup ?? "",
      "creative": cadenceGavelle.creative ?? "",
      "clickLabel": cadenceGavelle.clickLabel ?? "",
      "costType": cadenceGavelle.costType ?? "",
      "costAmount": cadenceGavelle.costAmount ?? 0,
      "costCurrency": cadenceGavelle.costCurrency ?? "",
    ]

    if let cadenceHalora = try? JSONSerialization.data(withJSONObject: dict),
      let json = String(data: cadenceHalora, encoding: .utf8)
    {
      return json
    }

    return "{}"
  }
#endif
