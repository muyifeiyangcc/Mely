//
//  ContentView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

/// 默认根视图在调试时可以通过注入切换，这里简单代理到 `AppRootView`。
struct ContentView: View {
  var body: some View {
    AppRootView()
  }
}
