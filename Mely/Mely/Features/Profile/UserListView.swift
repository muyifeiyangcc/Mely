//
//  UserListView.swift
//  Mely
//
//  Created by yangyang on 2026/3/11.
//

import SwiftUI

/// 用户列表类型：拉黑列表、关注列表、粉丝列表
enum UserListType: Hashable {
  case blocklist
  case following
  case followers

  var title: String {
    switch self {
    case .blocklist: return "Blocklist"
    case .following: return "Following"
    case .followers: return "Followers"
    }
  }
}

struct UserListView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  let listType: UserListType

  private var currentUser: UserModel? {
    appDataStore.currentUser
  }

  /// 当前列表的用户 id 数组（关注/粉丝列表排除已拉黑用户）
  private var userIds: [String] {
    guard let user = currentUser else { return [] }
    let blocked = Set(user.blockUids)
    switch listType {
    case .blocklist: return user.blockUids
    case .following: return user.followingIds.filter { !blocked.contains($0) }
    case .followers: return user.followIds.filter { !blocked.contains($0) }
    }
  }

  private var users: [UserModel] {
    userIds.compactMap { uid in
      appDataStore.data.users.first { $0.id == uid }
    }
  }

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        navigationBar
        if users.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .padding(.bottom, 60)
          .frame(width: .infinity, height: .infinity)
        } else {
          userListView
        }
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - Navigation Bar

  private var navigationBar: some View {
    ZStack {
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

        Text(listType.title)
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.white)

        Spacer()

        Color.clear
          .frame(width: 44, height: 44)
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 16)
    }
  }

  // MARK: - User List

  private var userListView: some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        ForEach(users) { user in
          userRow(user: user)
        }
      }
      .padding(.horizontal, 20)
    }
  }

  private func userRow(user: UserModel) -> some View {
    HStack(spacing: 16) {
      Button {
        path.append(.userProfile(userId: user.id))
      } label: {
        UserAvatarView(avatarSymbol: user.avatarSymbol, size: 52)
          .overlay {
            Circle().stroke(Color.white, lineWidth: 3)
          }
          .clipShape(Circle())
      }
      .buttonStyle(.plain)

      Text(user.name)
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.white)

      Spacer()

      actionButton(for: user)
    }
    .padding(.vertical, 12)
    .cornerRadius(14)
  }

  @ViewBuilder
  private func actionButton(for user: UserModel) -> some View {
    switch listType {
    case .blocklist:
      Button {
        appDataStore.unblockUser(uid: user.id)
      } label: {
        Text("Cancel")
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color(hex: "#CBED40"))
          .clipShape(Capsule())
      }
      .buttonStyle(.plain)

    case .following:
      Button {
        appDataStore.unfollowUser(uid: user.id)
      } label: {
        Image(systemName: "checkmark")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.black)
          .frame(width: 64, height: 30)
          .background(Color(hex: "#CBED40"))
          .clipShape(Capsule())
      }
      .buttonStyle(.plain)

    case .followers:
      let isFollowing = appDataStore.isFollowing(user.id)
      Button {
        if isFollowing {
          appDataStore.unfollowUser(uid: user.id)
        } else {
          appDataStore.followUser(uid: user.id)
        }
      } label: {
        Group {
          if isFollowing {
            Image(systemName: "checkmark")
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(.white)
          } else {
            Image(systemName: "plus")
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.white)
          }
        }
        .frame(width: 44, height: 36)
        .background(Color(hex: "#CBED40"))
        .cornerRadius(12)
      }
      .buttonStyle(.plain)
    }
  }
}
