//
//  CommunityView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct CommunityView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var selectedTag: String? = nil

  private let tags: [String] = ["推荐", "热门", "最新", "关注"]

  var body: some View {
    VStack(spacing: 0) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 10) {
          ForEach(tags, id: \.self) { tag in
            let isActive = tag == (selectedTag ?? tags.first)

            Button {
              selectedTag = tag
            } label: {
              Text(tag)
                .font(.subheadline.weight(.medium))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                  Capsule()
                    .fill(isActive ? Color.accentColor.opacity(0.15) : Color(.systemGray6))
                )
                .foregroundColor(isActive ? .accentColor : .primary)
            }
          }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
      }

      List {
        Section("社区") {
          ForEach(appDataStore.data.posts) { post in
            VStack(alignment: .leading, spacing: 6) {
              Text(post.title)
                .font(.headline)
              Text(post.content)
                .font(.subheadline)
                .foregroundColor(.secondary)

              if let author = appDataStore.data.users.first(where: { $0.id == post.userId }) {
                Text(author.name)
                  .font(.caption)
                  .foregroundColor(.secondary)
              }
            }
            .padding(.vertical, 4)
          }
        }
      }
      .listStyle(.plain)
    }
    .navigationTitle("社区")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          appDataStore.addPost(title: "一条新的示例帖子", content: "通过右上角按钮快速创建的示例内容。")
        } label: {
          Image(systemName: "square.and.pencil")
        }
      }
    }
    #if DEBUG
    .enableInjection()
    #endif
  }
}

