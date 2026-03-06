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
          HomeView()
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
                CommunityView()
              case .chat:
                ChatView()
              case .profile:
                ProfileView()
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
