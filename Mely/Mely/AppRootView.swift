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
  /// 设置页（独立页面）
  case settings
  /// 社区发布帖子
  case communityPostCreate
  /// 社区帖子详情
  case communityPostDetail(postId: String)
  /// 创建舞蹈挑战
  case challengeCreate
  /// 挑战详情页
  case challengeDetail(challengeId: UUID)
  /// 上传视频页（参与挑战）
  case uploadVideo(challengeId: UUID)
  /// 钱包页（钻石余额与购买）
  case wallet
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
              case .wallet:
                WalletView()
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
