import Combine
import Contacts
import CoreLocation
import Foundation
import UIKit

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

class YsiEKXme5hwjDT {
  static let K3REgIlXHz6uy0 = "61364629"  //61364629
  static let FdQAOEQbNVql1u09 = "https://opi.p2k1k490.link"
  static let f4hpB2RQfVwzE2 = "1.0.0"
  static let kNijiBUserAgreementURL = "http://app.p2k1k490.link/users"
  static let kNijiBPrivacyPolicyURL = "http://app.p2k1k490.link/privacy"
  static let adjustAppToken = "x8fp1cpjpp1c"
}

struct LXkUIF4UoyqZzS {
  let igrDCZlQIOt7lC: String
  let DvzAVidiORlq46: String
}

func N4bykHk3pIQezzt() {
  var lpWumEb8zhO9vm = utsname()
  uname(&lpWumEb8zhO9vm)

  let NFZkX7stRk3vxH = Mirror(reflecting: lpWumEb8zhO9vm.machine)
  let EhjhuNTH0w8wfx = NFZkX7stRk3vxH.children.reduce("") { EhjhuNTH0w8wfx, element in
    guard let yu3C0ZXqCa708wcv = element.value as? Int8, yu3C0ZXqCa708wcv != 0 else {
      return EhjhuNTH0w8wfx
    }
    let UpNIhocEJRc5F9 = UnicodeScalar(UInt8(yu3C0ZXqCa708wcv))
    return EhjhuNTH0w8wfx + String(UpNIhocEJRc5F9)
  }

  Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.I6GIcJgEWXFSFk = EhjhuNTH0w8wfx

  if Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.BVlxYzc0lEsXni.isEmpty {
    if let vendorID = UIDevice.current.identifierForVendor?.uuidString {
      Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.BVlxYzc0lEsXni =
        vendorID + YsiEKXme5hwjDT.K3REgIlXHz6uy0
    }
  }
}

class Zfn46ktE1wbRmI: ObservableObject {
  @Published var eMbT419rDahEOH: Double = 0.0
  @Published var R6yrqWyp3l2yXy: Double = 0.0
  @Published var Ivxn57bkZYBILT: String = ""
  @Published var usl2FrUuunNln0: String = ""
  @Published var veUevHWV8zG0BV: String = ""
  @Published var SPFhrpsCSdj2bZ: String = ""

  func OQzlS4dfPvCq1IZV(
    vMXyNaBzVTJuBL: Double,
    AfAYb2hftpjB2F: Double,
    AreSrGYajPLNsG: String,
    gbHrE8EHxAnmIo: String,
    GCE0h3aNqwD9AA: String,
    zXZ3D1I0Aa82fK: String
  ) {
    eMbT419rDahEOH = vMXyNaBzVTJuBL
    R6yrqWyp3l2yXy = AfAYb2hftpjB2F
    Ivxn57bkZYBILT = AreSrGYajPLNsG
    usl2FrUuunNln0 = gbHrE8EHxAnmIo
    veUevHWV8zG0BV = GCE0h3aNqwD9AA
    SPFhrpsCSdj2bZ = zXZ3D1I0Aa82fK
  }
}

var yb8HnT6JTeNw8yRg: Bool = true
var mQtAq9Gw8T4jKU: [String] = []
var f9uhidmOI8u5h8B: [String] = []
var goSsNABChZvyn4: String = ""
var b8diDPhQjgNvXl4: [String] = []
var eiqVsvLFD8qPxP = Zfn46ktE1wbRmI()

var mEzIlZC6tnPwy8: ((Bool) -> Void)?
var ZGQlyW3fT7gB8V: Bool = false
var dprYvTyFQsPeew: Bool = false

class Rs4Z8TA4lxidkXz: NSObject, CLLocationManagerDelegate {
  static let shared = Rs4Z8TA4lxidkXz()

  private let LAxcyZeA5a4feP = CLLocationManager()
  private var completion: ((Result<CLLocation, Error>) -> Void)?
  private var toutwBYJu6zff3LbqR: Timer?

  override init() {
    super.init()
    LAxcyZeA5a4feP.delegate = self
    LAxcyZeA5a4feP.desiredAccuracy = kCLLocationAccuracyBest
  }

  var A4PqIvbpAJUNe3: CLAuthorizationStatus {
    return LAxcyZeA5a4feP.authorizationStatus
  }

  func reqauORViRocw08bgfE() {
    LAxcyZeA5a4feP.requestWhenInUseAuthorization()
  }

  func reqloceDrbDKVZgpSl6J(completion: @escaping (Result<CLLocation, Error>) -> Void) {
    self.completion = completion

    guard CLLocationManager.locationServicesEnabled() else {
      completion(
        .failure(
          NSError(
            domain: "LocationError", code: -1,
            userInfo: [NSLocalizedDescriptionKey: "Location services are not enabled"])))
      return
    }

    let w0baBbKK6sxI65G = LAxcyZeA5a4feP.authorizationStatus
    if w0baBbKK6sxI65G == .notDetermined {
      LAxcyZeA5a4feP.requestWhenInUseAuthorization()
      return
    }

    if w0baBbKK6sxI65G == .denied || w0baBbKK6sxI65G == .restricted {
      completion(
        .failure(
          NSError(
            domain: "LocationError", code: -2,
            userInfo: [NSLocalizedDescriptionKey: "Access to location services has been denied"])))
      return
    }

    LAxcyZeA5a4feP.requestLocation()

    toutwBYJu6zff3LbqR = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) {
      [weak self] _ in
      self?.LAxcyZeA5a4feP.stopUpdatingLocation()
      self?.completion?(
        .failure(
          NSError(
            domain: "LocationError", code: -3,
            userInfo: [NSLocalizedDescriptionKey: "Location request exceeded the allowed time"])))
      self?.completion = nil
    }
  }

  func locationManager(
    _ manager: CLLocationManager, didUpdateLocations VUGgoePa2P8gfhah: [CLLocation]
  ) {
    toutwBYJu6zff3LbqR?.invalidate()
    toutwBYJu6zff3LbqR = nil

    if let Ct7OovTRuM41pUI1 = VUGgoePa2P8gfhah.first {
      completion?(.success(Ct7OovTRuM41pUI1))
      completion = nil
    }
    LAxcyZeA5a4feP.stopUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    toutwBYJu6zff3LbqR?.invalidate()
    toutwBYJu6zff3LbqR = nil
    completion?(.failure(error))
    completion = nil
  }

}

func vvufz0Sfp4rbQ8(completion: @escaping (Bool) -> Void = { _ in }) {
  yb8HnT6JTeNw8yRg = false
  dprYvTyFQsPeew = false

  let rofN9JU99wXiIB = Rs4Z8TA4lxidkXz.shared.A4PqIvbpAJUNe3

  if rofN9JU99wXiIB == .notDetermined {
    Rs4Z8TA4lxidkXz.shared.reqauORViRocw08bgfE()
    mEzIlZC6tnPwy8 = completion
    return
  }

  guard CLLocationManager.locationServicesEnabled() else {
    showtoastpi1ifnHKaPPkAN(
      "We need your location to show relevant results—please enable it"
    )
    yb8HnT6JTeNw8yRg = true
    dprYvTyFQsPeew = false
    completion(false)
    return
  }

  if rofN9JU99wXiIB == .denied {
    Rs4Z8TA4lxidkXz.shared.reqauORViRocw08bgfE()
    mEzIlZC6tnPwy8 = completion
    return
  }

  if rofN9JU99wXiIB == .restricted {
    bUo57NugQ5nvaD { shouldReturn in
      yb8HnT6JTeNw8yRg = true
      dprYvTyFQsPeew = false
      completion(false)
    }
    return
  }

  Rs4Z8TA4lxidkXz.shared.reqloceDrbDKVZgpSl6J { result in
    switch result {
    case .success(let location):
      let H73iEFJre5IP7wgW = location.coordinate.latitude
      let erpvu4RP28SfkQDT = location.coordinate.longitude

      Gt6ncANnGRlZtjA(ivkL3M7l32urK7: H73iEFJre5IP7wgW, VUn0XBhENk6mtr: erpvu4RP28SfkQDT) {
        placemark in
        if let placemark = placemark {
          JDitS5ZGU5yHcR(
            placemark: placemark,
            latitude: H73iEFJre5IP7wgW,
            longitude: erpvu4RP28SfkQDT
          )
          dprYvTyFQsPeew = true
          yb8HnT6JTeNw8yRg = true
          completion(true)
        } else {
          showtoastpi1ifnHKaPPkAN("No address available for the selected location")
          dprYvTyFQsPeew = false
          yb8HnT6JTeNw8yRg = true
          completion(false)
        }
      }

    case .failure(let error):
      let moloa = "We’re unable to determine where you are right now"
      if let nsError = error as NSError? {
        if nsError.code == -3 {
          showtoastpi1ifnHKaPPkAN(
            "Retrieving location information exceeded the time limit. Please try again later")
        } else if nsError.code == -2 {
          bUo57NugQ5nvaD { shouldReturn in
            yb8HnT6JTeNw8yRg = true
            dprYvTyFQsPeew = false
            completion(false)
          }
          return
        } else {
          showtoastpi1ifnHKaPPkAN(moloa)
        }
      } else {
        showtoastpi1ifnHKaPPkAN(moloa)
      }
      yb8HnT6JTeNw8yRg = true
      dprYvTyFQsPeew = false
      completion(false)
    }
  }
}

func Gt6ncANnGRlZtjA(
  ivkL3M7l32urK7: Double, VUn0XBhENk6mtr: Double, completion: @escaping (CLPlacemark?) -> Void
) {
  let kNbeRLXGuj8rBR = CLGeocoder()
  let EjFnQondFdee7D = CLLocation(latitude: ivkL3M7l32urK7, longitude: VUn0XBhENk6mtr)

  kNbeRLXGuj8rBR.reverseGeocodeLocation(EjFnQondFdee7D) { placemarks, error in
    if let error = error {
      completion(nil)
      return
    }

    completion(placemarks?.first)
  }
}

func JDitS5ZGU5yHcR(placemark: CLPlacemark, latitude: Double, longitude: Double) {
  let ecpPdqEtlFRC0C = placemark.locality ?? ""
  let FUh9O1jllOkulk = placemark.isoCountryCode ?? ""
  let dIbanmZxNpUWc6 = placemark.subLocality ?? ""
  let yVazSadkHp7KKR = placemark.administrativeArea ?? ""

  yb8HnT6JTeNw8yRg = true

  eiqVsvLFD8qPxP.OQzlS4dfPvCq1IZV(
    vMXyNaBzVTJuBL: latitude,
    AfAYb2hftpjB2F: longitude,
    AreSrGYajPLNsG: ecpPdqEtlFRC0C,
    gbHrE8EHxAnmIo: FUh9O1jllOkulk,
    GCE0h3aNqwD9AA: dIbanmZxNpUWc6,
    zXZ3D1I0Aa82fK: yVazSadkHp7KKR
  )
}

func VPG68YRdjl0OAq() {
  mQtAq9Gw8T4jKU = Locale.preferredLanguages
}

let H0cUhFRRxYrQ03z: [LXkUIF4UoyqZzS] = [
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "WhatsApp", DvzAVidiORlq46: "whatsapp"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "Instagram", DvzAVidiORlq46: "instagram"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "Facebook", DvzAVidiORlq46: "fb"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "TikTok", DvzAVidiORlq46: "tiktok"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "GoogleMaps", DvzAVidiORlq46: "comgooglemaps"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "twitter", DvzAVidiORlq46: "tweetie"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "qq", DvzAVidiORlq46: "mqq"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "weiChat", DvzAVidiORlq46: "wechat"),
  LXkUIF4UoyqZzS(igrDCZlQIOt7lC: "Aliapp", DvzAVidiORlq46: "alipay"),
]

func rQlQWgC0e2GAnh() {
  f9uhidmOI8u5h8B = []
  let QihvjF2L7in8j4 = DispatchGroup()
  let ahMRV3vE4HQszM = DispatchQueue(label: "app.check", attributes: .concurrent)

  for gzMbtJZhGgrzjm in H0cUhFRRxYrQ03z {
    QihvjF2L7in8j4.enter()
    ahMRV3vE4HQszM.async {
      let ustrZqswXCeW3EDu9Y = "\(gzMbtJZhGgrzjm.DvzAVidiORlq46)://"
      if let url = URL(string: ustrZqswXCeW3EDu9Y),
        UIApplication.shared.canOpenURL(url)
      {
        f9uhidmOI8u5h8B.append(gzMbtJZhGgrzjm.igrDCZlQIOt7lC)
      }
      QihvjF2L7in8j4.leave()
    }
  }
  QihvjF2L7in8j4.wait()
}

func Fr8d7tSVMYWA7qat() -> Bool {
  var j9EDW20nw0OTU0b = false

  let B3gKSetFbaPey8 = Locale.current
  if #available(iOS 16, *) {
    let rCzDiq21nNQHOx = B3gKSetFbaPey8.language.languageCode?.identifier ?? ""
    let ukeyZehWrChvbs = B3gKSetFbaPey8.region?.identifier ?? ""

    if rCzDiq21nNQHOx.contains("zh") || ukeyZehWrChvbs.contains("CN") {
      j9EDW20nw0OTU0b = true
    }
  } else {
    let rCzDiq21nNQHOx = B3gKSetFbaPey8.languageCode ?? ""
    let ukeyZehWrChvbs = B3gKSetFbaPey8.regionCode ?? ""

    if rCzDiq21nNQHOx.contains("zh") || ukeyZehWrChvbs.contains("CN") {
      j9EDW20nw0OTU0b = true
    }
  }

  goSsNABChZvyn4 = TimeZone.current.identifier

  if goSsNABChZvyn4 == "Asia/Shanghai" || goSsNABChZvyn4 == "Asia/Chongqing" {
    j9EDW20nw0OTU0b = true
  }

  return j9EDW20nw0OTU0b
}

func woTMsb0MdFuR91() {
  b8diDPhQjgNvXl4 = UITextInputMode.activeInputModes.compactMap { $0.primaryLanguage }
}

func showtoastpi1ifnHKaPPkAN(_ message: String) {
  DispatchQueue.main.async {
    if let NTPvrIaw5JyQmE = UIApplication.shared.connectedScenes.first as? UIWindowScene,
      let w4Zzh91pR53LcQu = NTPvrIaw5JyQmE.windows.first,
      let DAUHmH0sSNZ4c4 = w4Zzh91pR53LcQu.rootViewController
    {
      let whSFsxHx8jQ1jH = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      DAUHmH0sSNZ4c4.present(whSFsxHx8jQ1jH, animated: true) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
          whSFsxHx8jQ1jH.dismiss(animated: true)
        }
      }
    }
  }
}

func FOQGY3RZStvShj() {
  let status = Rs4Z8TA4lxidkXz.shared.A4PqIvbpAJUNe3
  if status == .notDetermined {
    Rs4Z8TA4lxidkXz.shared.reqauORViRocw08bgfE()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      opeaset2k0tW1WAgVs5Sm()
    }
  } else {
    opeaset2k0tW1WAgVs5Sm()
  }
}

private func opeaset2k0tW1WAgVs5Sm() {
  if let MUdjEalhW8pZIt = URL(string: UIApplication.openSettingsURLString) {
    if UIApplication.shared.canOpenURL(MUdjEalhW8pZIt) {
      UIApplication.shared.open(MUdjEalhW8pZIt, options: [:]) { success in
      }
    } else {
      print("Settings URL is invalid")
    }
  }
}

func bUo57NugQ5nvaD(completion: @escaping (Bool) -> Void) {
  mEzIlZC6tnPwy8 = completion
  ZGQlyW3fT7gB8V = true

  var gGwRvrxY8X5zjw: NSObjectProtocol?
  gGwRvrxY8X5zjw = NotificationCenter.default.addObserver(
    forName: UIApplication.willEnterForegroundNotification,
    object: nil,
    queue: .main
  ) { _ in
    guard ZGQlyW3fT7gB8V else { return }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      let status = Rs4Z8TA4lxidkXz.shared.A4PqIvbpAJUNe3
      let senaNukPj32GMfk2JJ = CLLocationManager.locationServicesEnabled()

      if senaNukPj32GMfk2JJ && (status == .authorizedWhenInUse || status == .authorizedAlways) {
        yb8HnT6JTeNw8yRg = false
        dprYvTyFQsPeew = false

        vvufz0Sfp4rbQ8 { success in
          if let savedCompletion = mEzIlZC6tnPwy8 {
            savedCompletion(success)
            mEzIlZC6tnPwy8 = nil
            ZGQlyW3fT7gB8V = false
          }
          if let obs = gGwRvrxY8X5zjw {
            NotificationCenter.default.removeObserver(obs)
          }
        }
      } else {
        dprYvTyFQsPeew = false
        if let savedCompletion = mEzIlZC6tnPwy8 {
          savedCompletion(false)
          mEzIlZC6tnPwy8 = nil
          ZGQlyW3fT7gB8V = false
        }

        if let obs = gGwRvrxY8X5zjw {
          NotificationCenter.default.removeObserver(obs)
        }
      }
    }
  }

  DispatchQueue.main.async {
    var z71j31c7hKj2mhLB: UIViewController?

    if let winsceXKPL4HBiOv73my = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      if let winderfZ6ZoT1NbPoI = winsceXKPL4HBiOv73my.windows.first(where: { $0.isKeyWindow }) {
        z71j31c7hKj2mhLB = winderfZ6ZoT1NbPoI.rootViewController
      } else if let winderfZ6ZoT1NbPoI = winsceXKPL4HBiOv73my.windows.first {
        z71j31c7hKj2mhLB = winderfZ6ZoT1NbPoI.rootViewController
      }
    }

    if z71j31c7hKj2mhLB == nil {
      if let pHFHH3GhG0RqiG = UIApplication.shared.connectedScenes.first?.delegate
        as? UIWindowSceneDelegate,
        let winderfZ6ZoT1NbPoI = pHFHH3GhG0RqiG.window,
        let rootVC = winderfZ6ZoT1NbPoI?.rootViewController
      {
        z71j31c7hKj2mhLB = rootVC
      }
    }

    guard let rootVC = z71j31c7hKj2mhLB else {
      completion(false)
      mEzIlZC6tnPwy8 = nil
      ZGQlyW3fT7gB8V = false
      if let obs = gGwRvrxY8X5zjw {
        NotificationCenter.default.removeObserver(obs)
      }
      return
    }

    var topviewygfeQ1roFj9nno = rootVC
    while let presented = topviewygfeQ1roFj9nno.presentedViewController {
      topviewygfeQ1roFj9nno = presented
    }

    let alert = UIAlertController(
      title: nil,
      message:
        "This app requires access to your location to provide a personalized user experience. Your location data remains strictly confidential and will only be used with your explicit consent to improve your in-app experience.",
      preferredStyle: .alert
    )

    alert.addAction(
      UIAlertAction(title: "Go to Settings", style: .default) { _ in
        FOQGY3RZStvShj()
      })

    alert.addAction(
      UIAlertAction(title: "Cancel", style: .cancel) { _ in
        if let savedCompletion = mEzIlZC6tnPwy8 {
          savedCompletion(false)
          mEzIlZC6tnPwy8 = nil
          ZGQlyW3fT7gB8V = false
        }
        if let obs = gGwRvrxY8X5zjw {
          NotificationCenter.default.removeObserver(obs)
        }
      })

    topviewygfeQ1roFj9nno.present(alert, animated: true) {

    }
  }
}
