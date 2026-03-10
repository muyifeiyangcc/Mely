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

  private var video: ChallengeVideo? {
    appDataStore.data.challengeVideos.first { $0.id == videoId }
  }

  private var author: UserModel? {
    guard let userId = video?.userId else { return nil }
    return appDataStore.data.users.first { $0.id == userId }
  }

  var body: some View {
    ZStack {
      Color(.black)
        .ignoresSafeArea()
        
      // 视频背景（锁定时模糊）
      videoBackground

      VStack(spacing: 0) {
        // 顶部导航栏
        topBar
          .padding(.top, 40)

        Spacer()

        // 锁定时显示遮罩层
        if video?.isLocked == true {
          lockOverlay
        } else {
          // 未锁定时显示播放按钮
          if isPlaying {
            playButtonOverlay
          }
        }

        Spacer()

        // 底部用户互动栏
        bottomInteractionBar
          .padding(.bottom, 20)
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
    guard let v = video, v.isLocked == false,
      let name = v.videoName, !name.isEmpty,
      let url = urlForVideoName(name)
    else { return }
    let p = AVPlayer(url: url)
    player = p
    p.play()
    isPlaying = true
  }

  private func urlForVideoName(_ name: String) -> URL? {
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
      if let p = player, video?.isLocked != true {
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
          Image("dengxuanbg")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .blur(radius: video?.isLocked == true ? 5 : 0)

          Color.black.opacity(video?.isLocked == true ? 0.3 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .ignoresSafeArea()
  }

  // MARK: - 顶部导航栏

  private var topBar: some View {
    HStack {
      Button {
        dismiss.callAsFunction()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.primary)
          .frame(width: 44, height: 44)
          .background(Circle().fill(.ultraThinMaterial))
      }
      .padding(.leading, 16)
      .padding(.top, 8)

      Spacer()

      Text("Post")
        .font(.system(size: 17, weight: .semibold))
        .foregroundColor(.white)

      Spacer()

      Button {
        // 更多选项
      } label: {
        Image(systemName: "ellipsis")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.primary)
          .frame(width: 44, height: 44)
          .background(Circle().fill(.ultraThinMaterial))
      }
      .padding(.trailing, 16)
      .padding(.top, 8)
    }
  }

  // MARK: - 锁定遮罩层（锁形图标 + 解锁金额）

  private var lockOverlay: some View {
    ZStack(alignment: .bottom) {
      // 锁形图标
      Image("apavyrcoicqv_lock")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240)
        .shadow(color: .white.opacity(0.5), radius: 20)

      // 解锁金额横幅（绿色胶囊 + 钻石 -300）
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
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .fill(Color(hex: "#CBED40"))
          .shadow(color: .white.opacity(0.5), radius: 20)
      )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }

  // MARK: - 播放按钮（未锁定）

  private var playButtonOverlay: some View {
    Button {
      guard let p = player else { return }
      if isPlaying {
        p.pause()
        isPlaying = false
      } else {
        p.play()
        isPlaying = true
      }
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
    .buttonStyle(.plain)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }

  // MARK: - 底部互动栏（头像、Following、点赞）

  private var bottomInteractionBar: some View {
    HStack(spacing: 12) {
      // 用户头像
      if let author {
        Image(systemName: author.avatarSymbol)
          .font(.system(size: 24))
          .foregroundColor(.white)
          .frame(width: 44, height: 44)
          .background(
            Circle()
              .stroke(
                LinearGradient(
                  colors: [
                    Color(red: 1, green: 0.6, blue: 0.2),
                    Color(red: 1, green: 0.4, blue: 0.55),
                  ],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                ),
                lineWidth: 2
              )
              .background(Circle().fill(.ultraThinMaterial))
          )
      }

      // Following 按钮
      Button("Following") {}
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.black)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white))

      // 点赞数
      HStack(spacing: 4) {
        Image(systemName: "heart.fill")
          .font(.system(size: 14))
          .foregroundColor(Color(red: 1, green: 0.4, blue: 0.55))
        Text(video?.likeCountFormatted ?? "0")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.black)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Capsule().fill(.white))
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
