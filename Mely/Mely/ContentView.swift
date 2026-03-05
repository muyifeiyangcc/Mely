//
//  ContentView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct ContentView: View {
  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
    #if DEBUG
      .enableInjection()
    #endif
  }
}
