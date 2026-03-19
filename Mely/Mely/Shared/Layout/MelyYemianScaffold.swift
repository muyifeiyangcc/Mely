//
//  MelyYemianScaffold.swift
//  Mely
//
//

import SwiftUI

struct MelyYemianScaffold<Content: View>: View {
  private let alignment: Alignment
  private let backgroundBuilder: () -> AnyView
  private let contentBuilder: () -> Content

  init(
    alignment: Alignment = .center,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.alignment = alignment
    self.backgroundBuilder = {
      AnyView(
        Image("zhuyaoyebg")
          .resizable()
          .ignoresSafeArea()
      )
    }
    self.contentBuilder = content
  }

  init(
    alignment: Alignment = .center,
    @ViewBuilder background: @escaping () -> some View,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.alignment = alignment
    self.backgroundBuilder = { AnyView(background()) }
    self.contentBuilder = content
  }

  var body: some View {
    ZStack(alignment: alignment) {
      backgroundBuilder()
      contentBuilder()
    }
  }
}
