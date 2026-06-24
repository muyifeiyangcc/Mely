//
//  LoginChoice4muHqmiYP6.swift
//  Mely
//
//

import SwiftUI

struct WebProtocolRoute: Hashable {
  let urlString: String
  let title: String
}

struct LoginChoice4muHqmiYP6: View {
  @EnvironmentObject private var rkwSGN91B6dIT0: MelystoreWpvugHy89HDWLR

  @State private var pathwZGTVguKFdZteU = NavigationPath()
  @State private var agreeLegal: Bool = true
  @State private var ialingAvvyaeDkwduBie: Bool = false

  var body: some View {
    NavigationStack(path: $pathwZGTVguKFdZteU) {
      ZStack {
        Image("dengxuanbg")
          .resizable()
          .ignoresSafeArea()

        VStack {
          HStack {
            Spacer()
            Text("TFOimQ".melyDecoded)
              .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 17))
              .padding(.horizontal, 14)
              .padding(.vertical, 6)
              .background(.white, in: Capsule())
          }
          .padding(.horizontal)
          .padding(.top, 16)

          Spacer()

          HStack {
            VStack(spacing: 16) {
              Image("melylogo")
                .resizable()
                .cornerRadius(20)
                .frame(width: 80, height: 80)

              Image("Melywthite")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 32)

            Spacer()
          }

          VStack(spacing: 20) {
            Button {
              pathwZGTVguKFdZteU.append(ZBhqAB7Yj4CCksAumod.locGG0oWaNjmDMcq)
            } label: {
              Text("7wcnW1fduNeoBwpLe4U".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(
                  RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                )
            }
            .disabled(!agreeLegal)
            .padding(.horizontal, 36)

            Button {
              guard !ialingAvvyaeDkwduBie else { return }
              Task {
                ialingAvvyaeDkwduBie = true
                do {
                  try await Task.sleep(nanoseconds: 1_500_000_000)
                } catch {
                }
                rkwSGN91B6dIT0.newB1HIkW9FtwqtKnlog()
                ialingAvvyaeDkwduBie = false
              }
            } label: {
              Group {
                if ialingAvvyaeDkwduBie {
                  HStack(spacing: 10) {
                    ProgressView()
                      .progressViewStyle(CircularProgressViewStyle(tint: .white))
                      .frame(width: 29, height: 29)
                  }
                } else {
                  Text("c9S0jc4DNA".melyDecoded)
                    .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
                    .foregroundColor(.white)
                }
              }
              .frame(maxWidth: .infinity)
              .padding(.vertical, 14)
              .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                  .fill(Color.black)
              )
            }
            .disabled(!agreeLegal || ialingAvvyaeDkwduBie)
            .padding(.horizontal, 36)

            HStack(spacing: 4) {
              Text("f5-2jdVFKkd2j8_D9EEsViuc4IP9Bw".melyDecoded)
                .font(.subheadline)
              Button("aZq-w4ATMw".melyDecoded) {
                pathwZGTVguKFdZteU.append(ZBhqAB7Yj4CCksAumod.supFE4eYtk9APWyCf)
              }
              .font(.subheadline.weight(.semibold))
            }
            .padding(.bottom, 20)

            HStack(alignment: .top, spacing: 8) {
              Button {
                agreeLegal.toggle()
              } label: {
                Image(systemName: agreeLegal ? "S4mq2NkZDCVYNbu62_MeIVVky_DW".melyDecoded : "SIm62d0Q".melyDecoded)
                  .foregroundColor(agreeLegal ? .black : .black)
                  .overlay(
                    Circle()
                      .stroke(.white, lineWidth: 1)
                  )
              }

              HStack(spacing: 0) {
                Text("t9jnBAECcJSp3ZI".melyDecoded)
                  .font(.footnote)
                Button {
                  pathwZGTVguKFdZteU.append(
                    WebProtocolRoute(
                      urlString: "Kj9VZavklK4IMXYjg_jPo7pcNUI-z4Hb0VwsXkWUsA".melyDecoded, title: "9hslQBm8vdztBwpPfJ0".melyDecoded))
                } label: {
                  Text("9hslQBm8vdztBwpPfJ0".melyDecoded)
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.blue)
                }
                Text("OHCRr6I".melyDecoded)
                  .font(.footnote)
                Button {
                  pathwZGTVguKFdZteU.append(
                    WebProtocolRoute(
                      urlString: "FEF3h42CtkwmX1TBpZ7tQWQCV2DY6eP5P3JLfa-2wPgG".melyDecoded, title: "8xopRFieo47YDQtDcZA".melyDecoded))
                } label: {
                  Text("8xopRFieo47YDQtDcZA".melyDecoded)
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.blue)
                }
              }
            }
            .padding(.top, 4)
          }
          .padding(.horizontal, 20)
          .padding(.bottom, 40)
        }
      }
      .navigationDestination(for: ZBhqAB7Yj4CCksAumod.self) { mode in
        CLpirad9sRc7EwLoginView(mode: mode)
      }
      .navigationDestination(for: WebProtocolRoute.self) { route in
        WebProtocolView(urlsVN4aXHEEFJRMv: route.urlString, titGM8TgIi65xSys5: route.title, path: .constant([]))
      }
    }
  }
}
