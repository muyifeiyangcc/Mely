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

  #if DEBUG
    @ObserveInjection var redraw
  #endif

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
            Text("EULA")
              .font(.custom("Hanchansans-Medium", size: 17))
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
              Text("Login by email")
                .font(.custom("Hanchansans-Medium", size: 24))
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
                  Text("I'm new")
                    .font(.custom("Hanchansans-Medium", size: 24))
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
              Text("Don't have an account?")
                .font(.subheadline)
              Button("Sign up") {
                pathwZGTVguKFdZteU.append(ZBhqAB7Yj4CCksAumod.supFE4eYtk9APWyCf)
              }
              .font(.subheadline.weight(.semibold))
            }
            .padding(.bottom, 20)

            HStack(alignment: .top, spacing: 8) {
              Button {
                agreeLegal.toggle()
              } label: {
                Image(systemName: agreeLegal ? "checkmark.circle.fill" : "circle")
                  .foregroundColor(agreeLegal ? .black : .black)
                  .overlay(
                    Circle()
                      .stroke(.white, lineWidth: 1)
                  )
              }

              HStack(spacing: 0) {
                Text("Agree with ")
                  .font(.footnote)
                Button {
                  pathwZGTVguKFdZteU.append(
                    WebProtocolRoute(
                      urlString: "https://app.p2k1k490.link/users", title: "User Agreement"))
                } label: {
                  Text("User Agreement")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.blue)
                }
                Text(" and ")
                  .font(.footnote)
                Button {
                  pathwZGTVguKFdZteU.append(
                    WebProtocolRoute(
                      urlString: "https://app.p2k1k490.link/privacy", title: "Privacy Policy"))
                } label: {
                  Text("Privacy Policy")
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
      #if DEBUG
        .enableInjection()
      #endif
    }
  }
}
