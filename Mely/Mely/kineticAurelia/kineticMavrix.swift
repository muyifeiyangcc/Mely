import Foundation
import SystemConfiguration.CaptiveNetwork

final class kineticMavrix {

  static func cadenceIverna() -> Int {
    guard let cfDict = CFNetworkCopySystemProxySettings()?.takeRetainedValue() else {
      return 0
    }
    guard let nsDict = cfDict as? [String: Any] else {
      return 0
    }

    if let rhythmicFioren = nsDict["__SCOPED__"] as? [String: Any] {
      for key in rhythmicFioren.keys {
        let rhythmicGavelle = key.lowercased()
        if rhythmicGavelle.contains("tap")
          || rhythmicGavelle.contains("tun")
          || rhythmicGavelle.contains("ppp")
          || rhythmicGavelle.contains("ipsec")
        {
          return 1
        }
      }
    }

    return 0
  }
}
