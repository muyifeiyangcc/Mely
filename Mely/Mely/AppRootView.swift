//
//  AppRootView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

enum MainRoute: Hashable {
  case community
  case chat
  case profile
  /// 查看指定用户的个人中心
  case userProfile(userId: String)
  /// 设置页（独立页面）
  case settings
  /// 社区发布帖子
  case communityPostCreate
  /// 社区帖子详情
  case communityPostDetail(postId: String)
  /// 创建舞蹈挑战
  case challengeCreate
  /// 挑战详情页
  case challengeDetail(challengeId: String)
  /// 上传视频页（参与挑战）
  case uploadVideo(challengeId: String)
  /// 视频详情页（Post）
  case videoDetail(videoId: String)
  /// 钱包页（钻石余额与购买）
  case wallet
  /// 健身舞蹈 AI 引导页（消耗钻石进入聊天）
  case aiGuide
  /// 健身舞蹈 AI 提问/聊天页
  case aiChat
}

struct AppRootView: View {
  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @StateObject private var appDataStore = AppDataStore()
  @State private var path: [MainRoute] = []

  var body: some View {
    Group {
      if !appDataStore.data.hasAcceptedEULA {
        EULAView()
      } else if appDataStore.currentUser == nil {
        LoginChoiceView()
      } else {
        NavigationStack(path: $path) {
          HomeView(path: $path)
            .overlay(alignment: .bottomTrailing) {
              if path.isEmpty {
                FloatingPageSwitcher { target in
                  withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    path.append(target)
                  }
                }
                .padding()
              }
            }
            .navigationDestination(for: MainRoute.self) { route in
              switch route {
              case .community:
                CommunityView(path: $path)
              case .chat:
                MessageView()
              case .profile:
                ProfileView(path: $path)
              case .userProfile(let userId):
                ProfileView(path: $path, userId: userId)
              case .settings:
                SettingsView()
              case .communityPostCreate:
                CommunityPostCreateView(path: $path)
              case .communityPostDetail(let postId):
                CommunityPostDetailView(postId: postId)
              case .challengeCreate:
                CreateChallengeView()
              case .challengeDetail(let challengeId):
                ChallengeDetailView(path: $path, challengeId: challengeId)
              case .uploadVideo(let challengeId):
                UploadVideoView(path: $path, challengeId: challengeId)
              case .videoDetail(let videoId):
                VideoDetailView(path: $path, videoId: videoId)
              case .wallet:
                WalletView()
              case .aiGuide:
                AIGuideView(path: $path)
              case .aiChat:
                AIChatView(path: $path)
              }
            }
        }
      }
    }
    .environmentObject(appDataStore)
    #if DEBUG
      .enableInjection()
    #endif
  }
}
