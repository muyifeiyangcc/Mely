//
//  CommunityPostDetailView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

let emojiOptions: [String] = [
  "aobfkwhdzahn1", "aobfkwhdzahn2", "aobfkwhdzahn3", "aobfkwhdzahn4", "aobfkwhdzahn5",
  "aobfkwhdzahn6",
]

struct CommunityPostDetailView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  let postId: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var commentText: String = ""
  @State private var isEmojiPanelPresented: Bool = false
  @State private var showReportBlockSheet: Bool = false
  @State private var showReportSheet: Bool = false
  /// 当前举报/拉黑的目标用户 id（顶部栏为帖子作者，评论项为评论作者）
  @State private var reportBlockTargetUserId: String?

  private var post: CommunityPostModel? {
    appDataStore.data.communityPosts.first(where: { $0.id == postId })
  }

  private var author: UserModel? {
    guard let userId = post?.userId else { return nil }
    return appDataStore.data.users.first(where: { $0.id == userId })
  }

  private var comments: [CommunityCommentModel] {
    appDataStore.data.communityComments.filter { $0.postId == postId }
  }

  var body: some View {
    ZStack(alignment: .bottom) {
      Image("kgubofsruboqbg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        if let post {
          ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
              Rectangle()
                .fill(Color.clear)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .frame(maxWidth: .infinity)
                .overlay {
                  SmartImageView.namedOrPath(post.imageName)
                }
                .clipShape(
                  UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 30,
                    bottomTrailingRadius: 30,
                    topTrailingRadius: 0,
                    style: .continuous
                  )
                )
                .ignoresSafeArea()

              authorSection(for: post)
                .padding(.horizontal, 20)
              commentsSection
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 80)
          }
        } else {
          Text("帖子已不存在。")
            .foregroundColor(.white)
        }
      }
      .ignoresSafeArea(edges: .top)

      VStack {
        // topBar
        MelyTopBarView(
          title: "",
          onBack: { dismiss() },
          onMoreTap: {
            reportBlockTargetUserId = post?.userId
            showReportBlockSheet = true
          }
        )

        Spacer()
      }

      commentInputBar
      // .offset(y: isEmojiPanelPresented ? -80 : 0)

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
            let target = reportBlockTargetUserId
            if let uid = target {
              appDataStore.blockUser(uid: uid)
            }
            reportBlockTargetUserId = nil
            showReportBlockSheet = false
            if target == post?.userId { dismiss() }
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
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var topBar: some View {
    HStack {
      Button {
        dismiss.callAsFunction()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Button {
        // 更多
      } label: {
        Image(systemName: "ellipsis")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }
    }
    .padding(.horizontal, 20)
  }

  private func authorSection(for post: CommunityPostModel) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 10) {
        if let author {
          Circle()
            .fill(Color.white.opacity(0.25))
            .overlay {
              Image(author.avatarSymbol)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            }
            .frame(width: 50, height: 50)

          VStack(alignment: .leading, spacing: 4) {
            Text(author.name)
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            Text(post.dateString)
              .font(.custom("Hanchansans-Medium", size: 13))
              .foregroundColor(.white.opacity(0.7))
          }
        }

        Spacer()

        Button {
          // 关注按钮当前为静态
        } label: {
          Text("Following")
            .font(.custom("Hanchansans-Medium", size: 16))
            .foregroundColor(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
              RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
            )
        }
      }

      Text(post.description)
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)

    }
  }

  private var commentsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Text("Comments")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 22, height: 22)
      }
      .padding(.bottom, 10)

      ForEach(comments) { comment in
        CommentRow(
          comment: comment,
          user: appDataStore.data.users.first { $0.id == comment.userId },
          onMoreTap: {
            reportBlockTargetUserId = comment.userId
            showReportBlockSheet = true
          }
        )
      }
    }
  }

  private var commentInputBar: some View {
    VStack {
      if isEmojiPanelPresented {
        emojiPanel
          .transition(.move(edge: .bottom))
      }

      HStack(spacing: 12) {
        HStack {
          TextField(
            "",
            text: $commentText,
            prompt: Text("Add comment").foregroundColor(Color.gray)
          )
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 16)

          Button {
            sendComment()
          } label: {
            Image(systemName: "paperplane")
              .font(Font.system(size: 24))
              .foregroundColor(.white)
              .padding(.horizontal, 12)
          }
        }
        .background(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
        .clipShape(Capsule())

        Button {
          // isEmojiPanelPresented.toggle()
          // withAnimation(.spring(response: 0.1, dampingFraction: 0.9)) {
          withAnimation(.easeInOut(duration: 0.22)) {
            isEmojiPanelPresented.toggle()
          }
        } label: {
          Image(systemName: "face.smiling")
            .font(.system(size: 34))
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 16)
      .padding(.top, 10)
      // .padding(.vertical, 10)
    }
    .background(
      Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255)
        .ignoresSafeArea(edges: .bottom)
    )
  }

  private var emojiPanel: some View {
    HStack(spacing: 16) {
      Spacer()
      ForEach(emojiOptions, id: \.self) { emoji in
        Button {
          appDataStore.addCommunityComment(text: emoji, to: postId)
          withAnimation(.easeInOut(duration: 0.18)) {
            isEmojiPanelPresented = false
          }
        } label: {
          Image(emoji)
            .resizable()
            .frame(width: 36, height: 36)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.top, 12)
    .padding(.trailing, 18)
    .background(
      Color(red: 255 / 255, green: 0 / 255, blue: 191 / 255)
        .ignoresSafeArea(edges: .bottom)
    )
  }

  private func sendComment() {
    guard !commentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
    appDataStore.addCommunityComment(text: commentText, to: postId)
    commentText = ""
  }
}

private struct CommentRow: View {
  let comment: CommunityCommentModel
  let user: UserModel?
  var onMoreTap: (() -> Void)?

  var body: some View {
    VStack(spacing: 0) {
      HStack(alignment: .top, spacing: 10) {
        Circle()
          .fill(Color.white.opacity(0.25))
          .overlay {
            if let user {
              Image(user.avatarSymbol)
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .clipShape(Circle())
            }
          }
          .frame(width: 38, height: 38)

        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Text(user?.name ?? "Username")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            Spacer()

            Button {
              onMoreTap?()
            } label: {
              Image(systemName: "ellipsis")
                .font(.system(size: 22))
                .foregroundColor(.white)
            }
            .buttonStyle(.plain)
          }
          .padding(.bottom, 4)

          if comment.text.hasPrefix("aobfkwhdzahn") {
            Image(comment.text)
              .resizable()
              .frame(width: 36, height: 36)
          } else {
            Text(comment.text)
              .font(.subheadline)
              .foregroundColor(.white)
              .fixedSize(horizontal: false, vertical: true)
          }

          Text(comment.dateString)
            .font(.custom("Hanchansans-Medium", size: 13))
            .foregroundColor(.white.opacity(0.6))
        }
        .padding(.top, 6)
      }

      // 分割线
      Divider()
        .background(Color.white)
        .padding(.top, 16)
        .padding(.bottom, 6)
    }

  }
}

#Preview {
  NavigationStack {
    CommunityPostDetailView(postId: "cp1")
      .environmentObject(AppDataStore())
  }
}
