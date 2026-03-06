//
//  HomeView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var isRefreshing: Bool = false

  var body: some View {
    ZStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 16) {
          Text("首页")
            .font(.largeTitle.bold())

          if let currentUser = appDataStore.currentUser {
            Text("你好，\(currentUser.name)")
              .font(.headline)
              .foregroundColor(.secondary)
          }

          VStack(alignment: .leading, spacing: 12) {
            ForEach(appDataStore.data.recommendedItems) { item in
              VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                  .font(.headline)

                Text(item.summary)
                  .font(.subheadline)
                  .foregroundColor(.secondary)

                if let author = appDataStore.data.users.first(where: { $0.id == item.userId }) {
                  Text("来自 \(author.name)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
              }
              .padding()
              .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                  .fill(Color(.systemBackground))
                  .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
              )
            }
          }
        }
        .padding(.horizontal)
      }

      if isRefreshing {
        ProgressView()
          .progressViewStyle(.circular)
      }
    }
    .navigationTitle("Mely")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          simulateRefresh()
        } label: {
          Image(systemName: "arrow.clockwise")
        }
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func simulateRefresh() {
    guard !isRefreshing else { return }
    isRefreshing = true

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
      isRefreshing = false
    }
  }
}
