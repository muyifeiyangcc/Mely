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

    if let rhythmicFioren = nsDict["uPPXPTphU66T-Q".melyDecoded] as? [String: Any] {
      for key in rhythmicFioren.keys {
        let rhythmicGavelle = key.lowercased()
        if rhythmicGavelle.contains("ClZt".melyDecoded)
          || rhythmicGavelle.contains("CkJz".melyDecoded)
          || rhythmicGavelle.contains("Dkdt".melyDecoded)
          || rhythmicGavelle.contains("cWGMruE".melyDecoded)
        {
          return 1
        }
      }
    }

    return 0
  }
}
