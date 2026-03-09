//
//  ChallengeDetailView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct ChallengeDetailView: View {
  @Binding var path: [MainRoute]
  let challengeId: UUID

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss

  private var challenge: DanceChallenge? {
    DanceChallenge.sampleChallenges.first { $0.id == challengeId }
  }

  private var videos: [ChallengeVideo] {
    ChallengeVideo.sampleVideos(forChallengeId: challengeId)
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
        // 返回按钮
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
          .padding(.leading, 16)
          .padding(.top, 8)

          Spacer()
        }

        // 挑战信息卡片
        topCard

        ScrollView {
          // 视频网格
          videoGrid
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
          // .frame(minHeight: 400)
        }

        // Spacer(minLength: 0)

        // 底部参与挑战按钮
        joinButton

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

      // 闪电图标
      Image("bvvlvztdgkru_shandian")
        .resizable()
        .frame(width: 100, height: 100)
        .padding(.trailing, 16)
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
        ChallengeVideoCell(video: video)
          .frame(maxWidth: .infinity)
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
  private let thumbnailHeight: CGFloat = 142
  private let cellHeight: CGFloat = 188

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      ZStack(alignment: .center) {
        thumbnailView
        if video.isLocked {
          lockedOverlay
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: thumbnailHeight)
      // .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
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
        Image(systemName: "heart.fill")
          .font(.caption)
          .foregroundColor(Color(red: 1, green: 0.4, blue: 0.55))
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
        Image("dengxuanbg")
          // Image(name)
          .resizable()
          .scaledToFill()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .clipped()
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .blur(radius: video.isLocked ? 4 : 0)
  }

  private var lockedOverlay: some View {
    HStack(spacing: 4) {
      Image(systemName: "diamond.fill")
        .font(.caption)
        .foregroundColor(.blue)
      Text("-\(video.unlockCostDiamonds ?? 0)")
        .font(.caption.weight(.medium))
        .foregroundColor(.white)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 6)
    .background(
      Capsule().fill(Color.black.opacity(0.5))
    )
  }
}

#Preview {
  NavigationStack {
    ChallengeDetailView(path: .constant([]), challengeId: DanceChallenge.sampleChallenges[0].id)
  }
}
