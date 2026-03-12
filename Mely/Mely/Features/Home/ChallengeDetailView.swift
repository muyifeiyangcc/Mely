//
//  ChallengeDetailView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct ChallengeDetailView: View {
  @Binding var path: [MainRoute]
  let challengeId: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var appDataStore: AppDataStore

  @State private var showReportBlockSheet: Bool = false
  @State private var showReportSheet: Bool = false

  private var challenge: DanceChallenge? {
    appDataStore.filteredChallenges.first { $0.id == challengeId }
  }

  private var videos: [ChallengeVideo] {
    appDataStore.filteredChallengeVideos.filter { $0.challengeId == challengeId }
  }

  private let headerGradient = LinearGradient(
    colors: [
      Color(red: 0.35, green: 0.85, blue: 0.5),
      Color(red: 0.2, green: 0.35, blue: 0.6),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  private let cardGradient = LinearGradient(
    colors: [
      Color(red: 0.6, green: 0.35, blue: 0.75),
      Color(red: 0.85, green: 0.4, blue: 0.65),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    ZStack {
      Image("kgubofsruboqbg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        MelyTopBarView(
          title: "",
          onBack: { dismiss() },
          onMoreTap:
            challenge?.userId != appDataStore.currentUser?.id
            ? {
              showReportBlockSheet = true
            } : nil
        )

        // 挑战信息卡片
        topCard

        if videos.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView {
            // 视频网格
            videoGrid
              .padding(.horizontal, 16)
              .padding(.vertical, 16)
            // .frame(minHeight: 400)
          }
        }
        
        // 底部参与挑战按钮
        joinButton

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
            if let uid = challenge?.userId {
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
          onSubmit: { _, _ in /* 举报挑战 */ }
        )
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - 顶部：返回 + 挑战信息卡片
  private var topCard: some View {
    ZStack(alignment: .topTrailing) {
      // 紫色-粉色渐变卡片
      Image("oxboyzczatlm")
        .resizable()
        // .scaledToFill()
        // .frame(width: .infinity, height: .infinity)
        // .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal, 20)
        .padding(.top, 30)

      // 闪电图标
      Image("bvvlvztdgkru_shandian")
        .resizable()
        .frame(width: 100, height: 100)
        .padding(.trailing, 16)

      // 内容
      VStack {
        if let challenge = challenge {
          HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
              Text(challenge.title)
                .font(.custom("Hanchansans-Medium", size: 24).bold())
                .foregroundColor(.white)
              Text(
                challenge.description
              )
              .lineLimit(2)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.white.opacity(0.8))

              Image("eaynmjbwgatf_star")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 16)
            }
            .padding(.leading, 16)

            Spacer()
          }
          .padding(.horizontal, 20)
        }
      }
      .padding(.top, 50)
    }
    .frame(width: .infinity, height: 210)
  }

  // MARK: - 视频网格（每行 3 个）
  private var videoGrid: some View {
    let gridSpacing: CGFloat = 12
    let columns = [
      GridItem(.flexible(minimum: 0), spacing: gridSpacing, alignment: .top),
      GridItem(.flexible(minimum: 0), spacing: gridSpacing, alignment: .top),
      GridItem(.flexible(minimum: 0), spacing: gridSpacing, alignment: .top),
    ]
    return LazyVGrid(columns: columns, spacing: gridSpacing) {
      ForEach(videos) { video in
        Button {
          path.append(.videoDetail(videoId: video.id))
        } label: {
          ChallengeVideoCell(
            video: video,
            isEffectivelyLocked: appDataStore.isVideoEffectivelyLocked(video)
          )
          .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.vertical, 8)
  }

  // MARK: - 底部参与挑战按钮
  private var joinButton: some View {
    Button {
      path.append(.uploadVideo(challengeId: challengeId))
    } label: {
      Text("Join the challenge")
        .font(.custom("Hanchansans-Medium", size: 20))
        .foregroundColor(.black)
        .frame(width: 250)
        .padding(.vertical, 15)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 20)
    .padding(.bottom, 14)
  }
}

// MARK: - 挑战视频单元格（已解锁 / 锁定）
struct ChallengeVideoCell: View {
  let video: ChallengeVideo
  /// 对当前用户而言是否仍为锁定（需付费且未解锁）
  let isEffectivelyLocked: Bool
  private let thumbnailHeight: CGFloat = 142
  private let cellHeight: CGFloat = 188

  var body: some View {
    VStack(alignment: .leading, spacing: 3) {
      ZStack(alignment: .center) {
        thumbnailView
        if isEffectivelyLocked {
          lockedOverlay
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: thumbnailHeight)
      .clipShape(
        UnevenRoundedRectangle(
          topLeadingRadius: 16,
          bottomLeadingRadius: 0,
          bottomTrailingRadius: 0,
          topTrailingRadius: 16,
          style: .continuous
        )
      )

      HStack(spacing: 4) {
        Image("SB1tyFVKKZhI_xinfen")
          .resizable()
          .frame(width: 22, height: 22)
        Text(video.likeCountFormatted)
          .font(.system(size: 13))
          .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
      }
      .padding(.top, 4)
      .padding(.bottom, 6)
      .padding(.horizontal, 8)
    }
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    .frame(height: cellHeight, alignment: .top)
  }

  private var thumbnailView: some View {
    Group {
      if let name = video.thumbnailName, !name.isEmpty {
        SmartImageView.namedOrPath(name, placeholder: Image("dengxuanbg"))
          .scaledToFill()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .clipped()
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .blur(radius: isEffectivelyLocked ? 4 : 0)
  }

  private var lockedOverlay: some View {
    HStack(spacing: 4) {
      Image("mkirgxytewig_diamond")
        .resizable()
        .frame(width: 20, height: 20)
      Text("-\(video.unlockCostDiamonds ?? 0)")
        .font(.custom("Hanchansans-Medium", size: 14))
        .foregroundColor(.white)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
    .background(
      Capsule().fill(Color.black.opacity(0.5))
    )
  }
}
