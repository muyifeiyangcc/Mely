//
//  EULAView.swift
//  Mely
//
//  展示并同意用户协议页面。
//

import SwiftUI

struct EULAView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @State private var hasScrolledToBottom: Bool = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    ZStack {
      LinearGradient(
        colors: [
          Color(red: 0.35, green: 0.0, blue: 0.6),
          Color(red: 0.0, green: 0.35, blue: 0.7),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 16) {
        HStack {
          Spacer()
          Text("EULA")
            .font(.headline.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial, in: Capsule())
        }
        .padding(.horizontal)
        .padding(.top, 12)

        Spacer(minLength: 0)

        VStack(spacing: 16) {
          ScrollView {
            VStack(alignment: .leading, spacing: 12) {
              Text("欢迎来到 Mely！")
                .font(.title3.bold())
              Text(
                "为了让社区变得更好，请特别注意以下内容在应用中不被允许：\n\n1. 任何关于儿童伤害、儿童色情或与儿童相关的有害内容。\n2. 针对近期或正在发生事件的虚假或有害信息。\n3. 任何暴力、霸凌、公开宣传色情以及其他不当内容。"
              )
              Text(
                "若发现包括但不限于以上违规内容，我们可能会删除相关内容并封禁账号。点击“我同意”按钮即表示你已阅读并同意本应用的使用条款和隐私政策。"
              )
            }
            .foregroundColor(.primary)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.systemBackground))
            )
            .padding(.horizontal)
            .padding(.bottom, 8)
          }
          .background(Color.clear)
          .onAppear {
            // 初次进入默认允许直接同意，不强制滚动到底
            hasScrolledToBottom = true
          }

          HStack(spacing: 16) {
            Button {
              // 直接退出应用由系统控制，这里先不做处理
            } label: {
              Text("Cancel")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                  RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color(.systemGray6))
                )
            }

            Button {
              appDataStore.markEULAAccepted()
            } label: {
              Text("I agree")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                  RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(hasScrolledToBottom ? Color.accentColor : Color.gray)
                )
            }
            .disabled(!hasScrolledToBottom)
          }
          .padding(.horizontal)
          .padding(.bottom, 24)
        }
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }
}
