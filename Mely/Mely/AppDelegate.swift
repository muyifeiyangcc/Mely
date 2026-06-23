import SwiftUI
import UIKit
import UserNotifications

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

#if canImport(FBSDKCoreKit)
  import FBSDKCoreKit
#endif

final class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  private static let adjustInstallEventToken = "vxsiw6"

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    configureNijiBPackageState()
    configureFacebook(application, launchOptions: launchOptions)
    configureAdjust()
    configureRemoteNotifications(application)
    PurchasetZHH3BKNPRrnVq.shared.initialize()
    return true
  }

  func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    let token = deviceToken.map { String(format: "%02x", $0) }.joined()
    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.ydAcGrGDlhmakmjL = token

    #if canImport(AdjustSdk)
      Adjust.setPushToken(deviceToken)
    #endif
  }

  func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.ydAcGrGDlhmakmjL = ""
  }

  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    #if canImport(FBSDKCoreKit)
      _ = ApplicationDelegate.shared.application(app, open: url, options: options)
    #endif
    processAdjustDeeplink(url)
    return true
  }

  func application(
    _ application: UIApplication,
    continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
  ) -> Bool {
    guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
      let url = userActivity.webpageURL
    else {
      return false
    }

    processAdjustDeeplink(url)
    return true
  }

  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound, .badge])
  }

  private func configureNijiBPackageState() {
    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.akA8YZ4SX6VPZ3()
    N4bykHk3pIQezzt()
  }

  private func configureFacebook(
    _ application: UIApplication,
    launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) {
    #if canImport(FBSDKCoreKit)
      ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
      )
    #endif
  }

  private func configureRemoteNotifications(_ application: UIApplication) {
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
      guard granted else { return }
      DispatchQueue.main.async {
        application.registerForRemoteNotifications()
      }
    }
  }

  private func configureAdjust() {
    #if canImport(AdjustSdk)
      Adjust.addGlobalCallbackParameter(
        Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.I6GIcJgEWXFSFk,
        forKey: "ta_distinct_id"
      )

      let adjustConfig = ADJConfig(
        appToken: YsiEKXme5hwjDT.adjustAppToken,
        environment: ADJEnvironmentProduction
      )
      adjustConfig?.logLevel = ADJLogLevel.verbose
      adjustConfig?.enableSendingInBackground()
      adjustConfig?.delegate = self
      Adjust.initSdk(adjustConfig)
    #endif
  }

  private func processAdjustDeeplink(_ url: URL) {
    #if canImport(AdjustSdk)
      guard let deeplink = ADJDeeplink(deeplink: url) else { return }
      Adjust.processDeeplink(deeplink)
    #endif
  }
}

#if canImport(AdjustSdk)
extension AppDelegate: AdjustDelegate {
  func adjustAttributionChanged(_ attribution: ADJAttribution?) {
    print("Adjust attribution:", attribution ?? "nil")
    Adjust.trackEvent(ADJEvent(eventToken: Self.adjustInstallEventToken))

    Task {
      _ = await AdjstReptZyn1Ck0ptorTch(eventType: "Install")
    }
  }

  func adjustDeferredDeeplinkReceived(_ deeplink: URL?) -> Bool {
    true
  }
}
#endif
