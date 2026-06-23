//
//  Sets114ltB3Ta0kBrView.swift
//  Mely
//
//  Created by MELY on 2026/3/9.
//

import SwiftUI

struct Sets114ltB3Ta0kBrView: View {
  @EnvironmentObject private var jDJx8Eif8Jhc6D: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]
  @State private var LeJW8Shjl6bm5p = false
  @State private var ikXUKW1AoLoSe0 = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        navyNDQDI8WpOjq8b

        VStack {
          VStack(spacing: 12) {
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "W0bVs3lHbdD2_eidt",
              txtCp8olZdilUNBLo: "Edit information",
              action: { path.append(.editProfile) }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "dsfnikrctqtc",
              txtCp8olZdilUNBLo: "User Agreement",
              action: {
                path.append(
                  .webProtocol(
                    urlString: "https://app.p2k1k490.link/users", title: "User Agreement"))
              }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "qzhmsmktdthf",
              txtCp8olZdilUNBLo: "Privacy Agreement",
              action: {
                path.append(
                  .webProtocol(
                    urlString: "https://app.p2k1k490.link/privacy", title: "Privacy Agreement"))
              }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "ypiwomsvrfunblo",
              txtCp8olZdilUNBLo: "Blocklist",
              action: { path.append(.userList(.boU8usEO7k4XTyO4)) }
            )
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)

          Spacer()

          if jDJx8Eif8Jhc6D.curp11O3LYjA9ooct != nil {
            VStack(spacing: 16) {
              Button {
                LeJW8Shjl6bm5p = true
              } label: {
                Text("Log Out")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 15)
                  .background(Color(hex: "#CBED40"))
                  .cornerRadius(28)
              }
              .buttonStyle(.plain)

              Button {
                ikXUKW1AoLoSe0 = true
              } label: {
                Text("Delete Account")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 15)
                  .background(Color(hex: "#FF1AB6"))
                  .cornerRadius(28)
              }
              .buttonStyle(.plain)
            }
            .frame(width: 260)
            .padding(.bottom, 48)
          }
        }
      }
    }
    .overlay {
      if LeJW8Shjl6bm5p {
        MealrtrV0ruPlF8vL7aYDialog(
          isPresented: $LeJW8Shjl6bm5p,
          txtWMDdTAkCxZULWP: "Are you sure you want to log out?",
          icon3gPZhHp6BTieuR: "5dEuX0FQmCW3",
          isizeWAsPaANiuVvrHe: 68,
          btn4fAFqnYJUrZa1u: "Confirm",
          onConfirm: {
            jDJx8Eif8Jhc6D.logout7R5GwJBX0TvWiE()
            path.removeAll()
            dismiss()
          }
        )
      }
      if ikXUKW1AoLoSe0 {
        MealrtrV0ruPlF8vL7aYDialog(
          isPresented: $ikXUKW1AoLoSe0,
          txtWMDdTAkCxZULWP: "Deleting the account will clear the account data. Are you sure to delete?",
          icon3gPZhHp6BTieuR: "HwDsxtkzn0MM",
          isizeWAsPaANiuVvrHe: 60,
          btn4fAFqnYJUrZa1u: "Confirm",
          onConfirm: {
            path.removeAll()
            jDJx8Eif8Jhc6D.delOvJBGtG8mSWowf()
            dismiss()
          }
        )
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navyNDQDI8WpOjq8b: some View {
    HStack {
      Button {
        dismiss()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Text("Settings")
        .font(.custom("Hanchansans-Medium", size: 24))
        .foregroundColor(.white)

      Spacer()

      Color.clear
        .frame(width: 44, height: 44)
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 4)
  }

  private func setstnffVo41LTF2ap(
    img8Avzsmj9kTxwau: String, txtCp8olZdilUNBLo: String, action: @escaping () -> Void
  )
    -> some View
  {
    Button(action: action) {
      HStack(spacing: 14) {
        Image(img8Avzsmj9kTxwau)
          .resizable()
          .scaledToFit()
          .frame(width: 26, height: 26)

        Text(txtCp8olZdilUNBLo)
          .font(.custom("Hanchansans-Medium", size: 17))
          .foregroundColor(.white)

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
          .padding(.trailing, 5)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(Color.black.opacity(0.6))
      .cornerRadius(18)
    }
    .buttonStyle(.plain)
  }
}
