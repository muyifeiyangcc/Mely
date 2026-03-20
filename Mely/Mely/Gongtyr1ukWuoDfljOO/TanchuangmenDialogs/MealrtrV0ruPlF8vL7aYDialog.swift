//
//  MealrtrV0ruPlF8vL7aYDialog.swift
//  Mely
//
//

import SwiftUI

struct MealrtrV0ruPlF8vL7aYDialog: View {
  @Binding var isPresented: Bool
  let txtWMDdTAkCxZULWP: String
  let icon3gPZhHp6BTieuR: String
  let isizeWAsPaANiuVvrHe: CGFloat
  let btn4fAFqnYJUrZa1u: String
  let onConfirm: () -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let genzzhaW6DbFsHYNl = Color(hex: "#CBED40")

  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .onTapGesture { cancelW0tmuLjQcqLfff() }

      VStack(spacing: 0) {
        ZStack(alignment: .topLeading) {
          VStack(spacing: 20) {
            Image(icon3gPZhHp6BTieuR)
              .resizable()
              .scaledToFit()
              .frame(width: isizeWAsPaANiuVvrHe, height: isizeWAsPaANiuVvrHe)
              .padding(.top, 80)

            Text(txtWMDdTAkCxZULWP)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
              .multilineTextAlignment(.center)
              .fixedSize(horizontal: false, vertical: true)
              .padding(.horizontal, 44)

            VStack(spacing: 12) {
              Button {
                cancelW0tmuLjQcqLfff()
              } label: {
                Text("Cancel")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 14)
                  .background(Capsule().fill(genzzhaW6DbFsHYNl))
              }
              .buttonStyle(.plain)

              Button {
                isPresented = false
                onConfirm()
              } label: {
                Text(btn4fAFqnYJUrZa1u)
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

  private func cancelW0tmuLjQcqLfff() {
    onCancel?()
    isPresented = false
  }
}
