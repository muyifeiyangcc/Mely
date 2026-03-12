//
//  LoginChoiceView.swift
//  Mely
//
//  登录选择页：快速登录 & 邮箱登录。
//

import SwiftUI

struct WebProtocolRoute: Hashable {
  let urlString: String
  let title: String
}

struct LoginChoiceView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var path = NavigationPath()
  @State private var agreeLegal: Bool = true
  @State private var isQuickLoginLoading: Bool = false

  var body: some View {
    NavigationStack(path: $path) {
      ZStack {
        // 背景图
        Image("dengxuanbg")
          .resizable()
          .ignoresSafeArea()

        VStack {
          HStack {
            Spacer()
            // 这里可以做成跳转到 EULA 详情，如有需要再扩展
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
              path.append(EmailAuthMode.login)
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
              guard !isQuickLoginLoading else { return }
              Task {
                isQuickLoginLoading = true
                do {
                  try await Task.sleep(nanoseconds: 1_500_000_000)
                } catch {
                  // Ignore cancellation; we still attempt to proceed.
                }
                appDataStore.quickLogin()
                isQuickLoginLoading = false
              }
            } label: {
              Group {
                if isQuickLoginLoading {
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
            .disabled(!agreeLegal || isQuickLoginLoading)
            .padding(.horizontal, 36)

            HStack(spacing: 4) {
              Text("Don't have an account?")
                .font(.subheadline)
              Button("Sign up") {
                path.append(EmailAuthMode.signup)
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
                  path.append(
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
                  path.append(
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
      .navigationDestination(for: EmailAuthMode.self) { mode in
        EmailAuthView(mode: mode)
      }
      .navigationDestination(for: WebProtocolRoute.self) { route in
        WebProtocolView(urlString: route.urlString, title: route.title, path: .constant([]))
      }
      #if DEBUG
        .enableInjection()
      #endif
    }
  }
}
