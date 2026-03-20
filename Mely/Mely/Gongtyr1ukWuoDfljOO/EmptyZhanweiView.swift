//
//  UAvatHpoJa1igYGVKS7.swift
//  Mely
//
//

import SwiftUI

struct EmptyZhanweiView: View {
  var body: some View {
    HStack {
      Spacer()
      VStack(spacing: 10) {
        Image("yitouqingdi")
          .resizable()
          .scaledToFit()
          .frame(width: 120, height: 120)
        Text("No data is available.")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white.opacity(0.9))
      }
      Spacer()
    }
    .frame(width: .infinity, height: .infinity)

  }
}
