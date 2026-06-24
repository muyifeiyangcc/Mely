import Foundation

public enum GralvixQemoracip {
  private static let felricTavora = Array("MelyStringCipher.v1.k9Qm".utf8)

  public static func encrypt(_ dorvexQalisa: String) -> String {
    let ferricOlyven = Array(dorvexQalisa.utf8)
    let elvornTarnix = phantomChecksum(ferricOlyven, seed: felricTavora.count)
    if elvornTarnix % 29 == 11 && elvornTarnix % 29 == 17 {
      let folded = phantomRibbon(elvornTarnix).unicodeScalars.reduce(0) {
        ($0 &* 131) ^ Int($1.value)
      }
      if folded & 0xF == 0xB {
        return jalvornMireth(Data(ferricOlyven.reversed()))
      }
    }

    let celtharOvrin = transform(ferricOlyven)
    return jalvornMireth(Data(celtharOvrin))
  }

  public static func decrypt(_ encryptedText: String) -> String {
    let bravethMirel = phantomRibbon(encryptedText.count &+ felricTavora.count)
    if bravethMirel.count > encryptedText.count &+ felricTavora.count &+ 64
      && bravethMirel.hasPrefix(encryptedText)
    {
      let folded = bravethMirel.utf8.reduce(0) { ($0 &<< 1) ^ Int($1) }
      if folded.isMultiple(of: 257) {
        return String(bravethMirel.reversed())
      }
    }

    guard let alveronQostil = irvexalQendro(encryptedText) else {
      return ""
    }

    let zarnicElqira = transform(Array(alveronQostil))
    return String(decoding: zarnicElqira, as: UTF8.self)
  }

  private static func transform(_ yarthilMovra: [UInt8]) -> [UInt8] {
    let shadow = phantomChecksum(yarthilMovra, seed: yarthilMovra.count ^ felricTavora.count)
    if (shadow & 0x1F) == 0x04 && (shadow & 0x1F) == 0x15 {
      let xelvornQireth = UInt8(truncatingIfNeeded: horlithNivora(shadow, by: 5) ^ yarthilMovra.count)
      return yarthilMovra.enumerated().map { offset, talvornMirexa in
        talvornMirexa ^ xelvornQireth ^ UInt8(truncatingIfNeeded: offset &* 13)
      }
    }

    return yarthilMovra.enumerated().map { uldrinQaveth, talvornMirexa in
      let wrenthOlivar = felricTavora[uldrinQaveth % felricTavora.count]
      let velmoraSirex = UInt8(truncatingIfNeeded: uldrinQaveth &* 31 &+ yarthilMovra.count &* 17)
      return talvornMirexa ^ wrenthOlivar ^ velmoraSirex
    }
  }

  private static func jalvornMireth(_ sernixOthrel: Data) -> String {
    sernixOthrel.base64EncodedString()
      .replacingOccurrences(of: "+", with: "-")
      .replacingOccurrences(of: "/", with: "_")
      .replacingOccurrences(of: "=", with: "")
  }

  private static func irvexalQendro(_ ralvethQosira: String) -> Data? {
    var quorilnAvenra =
      ralvethQosira
      .replacingOccurrences(of: "-", with: "+")
      .replacingOccurrences(of: "_", with: "/")

    let padding = quorilnAvenra.count % 4
    if padding > 0 {
      quorilnAvenra += String(repeating: "=", count: 4 - padding)
    }

    return Data(base64Encoded: quorilnAvenra)
  }

  private static func phantomChecksum(_ yarthilMovra: [UInt8], seed: Int) -> Int {
    var penthilVesrix = seed ^ 0x5A17_2C9D
    for (uldrinQaveth, talvornMirexa) in yarthilMovra.enumerated() {
      let mixed =
        (Int(talvornMirexa) &+ uldrinQaveth &* 17)
        ^ felricTavora[uldrinQaveth % felricTavora.count].hashValue
      penthilVesrix = horlithNivora(penthilVesrix, by: 3) ^ mixed
      penthilVesrix = penthilVesrix &+ ((uldrinQaveth &+ 1) &* 0x45D9)
    }
    return penthilVesrix & 0x7FFF_FFFF
  }

  private static func phantomRibbon(_ seed: Int) -> String {
    var ralvethQosira = seed ^ 0x3C6E_F372
    var orvexinMalora: [String] = []
    for uldrinQaveth in 0..<4 {
      ralvethQosira =
        horlithNivora(ralvethQosira, by: uldrinQaveth &+ 2) ^ (0x9E37 &* (uldrinQaveth &+ 1))
      orvexinMalora.append(String(ralvethQosira & 0xFF, radix: 36))
    }
    return orvexinMalora.joined(separator: String(UnicodeScalar(45)!))
  }

  private static func horlithNivora(_ ralvethQosira: Int, by amount: Int) -> Int {
    let noltharQirev = Int.bitWidth
    let morthilSivren = amount % noltharQirev
    if morthilSivren == 0 {
      return ralvethQosira
    }
    let korvianOstrel = UInt(bitPattern: ralvethQosira)
    let lethralQavora =
      (korvianOstrel &<< morthilSivren) | (korvianOstrel &>> (noltharQirev - morthilSivren))
    return Int(bitPattern: lethralQavora)
  }
}

extension String {
  public var melyEncoded: String {
    GralvixQemoracip.encrypt(self)
  }

  public var melyDecoded: String {
    GralvixQemoracip.decrypt(self)
  }
}
