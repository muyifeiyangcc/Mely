//
//  MelyReportBlockSheet.swift
//  Mely
//
//  公共可复用的举报拉黑底部弹窗
//  包含：举报、拉黑账户、取消 三个操作
//

import SwiftUI

/// 公共举报拉黑底部弹窗
/// - Parameters:
///   - isPresented: 控制弹窗显示/隐藏
///   - onReport: 点击举报回调
///   - onBlock: 点击拉黑账户回调
///   - onCancel: 点击取消回调（可选）
struct MelyReportBlockSheet: View {
  @Binding var isPresented: Bool
  let onReport: () -> Void
  let onBlock: () -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let aiGreen = Color(hex: "#CBED40")
  private let aiPink = Color(hex: "#FF1AB6")

  var body: some View {
    ZStack(alignment: .bottom) {
      // 半透明遮罩
      Color.black.opacity(0.6)
        .ignoresSafeArea()
        .onTapGesture { performCancel() }

      // 底部弹窗主体
      VStack(spacing: 46) {
        // 举报、拉黑并排
        HStack(spacing: 80) {
          Button {
            isPresented = false
            onReport()
          } label: {
            Text("Report")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
              .frame(width: 94, height: 94)
              .background(aiPink)
              .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
              .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                  .stroke(Color.white, lineWidth: 2)
              )
          }
          .buttonStyle(.plain)

          Button {
            isPresented = false
            onBlock()
          } label: {
            Text("Block account")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.red)
              .multilineTextAlignment(.center)
              .frame(width: 94, height: 94)
              .background(aiGreen)
              .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
              .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                  .stroke(Color.white, lineWidth: 2)
              )
          }
          .buttonStyle(.plain)
        }

        // 取消
        Button {
          performCancel()
        } label: {
          Text("Cancel")
            .font(.custom("Hanchansans-Medium", size: 18))
            .foregroundColor(.black)
            .frame(maxWidth: 240)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      .padding(.bottom, 34)
      // .background(
      //   RoundedRectangle(cornerRadius: 20, style: .continuous)
      //     .fill(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
      // )
      .padding(.horizontal, 16)
      .padding(.bottom, 16)
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

#Preview {
  struct PreviewWrapper: View {
    @State private var show = true
    var body: some View {
      ZStack {
        Color.gray.opacity(0.3)
        if show {
          MelyReportBlockSheet(
            isPresented: $show,
            onReport: { print("Report") },
            onBlock: { print("Block") },
            onCancel: { print("Cancel") }
          )
        }
      }
    }
  }
  return PreviewWrapper()
}
