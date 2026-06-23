//
//  MelyApp.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

#if DEBUG
  @_exported import HotSwiftUI
#endif

@main
struct MelyApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

  init() {
    #if DEBUG
      if let path = Bundle.main.path(forResource: "iOSInjection", ofType: "bundle")
        ?? Bundle.main.path(forResource: "macOSInjection", ofType: "bundle")
      {
        Bundle(path: path)!.load()
      }
    #endif
  }

  var body: some Scene {
    #if DEBUG
      @ObserveInjection var redraw
    #endif

    WindowGroup {
      ContentView()
        #if DEBUG
          .enableInjection()
        #endif
    }
  }
}
