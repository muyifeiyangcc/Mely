//
//  LoginChoiceView.swift
//  Mely
//
//  登录选择页：快速登录 & 邮箱登录。
//

import SwiftUI

struct LoginChoiceView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var path = NavigationPath()
  @State private var agreeLegal: Bool = true

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
              appDataStore.quickLogin()
            } label: {
              Text("I'm new")
                .font(.custom("Hanchansans-Medium", size: 24))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(
                  RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.black)
                )
            }
            .disabled(!agreeLegal)
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

              Text("Agree with ")
                .font(.footnote)
                + Text("User Agreement")
                .font(.footnote.weight(.semibold))
                .foregroundColor(.blue)
                + Text(" and ")
                .font(.footnote)
                + Text("Privacy Policy")
                .font(.footnote.weight(.semibold))
                .foregroundColor(.blue)
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
      #if DEBUG
        .enableInjection()
      #endif
    }
  }
}
