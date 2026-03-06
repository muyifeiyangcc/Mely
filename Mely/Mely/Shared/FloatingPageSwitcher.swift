//
//  FloatingPageSwitcher.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct FloatingPageSwitcher: View {
  let onSelect: (MainRoute) -> Void

  @State private var isExpanded: Bool = false

  private struct Item: Identifiable {
    let id = UUID()
    let route: MainRoute
    let icon: String
    let title: String
    let color: Color
  }

  private var items: [Item] {
    [
      .init(route: .community, icon: "person.3.fill", title: "社区", color: .blue),
      .init(route: .chat, icon: "bubble.left.and.bubble.right.fill", title: "聊天", color: .green),
      .init(route: .profile, icon: "person.crop.circle.fill", title: "我的", color: .orange),
    ]
  }

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      if isExpanded {
        Color.black.opacity(0.001)
          .ignoresSafeArea()
          .onTapGesture {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
              isExpanded = false
            }
          }
      }

      VStack(alignment: .trailing, spacing: 12) {
        if isExpanded {
          ForEach(items) { item in
            Button {
              withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                isExpanded = false
                onSelect(item.route)
              }
            } label: {
              HStack(spacing: 8) {
                Text(item.title)
                  .font(.subheadline.weight(.medium))
                  .foregroundColor(.white)

                Image(systemName: item.icon)
                  .font(.headline)
                  .foregroundColor(.white)
              }
              .padding(.horizontal, 14)
              .padding(.vertical, 10)
              .background(
                Capsule()
                  .fill(item.color.gradient)
              )
              .shadow(color: item.color.opacity(0.35), radius: 10, x: 0, y: 6)
            }
            .transition(.move(edge: .trailing).combined(with: .opacity))
          }
        }

        Button {
          withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
            isExpanded.toggle()
          }
        } label: {
          Image(systemName: isExpanded ? "xmark" : "arrow.right.circle.fill")
            .font(.system(size: 26, weight: .bold))
            .foregroundColor(.white)
            .padding(18)
            .background(
              Circle()
                .fill(Color.accentColor.gradient)
            )
            .shadow(color: .black.opacity(0.25), radius: 14, x: 0, y: 10)
        }
        .accessibilityLabel("页面切换")
      }
    }
  }
}

