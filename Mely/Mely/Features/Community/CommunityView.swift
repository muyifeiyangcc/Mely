//
//  CommunityView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct CommunityView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  /// 标签预设颜色（与设计图一致：绿、浅黄等）
  private let tagColors: [Color] = [
    Color(red: 0.2, green: 0.75, blue: 0.4),  // 绿色 Daily
    Color(red: 0.95, green: 0.85, blue: 0.4),  // 浅黄 Baby
    Color(red: 0.4, green: 0.6, blue: 0.95),
  ]

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .font(.body.weight(.semibold))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(Circle().fill(Color.white))
          }
          Spacer()

          Text("Circle Square")
            .font(.custom("Hanchansans-Medium", size: 24))
            .foregroundColor(.white)
          Spacer()

          Button {
            path.append(.communityPostCreate)
          } label: {
            Image("xieqingadd")
              .resizable()
              .frame(width: 44, height: 44)
          }
        }
        .padding(.horizontal, 20)

        ScrollView(.vertical, showsIndicators: false) {
          LazyVStack(spacing: 20) {
            ForEach(appDataStore.data.communityPosts) { post in
              Button {
                path.append(.communityPostDetail(postId: post.id))
              } label: {
                CommunityPostCard(
                  post: post,
                  user: appDataStore.data.users.first(where: { $0.id == post.userId }),
                  tagColors: tagColors
                )
              }
              .buttonStyle(.plain)
            }
          }
          .padding(.horizontal, 16)
          .padding(.top, 12)
          .padding(.bottom, 32)
        }
      }

    }
    .navigationBarBackButtonHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }
}

// MARK: - 单条社区帖子卡片（可复用）

struct CommunityPostCard: View {
  let post: CommunityPostModel
  let user: UserModel?
  let tagColors: [Color]

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // 用户信息行：头像、昵称、日期、更多
      HStack(alignment: .center, spacing: 10) {
        Circle()
          .fill(Color.white.opacity(0.25))
          .overlay {
            if let user = user {
              Image(systemName: user.avatarSymbol)
                .font(.title2)
                .foregroundColor(.white)
            }
          }
          .frame(width: 40, height: 40)

        VStack(alignment: .leading, spacing: 2) {
          Text(user?.name ?? "用户")
            .font(.subheadline.weight(.medium))
            .foregroundColor(.white)
          Text(post.dateString)
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))
        }

        Spacer()

        Button {
          // 更多菜单
        } label: {
          Image(systemName: "ellipsis")
            .font(.body.weight(.medium))
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 12)
      .padding(.top, 12)
      .padding(.bottom, 10)

      // 帖子主图
      Image(post.imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: .infinity)
        .frame(height: 280)
        .cornerRadius(16)
        .clipped()
        .padding(.horizontal, 12)

      // 标签 + 互动区
      HStack(alignment: .center, spacing: 10) {
        // 标签
        HStack(spacing: 8) {
          ForEach(Array(post.tags.enumerated()), id: \.offset) { index, tag in
            Text(tag)
              .font(.caption.weight(.medium))
              .foregroundColor(.white)
              .padding(.horizontal, 10)
              .padding(.vertical, 5)
              .background(
                Capsule().fill(tagColors[index % tagColors.count])
              )
          }
        }

        Spacer()

        // 评论、点赞（白底圆角）
        HStack(spacing: 16) {
          Button {
            // 评论
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "bubble.right")
                .font(.subheadline)
              if post.commentCount > 0 {
                Text("\(post.commentCount)")
                  .font(.caption)
              }
            }
            .foregroundColor(.primary)
          }
          Button {
            // 点赞
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "hand.thumbsup")
                .font(.subheadline)
              if post.likeCount > 0 {
                Text("\(post.likeCount)")
                  .font(.caption)
              }
            }
            .foregroundColor(.primary)
          }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
        )
      }
      .padding(.horizontal, 12)
      .padding(.top, 10)
      .padding(.bottom, 12)
    }
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
        .stroke(Color.white.opacity(0.5), lineWidth: 1)
    )
  }
}

// #Preview {
//   NavigationStack {
//     CommunityView()
//       .environmentObject(AppDataStore())
//   }
// }
