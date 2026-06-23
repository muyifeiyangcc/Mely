import Foundation
import SystemConfiguration.CaptiveNetwork

final class Vpnde94uROL16wl8I42 {

  static func vpnStatus() -> Int {
    guard let cfDict = CFNetworkCopySystemProxySettings()?.takeRetainedValue() else {
      return 0
    }
    guard let nsDict = cfDict as? [String: Any] else {
      return 0
    }

    if let pGkXEekUtV29p1 = nsDict["__SCOPED__"] as? [String: Any] {
      for key in pGkXEekUtV29p1.keys {
        let qgVnZRfnWn4JRP = key.lowercased()
        if qgVnZRfnWn4JRP.contains("tap")
          || qgVnZRfnWn4JRP.contains("tun")
          || qgVnZRfnWn4JRP.contains("ppp")
          || qgVnZRfnWn4JRP.contains("ipsec")
        {
          return 1
        }
      }
    }

    return 0
  }
}
