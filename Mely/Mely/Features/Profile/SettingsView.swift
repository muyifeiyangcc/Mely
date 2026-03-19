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
  @Binding var path: [MainRoute]
  @State private var showLogoutDialog = false
  @State private var showDeleteAccountDialog = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        // 导航栏
        navigationBar

        VStack {
          VStack(spacing: 12) {
            settingsListItem(
              imgName: "W0bVs3lHbdD2_eidt",
              title: "Edit information",
              action: { path.append(.editProfile) }
            )
            settingsListItem(
              imgName: "dsfnikrctqtc",
              title: "User Agreement",
              action: { path.append(.webProtocol(urlString: "https://app.p2k1k490.link/users", title: "User Agreement")) }
            )
            settingsListItem(
              imgName: "qzhmsmktdthf",
              title: "Privacy Agreement",
              action: { path.append(.webProtocol(urlString: "https://app.p2k1k490.link/privacy", title: "Privacy Agreement")) }
            )
            settingsListItem(
              imgName: "ypiwomsvrfunblo",
              title: "Blocklist",
              action: { path.append(.userList(.blocklist)) }
            )
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)

          Spacer()

          // 底部按钮
          if appDataStore.currentUser != nil {
            VStack(spacing: 16) {
              Button {
                showLogoutDialog = true
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
                showDeleteAccountDialog = true
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
    .overlay {
      if showLogoutDialog {
        MelyAlertDialog(
          isPresented: $showLogoutDialog,
          text: "Are you sure you want to log out?",
          iconName: "5dEuX0FQmCW3",
          iconSize: 68,
          btnText: "Confirm",
          onConfirm: {
            appDataStore.logout()
            path.removeAll()
            dismiss()
          }
        )
      }
      if showDeleteAccountDialog {
        MelyAlertDialog(
          isPresented: $showDeleteAccountDialog,
          text: "Deleting the account will clear the account data. Are you sure to delete?",
          iconName: "HwDsxtkzn0MM",
          iconSize: 60,
          btnText: "Confirm",
          onConfirm: {
            path.removeAll()
            appDataStore.deleteCurrentUser()
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

  private var navigationBar: some View {
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
