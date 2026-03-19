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
  case userProfile(userId: String)
  case settings
  case editProfile
  case communityPostCreate
  case communityPostDetail(postId: String)
  case challengeCreate
  case challengeDetail(challengeId: String)
  case uploadVideo(challengeId: String)
  case videoDetail(videoId: String)
  case wallet
  case aiGuide
  case aiChat
  case userList(UserListType)
  case chatDetail(conversationId: String)
  case webProtocol(urlString: String, title: String)
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
            .overlay(alignment: .bottom) {
              if path.isEmpty && appDataStore.showBlockSuccessToast {
                Text("Blocked successfully")
                  .font(.custom("Hanchansans-Medium", size: 15))
                  .foregroundColor(.black)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 12)
                  .background(Capsule().fill(Color(hex: "#CBED40")))
                  .padding(.bottom, 20)
                  .transition(.opacity.combined(with: .move(edge: .top)))
              }
            }
            .animation(.easeInOut(duration: 0.25), value: appDataStore.showBlockSuccessToast)
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
                MessageView(path: $path)
              case .profile:
                ProfileView(path: $path)
              case .userProfile(let userId):
                ProfileView(path: $path, userId: userId)
              case .settings:
                SettingsView(path: $path)
              case .editProfile:
                EditProfileView(path: $path)
              case .communityPostCreate:
                CommunityPostCreateView(path: $path)
              case .communityPostDetail(let postId):
                CommunityPostDetailView(path: $path, postId: postId)
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
              case .userList(let listType):
                UserListView(path: $path, listType: listType)
              case .chatDetail(let conversationId):
                ChatDetailView(path: $path, conversationId: conversationId)
              case .webProtocol(let urlString, let title):
                WebProtocolView(urlString: urlString, title: title, path: $path)
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
