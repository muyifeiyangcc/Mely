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

  @State private var showReportBlockSheet: Bool = false
  @State private var showReportSheet: Bool = false
  @State private var reportBlockTargetUserId: String?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  /// 标签预设颜色（与设计图一致：绿、浅黄等）
  private let tagColors: [Color] = [
    Color(hex: "#CBED40"),  // 绿色 Daily
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
              .font(.system(size: 18))
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

        if appDataStore.filteredCommunityPosts.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 20) {
              ForEach(appDataStore.filteredCommunityPosts) { post in
                CommunityPostCard(
                  path: $path,
                  post: post,
                  user: appDataStore.data.users.first(where: { $0.id == post.userId }),
                  tagColors: tagColors,
                  onCardTap: { path.append(.communityPostDetail(postId: post.id)) },
                  onMoreTap: {
                    reportBlockTargetUserId = post.userId
                    showReportBlockSheet = true
                  }
                )
              }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 32)
          }
        }
      }

    }
    .overlay {
      if showReportBlockSheet {
        MelyReportBlockSheet(
          isPresented: $showReportBlockSheet,
          onReport: {
            showReportBlockSheet = false
            showReportSheet = true
          },
          onBlock: {
            if let uid = reportBlockTargetUserId {
              appDataStore.blockUser(uid: uid)
              path.removeAll()
            }
            reportBlockTargetUserId = nil
            showReportBlockSheet = false
          }
        )
      }
    }
    .overlay {
      if showReportSheet {
        MelyReportSheet(
          isPresented: $showReportSheet,
          onSubmit: { _, _ in reportBlockTargetUserId = nil },
          onCancel: { reportBlockTargetUserId = nil }
        )
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
  @EnvironmentObject private var appDataStore: AppDataStore
  @Binding var path: [MainRoute]
  let post: CommunityPostModel
  let user: UserModel?
  let tagColors: [Color]
  var onCardTap: (() -> Void)?
  var onMoreTap: (() -> Void)?

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // 用户信息行：头像、昵称、日期、更多（无 onTapGesture，保证按钮可点击）
      HStack(alignment: .center, spacing: 10) {
        Circle()
          .fill(Color.white.opacity(0.25))
          .overlay {
            if let user = user {
              Button {
                // 跳转到用户个人中心页
                path.append(.userProfile(userId: user.id))
              } label: {
                UserAvatarView(avatarSymbol: user.avatarSymbol, size: 40)
                  .clipShape(Circle())
              }
              .buttonStyle(.plain)
            }
          }
          .frame(width: 40, height: 40)

        VStack(alignment: .leading, spacing: 2) {
          Text(user?.name ?? "User")
            .font(.subheadline.weight(.medium))
            .foregroundColor(.white)
          Text(post.dateString)
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))
        }

        Spacer()

        if user?.id != appDataStore.currentUser?.id {
          Button {
            onMoreTap?()
          } label: {
            Image(systemName: "ellipsis")
              .font(.body.weight(.medium))
              .foregroundColor(.white)
              .frame(width: 30, height: 30)
              .background(.black.opacity(0.01))
          }
          .buttonStyle(.plain)
        }
      }
      .padding(.horizontal, 12)
      .padding(.top, 12)
      .padding(.bottom, 10)

      // 帖子主图 + 标签区：点击进入详情（单独加 gesture，避免覆盖上方按钮）
      Group {
        Rectangle()
          .fill(Color.clear)
          .frame(height: 280)
          .frame(maxWidth: .infinity)
          .overlay {
            SmartImageView.namedOrPath(post.imageName)
          }
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .padding(.horizontal, 12)

        // 标签 + 互动区
        HStack(alignment: .center, spacing: 10) {
          // 标签
          HStack(spacing: 8) {
            ForEach(Array(post.tags.enumerated()), id: \.offset) { index, tag in
              Text(tag)
                .font(.custom("Hanchansans-Medium", size: 14))
                .foregroundColor(.black)
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                  RoundedRectangle(cornerRadius: 8).fill(tagColors[index % tagColors.count])
                )
            }

            Text(post.description)
              .font(.custom("Hanchansans-Medium", size: 14))
              .foregroundColor(.white)
              .lineLimit(1)
              .padding(.horizontal, 3)
          }

          Spacer()

          // 评论、点赞（白底圆角）
          HStack(spacing: 16) {
            Button {
              // 评论
            } label: {
              HStack(spacing: 4) {
                Image("j3MSKYctddao_lunp")
                  .resizable()
                  .frame(width: 20, height: 20)
                if post.commentCount > 0 {
                  Text("\(post.commentCount)")
                    .font(.custom("Hanchansans-Medium", size: 13))
                }
              }
              .foregroundColor(.primary)
            }

            Button {
              if appDataStore.isLiked(post.id) {
                appDataStore.unlikeContent(post.id)
              } else {
                appDataStore.likeContent(post.id)
              }
            } label: {
              HStack(spacing: 4) {
                Image(
                  appDataStore.isLiked(post.id) ? "n0d7NjDl3Zun_zanfen" : "n0d7NjDl3Zun_zanhei"
                )
                .resizable()
                .frame(width: 20, height: 20)
                // if post.likeCount > 0 {
                //   Text("\(post.likeCount)")
                //     .font(.caption)
                // }
              }
              .foregroundColor(
                appDataStore.isLiked(post.id) ? Color(red: 1, green: 0.4, blue: 0.55) : .primary)
            }
            .buttonStyle(.plain)
          }
          .padding(.horizontal, 14)
          .padding(.vertical, 7)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .fill(Color.white)
          )
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 12)
      }
      .contentShape(Rectangle())
      .onTapGesture {
        onCardTap?()
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
        .stroke(Color.white.opacity(0.5), lineWidth: 1)
    )
  }
}
