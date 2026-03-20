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

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private struct Item: Identifiable {
    let id = UUID()
    let route: MainRoute
    let icon: String
    let color: Color
  }

  private var items: [Item] {
    [
      .init(route: .community, icon: "fomukfenfipn_shequ", color: .blue),
      .init(route: .chat, icon: "tqzeddjmrtrd_dinglin", color: .green),
      .init(route: .profile, icon: "tqzeddjmrtrd_faxian", color: .orange),
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

      HStack(alignment: .center, spacing: 0) {
        if isExpanded {
          ForEach(items) { item in
            Button {
              withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                isExpanded = false
                onSelect(item.route)
              }
            } label: {
              HStack(spacing: 0) {
                Image(item.icon)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 33, height: 33)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 10)
              // .background(
              //   Capsule()
              //     .fill(item.color.gradient)
              // )
              // .shadow(color: item.color.opacity(0.35), radius: 10, x: 0, y: 6)
            }
            .transition(.move(edge: .trailing).combined(with: .opacity))
          }
        }

        Button {
          withAnimation(.spring(response: 0.4, dampingFraction: 0.9)) {
            isExpanded.toggle()
          }
        } label: {
          Image(isExpanded ? "eibyitqppmfu_shou" : "eibyitqppmfu")
            .resizable()
            .frame(width: 68, height: 68)
            .padding(0)
        }
        .accessibilityLabel("yemian qiehuan")
      }
      .padding(.leading, isExpanded ? 14 : 0)
      .background(
        Capsule()
          .fill(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
          .padding(.vertical, 4)
          .padding(.horizontal, 6)
      )
    }
    #if DEBUG
      .enableInjection()
    #endif
  }
}
