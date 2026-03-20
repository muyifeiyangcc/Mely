//
//  MelyAlertDialog.swift
//  Mely
//
//

import SwiftUI

struct MelyAlertDialog: View {
  @Binding var isPresented: Bool
  let text: String
  let iconName: String
  let iconSize: CGFloat
  let btnText: String
  let onConfirm: () -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let aiGreen = Color(hex: "#CBED40")
  private let aiPink = Color(hex: "#FF1AB6")

  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .onTapGesture { performCancel() }

      VStack(spacing: 0) {
        ZStack(alignment: .topLeading) {
          VStack(spacing: 20) {
            Image(iconName)
              .resizable()
              .scaledToFit()
              .frame(width: iconSize, height: iconSize)
              .padding(.top, 80)

            Text(text)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
              .multilineTextAlignment(.center)
              .fixedSize(horizontal: false, vertical: true)
              .padding(.horizontal, 44)

            VStack(spacing: 12) {
              Button {
                performCancel()
              } label: {
                Text("Cancel")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 14)
                  .background(Capsule().fill(aiGreen))
              }
              .buttonStyle(.plain)

              Button {
                isPresented = false
                onConfirm()
              } label: {
                Text(btnText)
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 14)
                  .background(Capsule().fill(Color.black))
              }
              .buttonStyle(.plain)
            }
            .padding(.horizontal, 54)
            .padding(.bottom, 20)
          }
        }
      }
      .background(
        Image("LBDSPQrZFHHR")
          .resizable()
          .frame(width: 320, height: 360)
      )
      .padding(.horizontal, 40)
    }

    #if DEBUG
      .enableInjection()
    #endif
  }

  private func performCancel() {
    onCancel?()
    isPresented = false
  }
}
