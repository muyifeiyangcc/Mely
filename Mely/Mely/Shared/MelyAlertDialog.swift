//
//  MelyAlertDialog.swift
//  Mely
//
//  可复用的 Mely 风格提示弹窗：粉绿装饰边框、图标、文案、取消/确认按钮
//

import SwiftUI

/// 公共的 Mely 风格提示弹窗
/// 通过 overlay 直接叠加显示，无动画
/// - Parameters:
///   - isPresented: 控制弹窗显示/隐藏
///   - text: 提示文案
///   - iconName: 图标，emoji 字符串（如 "😭"）或 SF Symbol 名称
///   - iconIsSystemImage: true 表示 iconName 为 SF Symbol，false 表示 emoji
///   - btnText: 确认按钮文字
///   - onConfirm: 确认按钮回调
///   - onCancel: 取消按钮回调（可选，点击取消时执行后关闭）
struct MelyAlertDialog: View {
  @Binding var isPresented: Bool
  let text: String
  let iconName: String
  let iconSize: CGFloat
  let btnText: String
  let onConfirm: () -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let aiGreen = Color(hex: "#CBED40")
  private let aiPink = Color(hex: "#FF1AB6")

  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .onTapGesture { performCancel() }

      VStack(spacing: 0) {
        // 装饰性边框与主体
        ZStack(alignment: .topLeading) {
          // 白色主体
          VStack(spacing: 20) {

            // 图标
            Image(iconName)
              .resizable()
              .scaledToFit()
              .frame(width: iconSize, height: iconSize)
              .padding(.top, 80)

            // 提示文案
            Text(text)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
              .multilineTextAlignment(.center)
              .fixedSize(horizontal: false, vertical: true)
              .padding(.horizontal, 44)

            // 按钮区
            VStack(spacing: 12) {
              Button {
                performCancel()
              } label: {
                Text("Cancel")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 14)
                  .background(Capsule().fill(aiGreen))
              }
              .buttonStyle(.plain)

              Button {
                isPresented = false
                onConfirm()
              } label: {
                Text(btnText)
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.white)
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 14)
                  .background(Capsule().fill(Color.black))
              }
              .buttonStyle(.plain)
            }
            .padding(.horizontal, 54)
            .padding(.bottom, 20)
          }
          // .background(
          //   RoundedRectangle(cornerRadius: 16)
          //     .fill(Color.white)
          // )
          // .padding(8)
        }
        // .frame(maxWidth: 300)
      }
      .background(
        Image("LBDSPQrZFHHR")
          .resizable()
          // .ignoresSafeArea()
          // .scaledToFill()
          .frame(width: 320, height: 360)
        // .frame(maxWidth: .infinity, maxHeight: .infinity)
        // .clipped()
      )
      .padding(.horizontal, 40)
    }

    #if DEBUG
      .enableInjection()
    #endif
  }

  private func performCancel() {
    onCancel?()
    isPresented = false
  }
}
