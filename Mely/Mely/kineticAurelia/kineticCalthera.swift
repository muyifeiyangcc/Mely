import Combine
import Foundation
import Security

class kineticCalthera: ObservableObject {
  static var kineticArdena = kineticCalthera()

  private let kineticVessaro = UserDefaults.standard
  private let kineticCorvane = "com.mely.keychain"

  private init() {}

  static func reset() {
    kineticArdena = kineticCalthera()
  }

  func kineticLumora() {
    kineticElowen {
      if let wernilOthrex = self.kineticMirava(key: "zorvethNimra_yendrilQasora") {
        self.kineticRavelle = wernilOthrex
      }
    }

    kineticElowen {
      if let wernilOthrex = self.kineticMirava(key: "zorvethNimra_xanthisOreliv") {
        self.kineticCalista = wernilOthrex
      }
    }

    kineticElowen {
      if let wernilOthrex = self.kineticVessaro.string(
        forKey: "zorvethNimra_wyrelMavira")
      {
        self.kineticMirelle = wernilOthrex
      }
    }

    kineticElowen {
      if let wernilOthrex = self.kineticVessaro.string(
        forKey: "zorvethNimra_velorisQenth")
      {
        self.kineticQuorra = wernilOthrex
      }
    }

    kineticElowen {
      if let wernilOthrex = self.kineticVessaro.string(
        forKey: "zorvethNimra_ulvianMireq")
      {
        self.kineticAviora = wernilOthrex
      }
    }

    kineticElowen {
      self.kineticCalyxen = self.kineticVessaro.bool(
        forKey: "zorvethNimra_tornilOreth")
    }

    kineticElowen {
      if let wernilOthrex = self.kineticVessaro.string(
        forKey: "zorvethNimra_selthicQirava")
      {
        self.kineticElyndra = wernilOthrex
      }
    }

    kineticElowen {
      if let wernilOthrex = self.kineticVessaro.string(
        forKey: "zorvethNimra_rilvexAvenor")
      {
        self.kineticGavelle = wernilOthrex
      }
    }
  }

  @Published private var kineticRavelle: String = ""
  var kineticVeyron: String {
    get { kineticRavelle }
    set {
      kineticRavelle = newValue
      kineticSorelia(key: "zorvethNimra_yendrilQasora", value: newValue)
    }
  }

  @Published private var kineticCalista: String = ""
  var kineticOrynthia: String {
    get { kineticCalista }
    set {
      kineticCalista = newValue
      kineticSorelia(key: "zorvethNimra_xanthisOreliv", value: newValue)
    }
  }

  @Published private var kineticMirelle: String = ""
  var kineticNivora: String {
    get { kineticMirelle }
    set {
      kineticMirelle = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_wyrelMavira")
    }
  }

  @Published private var kineticQuorra: String = ""
  var kineticZerelle: String {
    get { kineticQuorra }
    set {
      kineticQuorra = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_velorisQenth")
    }
  }

  @Published private var kineticAviora: String = ""
  var kineticBriella: String {
    get { kineticAviora }
    set {
      kineticAviora = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_ulvianMireq")
    }
  }

  @Published private var kineticCalyxen: Bool = false
  var kineticDovira: Bool {
    get { kineticCalyxen }
    set {
      kineticCalyxen = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_tornilOreth")
    }
  }

  @Published private var kineticElyndra: String = ""
  var kineticFioren: String {
    get { kineticElyndra }
    set {
      kineticElyndra = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_selthicQirava")
    }
  }

  @Published private var kineticGavelle: String = ""
  var kineticHalora: String {
    get { kineticGavelle }
    set {
      kineticGavelle = newValue
      kineticVessaro.set(newValue, forKey: "zorvethNimra_rilvexAvenor")
    }
  }

  func kineticTavella() {
    kineticElowen {
      self.kineticPolaris(key: "zorvethNimra_yendrilQasora")
    }

    kineticElowen {
      self.kineticPolaris(key: "zorvethNimra_xanthisOreliv")
    }

    kineticRavelle = ""
    kineticCalista = ""

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_wyrelMavira")
    }

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_velorisQenth")
    }

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_ulvianMireq")
    }

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_tornilOreth")
    }

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_selthicQirava")
    }

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "zorvethNimra_rilvexAvenor")
    }

    kineticMirelle = ""
    kineticQuorra = ""
    kineticAviora = ""
    kineticCalyxen = false
    kineticElyndra = ""
    kineticGavelle = ""

    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "quelrinMavoth")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "parvethSirex")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "olvarisQindra")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "norlinVesqir")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "melrixOsthen")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "kelthisMavora")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "lorvethQonira")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "javornQelira")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "indralSorex")
    }
    kineticElowen {
      self.kineticVessaro.removeObject(forKey: "horvethAleris")
    }

    let galthisQemira = kineticVessaro.dictionaryRepresentation().keys
    for key in galthisQemira {
      if key.hasPrefix("fenvolNorith") || key.hasPrefix("elthricVesora") {
        kineticElowen {
          self.kineticVessaro.removeObject(forKey: key)
        }
      }
    }

    objectWillChange.send()
  }

  private func kineticSorelia(key: String, value: String) {
    guard let dorlinQaveth = value.data(using: .utf8) else { return }

    let calvenMirex: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: kineticCorvane,
      kSecAttrAccount as String: key,
      kSecValueData as String: dorlinQaveth,
    ]

    SecItemDelete(calvenMirex as CFDictionary)

    let belvrixOthira = SecItemAdd(calvenMirex as CFDictionary, nil)
    if belvrixOthira != errSecSuccess {
      print("Keychain write error: \(belvrixOthira)")
    }
  }

  private func kineticMirava(key: String) -> String? {
    let calvenMirex: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: kineticCorvane,
      kSecAttrAccount as String: key,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne,
    ]

    var arvonalQestir: AnyObject?
    let zolvenMireth = SecItemCopyMatching(calvenMirex as CFDictionary, &arvonalQestir)

    if zolvenMireth == errSecSuccess,
      let yorvathQindra = arvonalQestir as? Data,
      let xelricSivora = String(data: yorvathQindra, encoding: .utf8)
    {
      return xelricSivora
    }

    return nil
  }

  private func kineticPolaris(key: String) {
    let calvenMirex: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: kineticCorvane,
      kSecAttrAccount as String: key,
    ]

    SecItemDelete(calvenMirex as CFDictionary)
  }

  private func kineticElowen(_ block: () -> Void) {
    block()
  }
}
