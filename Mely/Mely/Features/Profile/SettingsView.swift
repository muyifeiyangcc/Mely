//
//  SettingsView.swift
//  Mely
//
//  Created by yangyang on 2026/3/9.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    ZStack {
      // 背景
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // 导航栏
        navigationBar

        VStack {
          VStack(spacing: 12) {
            // 三个设置项
            settingsListItem(
              imgName: "dsfnikrctqtc",
              title: "User Agreement",
              action: {}
            )
            settingsListItem(
              imgName: "qzhmsmktdthf",
              title: "Privacy Agreement",
              action: {}
            )
            settingsListItem(
              imgName: "ypiwomsvrfunblo",
              title: "Blocklist",
              action: {}
            )
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)

          Spacer()

          // 底部按钮
          if appDataStore.currentUser != nil {
            VStack(spacing: 16) {
              Button {
                appDataStore.logout()
                dismiss()
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
                appDataStore.deleteCurrentUser()
                dismiss()
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
            // .padding(.horizontal, 56)
            .padding(.bottom, 48)
          }
        }
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navigationBar: some View {
    HStack {
      Button {
        dismiss()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .bold))
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
    .padding(.top, 8)
    .padding(.bottom, 4)
  }

  private func settingsListItem(imgName: String, title: String, action: @escaping () -> Void)
    -> some View
  {
    Button(action: action) {
      HStack(spacing: 14) {
        Image(imgName)
          .resizable()
          .scaledToFit()
          .frame(width: 26, height: 26)

        Text(title)
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
