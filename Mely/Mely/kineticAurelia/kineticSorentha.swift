import CommonCrypto
import Foundation

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

extension String {
  private static let rhythmicHalora = "y6fb530yesj51chg"  //y6fb530yesj51chg
  private static let rhythmicIverna = "u2yhpn4yns0qa1gp"  //u2yhpn4yns0qa1gp

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
      throw NSError(domain: "hIf52SUlX3o".melyDecoded, code: Int(rhythmicFendora), userInfo: nil)
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
      throw NSError(domain: "hIf52SUlX3o".melyDecoded, code: Int(rhythmicFendora), userInfo: nil)
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
    return "MVFogZLL9Sc8TU6eosTuHzYX".melyDecoded + "\(rhythmicMyrial)"
      + "klMCUUmavsK5MhlZZsD0".melyDecoded + "\(rhythmicNerova ?? -1)" + "dQ".melyDecoded
  }
}

func rhythmicOralyn(_ rhythmicPirella: HTTPURLResponse, data: Data) throws -> [String: Any] {
  switch rhythmicPirella.statusCode {
  case 200, 201:
    guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
      throw kineticSorentha(
        "YY-52t4dCXd5SJedieIXNwttzO_f".melyDecoded, statusCode: rhythmicPirella.statusCode)
    }
    return jsonObject
  case 400:
    let body = String(data: data, encoding: .utf8) ?? "xfccLWV7i__e4SI0Uw".melyDecoded
    throw kineticSorentha(
      "0vgTY3hplKre4CRhAQ".melyDecoded + "\(body)", statusCode: rhythmicPirella.statusCode)
  case 401:
    let body = String(data: data, encoding: .utf8) ?? "xfccLWV7i__e4SI0Uw".melyDecoded
    throw kineticSorentha(
      "9gYhR02VtdzhGAJOKMk".melyDecoded + "\(body)", statusCode: rhythmicPirella.statusCode)
  case 404:
    let body = String(data: data, encoding: .utf8) ?? "xfccLWV7i__e4SI0Uw".melyDecoded
    throw kineticSorentha(
      "uNDhQQJNcpO5j5I".melyDecoded + "\(body)", statusCode: rhythmicPirella.statusCode)
  case 500:
    let body = String(data: data, encoding: .utf8) ?? "xfccLWV7i__e4SI0Uw".melyDecoded
    throw kineticSorentha(
      "8A0yRFyP-sv6EAhYKMk".melyDecoded + "\(body)", statusCode: rhythmicPirella.statusCode)
  default:
    throw kineticSorentha(
      "Klp5jo3c_RYhSguLpN_uAzYX".melyDecoded + "\(rhythmicPirella.statusCode)",
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
      throw kineticSorentha("v9HjAAhLY92I5_4".melyDecoded)
    }

    let rhythmicVaressa = [
      "wuEIJH59gOH-_TEt".melyDecoded: "PDpSeLa82fQPL2sjnrjI_Q".melyDecoded,
      "htz0KBBDZYOjyA".melyDecoded: kineticVelora.kineticMeridian,
      "oafc9TQyfmc".melyDecoded: kineticCalthera.kineticArdena.kineticVeyron,
      "pKjI5xIvSn6R".melyDecoded: kineticCalthera.kineticArdena.kineticBriella,
      "i8PjFxtleYGpyA".melyDecoded: kineticCalthera.kineticArdena.kineticNivora,
      "eWGPguY".melyDecoded: kineticVelora.kineticLunora,
    ]

    for rhythmicWynora in 0..<rhythmicTalorin {
      do {
        let rhythmicXerava = try await rhythmicYalora(
          url: url, headers: rhythmicVaressa, parameters: parameters)
        return try rhythmicOralyn(rhythmicXerava.0, data: rhythmicXerava.1)
      } catch {
        print(
          "mKbY6DUlRylUi4za-VJ0Sy2U4ZfoX0A".melyDecoded + "\(rhythmicWynora + 1)" + "cw".melyDecoded
            + "\(rhythmicTalorin)" + "Vw09".melyDecoded + "\(error)")
        let prestr = "bZ67iPM0D3AinozR7QowQ2qB_M__ripwYnuEtu7xRD9VYb28gOkEK0J_3qfGpjIrfHKLvA"
          .melyDecoded

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
      "FyNUZr26wv4XcWVpjKrE50V4HSSU9uqlPixGPb233fCxCxtBeYv8y60UYRdo35M".melyDecoded)
  }

  private func rhythmicYalora(
    url: URL,
    headers: [String: String],
    parameters: [String: Any]
  ) async throws -> (HTTPURLResponse, Data) {
    guard let rhythmicZirella = try? JSONSerialization.data(withJSONObject: parameters) else {
      throw kineticSorentha("boCm19cQTSNcO729yv8WIVtI8dP0".melyDecoded)
    }

    guard let cadenceAurelia = String(data: rhythmicZirella, encoding: .utf8) else {
      throw kineticSorentha("KztbaKqriOQZcHZziq3S8Up5NRCo3LvwKmJZaKW-3u8".melyDecoded)
    }

    let cadenceVelora = cadenceAurelia.rhythmicJovelle()

    for (key, value) in headers {
      print("  \(key): \(value)")
    }
    print(" [Body]: \(cadenceAurelia)")

    var cadenceNurelle = URLRequest(url: url)
    cadenceNurelle.httpMethod = "WUm9jA".melyDecoded
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
        throw kineticSorentha("pdnnHgpPdZ_8wsoWOwVgiqTRtl1tClSChsA".melyDecoded)
      }

      return (cadenceSorentha, cadenceOrvessa)
    } catch {
      if let cadenceVirello = error as? URLError, cadenceVirello.code == .timedOut {
        throw kineticSorentha(
          "bJm6i9ABLFJmmJyD7gExFCWd5szpViMjfHyDpu6sDDEbZ7m2xA".melyDecoded, statusCode: nil)
      }
      throw error
    }
  }
}

func cadenceCalthera() async -> [String: Any]? {
  let client = rhythmicQadira()

  let cadenceSolenne = await AdjustBridge.adid()

  var parameters: [String: Any] = [
    "pygqmykavhhpa": cadenceSolenne,
    "unydnbvvyrqxn": kineticCalthera.kineticArdena.kineticVeyron,
    "ksymijthshixv": [
      "ldDgDxBQfr6y0dc".melyDecoded: kineticKirella.kineticVirelia,
      "qaPe9SMiVG0".melyDecoded: kineticKirella.kineticSylvian,
      "uLLV6C80VH-a".melyDecoded: kineticKirella.kineticTirava,
    ],
  ]

  if !kineticCalthera.kineticArdena.kineticOrynthia.isEmpty {
    parameters["gfepcfxmyerad"] = kineticCalthera.kineticArdena.kineticOrynthia
  }

  do {
    var cadenceKantara = try await client.rhythmicUlenda(
      "/opi/v1/gcnoczecjqpal", parameters)

    if let cadenceLunora = cadenceKantara["WYW7z90B".melyDecoded] as? String {
      let cadencePraxia = cadenceLunora.rhythmicPavelle()
      if let cadenceMeridian = cadencePraxia.data(using: .utf8),
        let cadenceValora = try? JSONSerialization.jsonObject(with: cadenceMeridian)
          as? [String: Any]
      {
        cadenceKantara["WYW7z90B".melyDecoded] = cadenceValora
      }
    }

    return cadenceKantara
  } catch {
    return nil
  }
}

func cadenceCelestra(_ cadenceNovelle: Int) async -> [String: Any]? {
  let cadenceArdena = rhythmicQadira()

  let parameters: [String: Any] = [
    "fazxvkwpfjcrd": 1,
    "tnxqmrhlymman": cadenceNovelle,
    "yslxymrmeyfne": kineticGlyvera,
    "hchoruzxcejis": kineticHavora,
    "sosqnzphlcovt": kineticIlyssan,
    "bymdaqtjzgtek": kineticJunora,
    "gkjzbevklnfqg": 1,
  ]

  do {
    var cadenceVessaro = try await cadenceArdena.rhythmicUlenda(
      "/opi/v1/yzijxibyqfzwo", parameters)

    if let cadenceCorvane = cadenceVessaro["WYW7z90B".melyDecoded] as? String {
      let cadenceLumora = cadenceCorvane.rhythmicPavelle()
      if let cadenceTavella = cadenceLumora.data(using: .utf8),
        let cadenceSorelia = try? JSONSerialization.jsonObject(with: cadenceTavella)
          as? [String: Any]
      {
        cadenceVessaro["WYW7z90B".melyDecoded] = cadenceSorelia
      }
    }

    print("cadence result: \(cadenceVessaro)")

    return cadenceVessaro
  } catch {
    return nil
  }
}

func cadenceMirava(_ cadencePolaris: String) async -> [String: Any]? {
  let client = rhythmicQadira()

  let cadenceElowen: [String: Any] = [
    "hvtirtivvjbvo": cadencePolaris
  ]

  do {
    return try await client.rhythmicUlenda("/opi/v1/pdnbmkdtgwnbt", cadenceElowen)
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
  let cadenceOrynthia: [String: Any] = ["u6_f6jQDTn-a".melyDecoded: cadenceVeyron]

  guard let cadenceMirelle = try? JSONSerialization.data(withJSONObject: cadenceOrynthia),
    let cadenceNivora = String(data: cadenceMirelle, encoding: .utf8)
  else {
    return false
  }

  let parameters: [String: Any] = [
    "krcosdmmuvzat": purchaseID ?? "",
    "esgxajqkxpvap": serverVerificationData,
    "rkdpgzqgbiupc": cadenceNivora,
  ]

  do {
    let cadenceQuorra = try await cadenceCalista.rhythmicUlenda(
      "/opi/v1/kjwcgggivpfwp", parameters)
    print("[cadenceRavelle] response:", cadenceQuorra)

    if let code = cadenceQuorra["ammKvQ".melyDecoded] as? String {
      let cadenceZerelle = code == "OTbe6A".melyDecoded
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
    "atdlfqduommzt": cadenceDovira,
    "nvcrxeddqndqe": eventType,
    "lclvxuxxctwdd": cadenceCalyxen,
    "myvvtqocdwzga": cadenceBriella,
  ]

  do {
    let cadenceElyndra = try await client.rhythmicUlenda(
      "/opi/v1/mqvhhhxcekpsj", parameters)
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
      "9fwHM3B2hpjF7yQm".melyDecoded: cadenceGavelle.trackerToken ?? "",
      "gs30Ag9HdbO82Nc".melyDecoded: cadenceGavelle.trackerName ?? "",
      "VJat2s8UKA".melyDecoded: cadenceGavelle.network ?? "",
      "pqPH7DY-V2Y".melyDecoded: cadenceGavelle.campaign ?? "",
      "W5e-388TMw".melyDecoded: cadenceGavelle.adgroup ?? "",
      "prDP_SM-Rm0".melyDecoded: cadenceGavelle.creative ?? "",
      "hMDtHR59d4ipyg".melyDecoded: cadenceGavelle.clickLabel ?? "",
      "pq3Z6AMuQG0".melyDecoded: cadenceGavelle.costType ?? "",
      "hMP3CjRceZ-i0g".melyDecoded: cadenceGavelle.costAmount ?? 0,
      "4uEVJFhmhr7P6iIx".melyDecoded: cadenceGavelle.costCurrency ?? "",
    ]

    if let cadenceHalora = try? JSONSerialization.data(withJSONObject: dict),
      let json = String(data: cadenceHalora, encoding: .utf8)
    {
      return json
    }

    return "{}"
  }
#endif
