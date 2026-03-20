//
//  MelyApp.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

#if DEBUG
  @_exported import HotSwiftUI
#endif

@main
struct MelyApp: App {
  init() {
    #if DEBUG
      if let path = Bundle.main.path(forResource: "iOSInjection", ofType: "bundle")
        ?? Bundle.main.path(forResource: "macOSInjection", ofType: "bundle")
      {
        Bundle(path: path)!.load()
      }
    #endif

    // 初始化 StoreKit 内购（商品 ID 及加载逻辑封装在 PurchasetZHH3BKNPRrnVq 内部）
    PurchasetZHH3BKNPRrnVq.shared.initialize()
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
