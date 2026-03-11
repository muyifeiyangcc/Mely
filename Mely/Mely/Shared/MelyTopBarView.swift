//
//  MelyTopBarView.swift
//  Mely
//
//  公共顶部操作栏：固定样式的返回按钮 + 可选的更多按钮（三点）
//  更多按钮接收回调，点击后由调用方打开举报拉黑等弹窗
//

import SwiftUI

/// 公共顶部操作栏
/// - Parameters:
///   - title: 居中标题
///   - onBack: 返回按钮回调
///   - onMoreTap: 更多按钮回调，为 nil 时不显示更多按钮
struct MelyTopBarView: View {
  let title: String
  let onBack: () -> Void
  var onMoreTap: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    HStack {
      // 返回按钮
      Button(action: onBack) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.white)
          .frame(width: 44, height: 44)
          .background(.white.opacity(0.15))
          .clipShape(Circle())
      }
      .buttonStyle(.plain)

      Spacer()

      Text(title)
        .font(.system(size: 22, weight: .semibold))
        .foregroundColor(.white)

      Spacer()

      // 更多按钮（可选）
      Group {
        if let onMoreTap {
          Button(action: onMoreTap) {
            Image(systemName: "ellipsis")
              .font(.system(size: 18, weight: .semibold))
              .foregroundColor(.white)
              .frame(width: 44, height: 44)
              .background(.white.opacity(0.15))
              .clipShape(Circle())
          }
          .buttonStyle(.plain)
        } else {
          Color.clear
            .frame(width: 44, height: 44)
        }
      }
    }
    .padding(.horizontal, 16)
    .padding(.top, 6)
    .padding(.bottom, 10)
    #if DEBUG
      .enableInjection()
    #endif
  }
}

#Preview {
  ZStack {
    Color.black
    VStack {
      MelyTopBarView(title: "Tylor Farrell", onBack: {}, onMoreTap: {})
      Spacer()
    }
  }
  .preferredColorScheme(.dark)
}
