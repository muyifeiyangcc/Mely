//
//  VideoDetailView.swift
//  Mely
//
//  Created by yangyang on 2026/3/9.
//

import AVKit
import SwiftUI

struct VideoDetailView: View {
  @Binding var path: [MainRoute]
  let videoId: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var appDataStore: AppDataStore
  @State private var player: AVPlayer?
  @State private var isPlaying = false
  @State private var showReportBlockSheet: Bool = false
  @State private var showReportSheet: Bool = false
  @State private var showInsufficientBalanceDialog: Bool = false

  private var video: ChallengeVideo? {
    appDataStore.filteredChallengeVideos.first { $0.id == videoId }
  }

  private var author: UserModel? {
    guard let userId = video?.userId else { return nil }
    return appDataStore.data.users.first { $0.id == userId }
  }

  /// 视频对当前用户而言是否仍为锁定（需付费且未解锁）
  private var isEffectivelyLocked: Bool {
    guard let v = video else { return false }
    return appDataStore.isVideoEffectivelyLocked(v)
  }

  var body: some View {
    ZStack {
      Color(.black)
        .ignoresSafeArea()

      // 视频背景（锁定时模糊）
      videoBackground

      VStack(spacing: 0) {
        // 顶部导航栏
        MelyTopBarView(
          title: "Post",
          onBack: { dismiss() },
          onMoreTap:
            video?.userId != appDataStore.currentUser?.id
            ? {
              showReportBlockSheet = true
            } : nil
        )
        .padding(.top, 50)

        Spacer()

        // 锁定时显示遮罩层
        if isEffectivelyLocked {
          lockOverlay
        } else {
          // 未锁定时：可点击切换播放/暂停，仅在暂停时显示中央播放图标
          videoTapOverlay
        }

        Spacer()

        // 底部用户互动栏
        bottomInteractionBar
          .padding(.bottom, 20)
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
            if let uid = video?.userId {
              appDataStore.blockUser(uid: uid)
              path.removeAll()
            }
            showReportBlockSheet = false
          }
        )
      }
    }
    .overlay {
      if showReportSheet {
        MelyReportSheet(
          isPresented: $showReportSheet,
          onSubmit: { _, _ in /* 举报视频 */ }
        )
      }
    }
    .overlay {
      if showInsufficientBalanceDialog {
        MelyAlertDialog(
          isPresented: $showInsufficientBalanceDialog,
          text: "Sorry, your wallet balance is insufficient. Do you want to go for recharge?",
          iconName: "kuku3kywiTUzOpQ1",
          iconSize: 52,
          btnText: "Confirm",
          onConfirm: { path.append(.wallet) }
        )
      }
    }
    .ignoresSafeArea()
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .onAppear { setupPlayer() }
    .onChange(of: videoId) { _, _ in setupPlayer() }
    .onDisappear { player?.pause() }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func setupPlayer() {
    player?.pause()
    player = nil
    guard let v = video, !appDataStore.isVideoEffectivelyLocked(v),
      let name = v.videoName, !name.isEmpty,
      let url = urlForVideoName(name)
    else { return }
    let p = AVPlayer(url: url)
    player = p
    p.play()
    isPlaying = true
  }

  private func urlForVideoName(_ name: String) -> URL? {
    // 优先尝试 Application Support 本地路径（用户上传视频）
    if let url = ImageStorageHelper.resolveVideoURL(name) { return url }
    // 回退到 Bundle 资源
    let parts = name.split(separator: "/").map(String.init)
    let resourceName = parts.last ?? name
    let subdirectory = parts.count > 1 ? parts.dropLast().joined(separator: "/") : nil
    return Bundle.main.url(
      forResource: resourceName, withExtension: "mp4", subdirectory: subdirectory)
      ?? Bundle.main.url(forResource: resourceName, withExtension: "mp4")
  }

  // MARK: - 视频背景
  private var videoBackground: some View {
    Group {
      if let p = player, !isEffectivelyLocked {
        GeometryReader { geo in
          let w = geo.size.width
          let h = geo.size.height
          let videoAspect: CGFloat = 9 / 16  // 竖屏 9:16，横屏可改为 16/9
          let viewW = w
          let viewH = w / videoAspect
          VideoPlayer(player: p)
            .disabled(true)
            .frame(width: viewW, height: viewH)
            .frame(width: w, height: h)
            .clipped()
        }
      } else if let name = video?.thumbnailName, !name.isEmpty {
        ZStack {
          Rectangle()
            .fill(Color.clear)
            .frame(height: .infinity)
            .frame(maxWidth: .infinity)
            .overlay {
              SmartImageView.namedOrPath(name, placeholder: Image("dengxuanbg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .blur(radius: isEffectivelyLocked ? 5 : 0)
            }

          Color.black.opacity(isEffectivelyLocked ? 0.5 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .ignoresSafeArea()
  }

  // MARK: - 锁定遮罩层（锁形图标 + 解锁金额）
  private var lockOverlay: some View {
    ZStack(alignment: .bottom) {
      // 锁形图标
      Image("apavyrcoicqv_lock")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240)

      // 解锁金额横幅（绿色胶囊 + 钻石 -300）可点击
      Button {
        if appDataStore.unlockVideo(videoId: videoId) {
          setupPlayer()
        } else {
          showInsufficientBalanceDialog = true
        }
      } label: {
        HStack(spacing: 6) {
          Image("mkirgxytewig_diamond")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
          Text("-\(video?.unlockCostDiamonds ?? 0)")
            .font(.custom("Hanchansans-Medium", size: 28))
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 2)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(hex: "#CBED40"))
            .shadow(color: .white.opacity(0.5), radius: 20)
        )
      }
      .buttonStyle(.plain)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.bottom, 40)
  }

  // MARK: - 视频点击区域：点击切换播放/暂停，仅在暂停时显示中央播放图标
  private var videoTapOverlay: some View {
    Color.clear
      .contentShape(Rectangle())
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .onTapGesture {
        guard let p = player else { return }
        if isPlaying {
          p.pause()
          isPlaying = false
        } else {
          p.play()
          isPlaying = true
        }
      }
      .overlay {
        if !isPlaying {
          Button {
            guard let p = player else { return }
            p.play()
            isPlaying = true
          } label: {
            ZStack {
              Circle()
                .fill(.white)
                .frame(width: 70, height: 70)
              Image(systemName: "play.fill")
                .font(.system(size: 32))
                .foregroundStyle(
                  LinearGradient(
                    colors: [
                      Color(hex: "#FF1AB6"),
                      Color(hex: "#CBED40"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                  )
                )
            }
          }

        }
      }
  }

  // MARK: - 底部互动栏（头像、Following、点赞）
  private var bottomInteractionBar: some View {
    HStack(spacing: 12) {
      // 用户头像
      if let author {
        Button {
          // 跳转到用户个人中心页
          let userId = author.id
          path.append(.userProfile(userId: userId))
        } label: {
          UserAvatarView(avatarSymbol: author.avatarSymbol, size: 54)
            .clipShape(Circle())
            .background(
              Circle()
                .stroke(
                  LinearGradient(
                    colors: [
                      Color(hex: "#FF1AB6"),
                      Color(hex: "#CBED40"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                  ),
                  lineWidth: 3
                )
                .background(Circle().fill(.ultraThinMaterial))
            )
        }
      }

      // Following / Follow 按钮（作者本人不显示）
      if let author, author.id != appDataStore.currentUser?.id {
        let isFollowingAuthor = appDataStore.isFollowing(author.id)
        Button(isFollowingAuthor ? "Following" : "Follow") {
          if isFollowingAuthor {
            appDataStore.unfollowUser(uid: author.id)
          } else {
            appDataStore.followUser(uid: author.id)
          }
        }
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.black)
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white))
      }

      // 点赞按钮
      if let video {
        let isLiked = appDataStore.isLiked(video.id)
        Button {
          if isLiked {
            appDataStore.unlikeContent(video.id)
          } else {
            appDataStore.likeContent(video.id)
          }
        } label: {
          HStack(spacing: 4) {
            Image(isLiked ? "SB1tyFVKKZhI_xinfen" : "SB1tyFVKKZhI_xinhui")
              .resizable()
              .frame(width: 24, height: 24)
            // .font(.system(size: 14))
            // .foregroundColor(isLiked ? Color(red: 1, green: 0.4, blue: 0.55) : .gray)
            Text(video.likeCountFormatted)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
          }
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 16)
        .padding(.vertical, 9)
        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white))
      }
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 34)
  }
}

#Preview {
  NavigationStack {
    VideoDetailView(
      path: .constant([]),
      videoId: AppData.makeSample().challengeVideos[0].id
    )
    .environmentObject(AppDataStore())
  }
}
