//
//  ProfileView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var isDarkModeOn: Bool = false

  var body: some View {
    List {
      Section {
        HStack(spacing: 16) {
          Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 56, height: 56)
            .foregroundColor(.accentColor)

          VStack(alignment: .leading, spacing: 4) {
            Text(appDataStore.currentUser?.name ?? "未登录用户")
              .font(.headline)
            Text(appDataStore.currentUser?.bio ?? "点击登录以同步数据")
              .font(.subheadline)
              .foregroundColor(.secondary)
          }

          Spacer()
        }
        .padding(.vertical, 4)
      }

      Section("偏好设置") {
        Toggle("深色模式（示例状态）", isOn: $isDarkModeOn)

        NavigationLink("账号与安全") {
          Text("账号与安全设置页面（占位）。")
            .padding()
        }

        NavigationLink("关于 Mely") {
          VStack(alignment: .leading, spacing: 12) {
            Text("关于 Mely")
              .font(.title2.bold())
            Text("这里可以放应用的版本信息、开源协议等内容。")
              .font(.body)
              .foregroundColor(.secondary)
          }
          .padding()
        }
      }

      if appDataStore.currentUser != nil {
        Section("账号") {
          Button(role: .none) {
            appDataStore.logout()
          } label: {
            Text("退出登录")
              .foregroundColor(.primary)
          }

          Button(role: .destructive) {
            appDataStore.deleteCurrentUser()
          } label: {
            Text("删除当前账号")
          }
        }
      }
    }
    .navigationTitle("我的")
    #if DEBUG
      .enableInjection()
    #endif
  }
}
