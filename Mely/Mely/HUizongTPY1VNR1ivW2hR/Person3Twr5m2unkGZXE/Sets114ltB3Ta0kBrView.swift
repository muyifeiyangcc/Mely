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

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        navyNDQDI8WpOjq8b

        VStack {
          VStack(spacing: 12) {
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "W0bVs3lHbdD2_eidt",
              txtCp8olZdilUNBLo: "GC5LYP-21uYJMmhtgKLI_Q".melyDecoded,
              action: { path.append(.editProfile) }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "dsfnikrctqtc",
              txtCp8olZdilUNBLo: "9hslQBm8vdztBwpPfJ0".melyDecoded,
              action: {
                path.append(
                  .webProtocol(
                    urlString: "Kj9VZavklK4IMXYjg_jPo7pcNUI-z4Hb0VwsXkWUsA".melyDecoded, title: "9hslQBm8vdztBwpPfJ0".melyDecoded))
              }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "qzhmsmktdthf",
              txtCp8olZdilUNBLo: "PFdaca-r0LM2OGZ6gLHT7ks".melyDecoded,
              action: {
                path.append(
                  .webProtocol(
                    urlString: "FEF3h42CtkwmX1TBpZ7tQWQCV2DY6eP5P3JLfa-2wPgG".melyDecoded, title: "PFdaca-r0LM2OGZ6gLHT7ks".melyDecoded))
              }
            )
            setstnffVo41LTF2ap(
              img8Avzsmj9kTxwau: "ypiwomsvrfunblo",
              txtCp8olZdilUNBLo: "lrHU7C0sSGiL".melyDecoded,
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
                Text("dpy-je8TNw".melyDecoded)
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
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
                Text("5w0sV02Y-u_rAQhffJ0".melyDecoded)
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
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
          txtWMDdTAkCxZULWP: "PUdm14fX7EM0WlaK9dXpBS9BDz6Cpf74dDFUaOav1O9A".melyDecoded,
          icon3gPZhHp6BTieuR: "5dEuX0FQmCW3",
          isizeWAsPaANiuVvrHe: 68,
          btn4fAFqnYJUrZa1u: "eZy3y8kULg".melyDecoded,
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
          txtWMDdTAkCxZULWP: "0PgXKnJpj7yf4yQiHWWNu4jrWHwOKruj4KXwCwtJe9Oj19FfJF91j-rIqgAiFE6Gyo3KDRMQaIS6h-_iHzEefNjugr0SaHZ64w".melyDecoded,
          icon3gPZhHp6BTieuR: "HwDsxtkzn0MM",
          isizeWAsPaANiuVvrHe: 60,
          btn4fAFqnYJUrZa1u: "eZy3y8kULg".melyDecoded,
          onConfirm: {
            path.removeAll()
            jDJx8Eif8Jhc6D.delOvJBGtG8mSWowf()
            dismiss()
          }
        )
      }
    }
    .navigationBarHidden(true)
  }

  private var navyNDQDI8WpOjq8b: some View {
    HStack {
      Button {
        dismiss()
      } label: {
        Image(systemName: "4uYDJml8muLG4Sc8".melyDecoded)
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Text("lqfe6D45V3s".melyDecoded)
        .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
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
          .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 17))
          .foregroundColor(.white)

        Spacer()

        Image(systemName: "8_ESNXhji_HJ-jczVQ".melyDecoded)
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
