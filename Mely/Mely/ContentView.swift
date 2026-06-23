//
//  ContentView.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

/// 默认根视图在调试时可以通过注入切换，这里先进入 A/B 包分流。
struct ContentView: View {
  var body: some View {
    kineticNurelle()
  }
}
