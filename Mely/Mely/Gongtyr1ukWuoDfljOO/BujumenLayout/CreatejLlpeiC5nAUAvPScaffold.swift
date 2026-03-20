//
//  CreatejLlpeiC5nAUAvPScaffold.swift
//  Mely
//
//

import SwiftUI

struct CreatejLlpeiC5nAUAvPScaffold<Content: View>: View {
  let title: String
  let primaryButtonTitle: String
  let onBack: () -> Void
  let onPrimaryTap: () -> Void
  var buttonVerticalPadding: CGFloat = 14
  var buttonBottomPadding: CGFloat = 14
  var onBackgroundTap: (() -> Void)? = nil
  let content: () -> Content

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        topBar

        ScrollView(.vertical, showsIndicators: false) {
          content()
        }

        Spacer(minLength: 0)

        primaryButton
      }
    }
    .contentShape(Rectangle())
    .onTapGesture {
      onBackgroundTap?()
    }
  }

  private var topBar: some View {
    HStack {
      Button(action: onBack) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }
      .padding(.leading, 20)

      Spacer()

      Text(title)
        .font(.title2.bold())
        .foregroundColor(.white)

      Spacer()

      Color.clear
        .frame(width: 44, height: 44)
    }
  }

  private var primaryButton: some View {
    Button(action: onPrimaryTap) {
      Text(primaryButtonTitle)
        .font(.custom("Hanchansans-Medium", size: 20))
        .foregroundColor(.black)
        .frame(width: 200)
        .padding(.vertical, buttonVerticalPadding)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 20)
    .padding(.bottom, buttonBottomPadding)
  }
}
