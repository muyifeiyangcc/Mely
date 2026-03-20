//
//  ProfileView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.presentationMode) var presentationMode
  @Binding var path: [MainRoute]

  // The user ID to display. If nil, it defaults to the current logged-in user.
  var userId: String? = nil

  private var targetUserId: String? {
    userId ?? appDataStore.currentUser?.id
  }

  private var isCurrentUser: Bool {
    guard let current = appDataStore.currentUser?.id, let target = targetUserId else {
      return false
    }
    return current == target
  }

  private var user: UserModel? {
    guard let uid = targetUserId else { return nil }
    return appDataStore.data.adUr9Mz3Qc.first(where: { $0.id == uid })
  }

  private var posts: [CommunityPostModel] {
    guard let uid = targetUserId else { return [] }
    return appDataStore.filteredCommunityPosts.filter { $0.pUp4Mx7Cs == uid }
  }

  /// 标签预设颜色（与发现页 CommunityPostCard 一致）
  private let tagColors: [Color] = [
    Color(hex: "#CBED40"),
    Color(red: 0.95, green: 0.85, blue: 0.4),
    Color(red: 0.4, green: 0.6, blue: 0.95),
  ]

  @State private var showReportBlockSheet: Bool = false
  @State private var showReportSheet: Bool = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold(alignment: .top) {
      ScrollView {
        VStack(spacing: 0) {
          headerView
          postSectionHeader
          if posts.isEmpty {
            VStack {
              Spacer()
              EmptyZhanweiView()
              Spacer()
            }
            .frame(width: .infinity, height: 300)
          } else {
            postListView
          }
        }
      }
      .ignoresSafeArea(edges: .top)

      // Custom Navigation Bar
      HStack {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          Image(systemName: "chevron.left")
            .font(.system(size: 18))
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Circle().fill(Color.white))
        }

        Spacer()

        if isCurrentUser {
          Button(action: {
            path.append(.settings)
          }) {
            Image(systemName: "gearshape")
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(Circle().fill(Color.white))
          }
        } else {
          Button(action: {
            showReportBlockSheet = true
          }) {
            Image(systemName: "ellipsis")
              .font(.system(size: 20, weight: .bold))
              .foregroundColor(.black)
              .padding(18)
              .background(Circle().fill(Color.white))
          }
        }
      }
      .padding(.horizontal, 20)
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $showReportBlockSheet,
      isrepppE4EmwOSEs9Cl: $showReportSheet,
      onOXhiQzKCNvCvG4Block: {
        if let uid = targetUserId {
          appDataStore.blockUser(uid: uid)
          path.removeAll()
        }
        showReportBlockSheet = false
      },
      onReportSubmit: { _, _ in /* 举报用户 */ }
    )
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - Header View
  private var headerView: some View {
    ZStack(alignment: .bottom) {
      SmartImageView.namedOrPath(
        user?.uQd8Nv5tK ?? "mely_defava", placeholder: Image("mely_defava")
      )
      .frame(maxWidth: .infinity)
      .frame(height: 300)
      .clipped()
      .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
      .ignoresSafeArea()

      // Background Gradient
      LinearGradient(
        gradient: Gradient(colors: [Color.clear, Color(hex: "#FF1AB6")]),
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(height: 300)
      .cornerRadius(40, corners: [.bottomLeft, .bottomRight])

      VStack(spacing: 16) {
        HStack(spacing: 16) {
          // Avatar
          ZStack {
            Circle()
              .stroke(Color.white.opacity(0.5), lineWidth: 2)
              .frame(width: 94, height: 94)

            UserAvatarView(avatarSymbol: user?.uQd8Nv5tK ?? "mely_defava", size: 80)
              .overlay(Circle().stroke(Color.white, lineWidth: 2))
          }

          // Name
          HStack(spacing: 20) {
            Text(user?.uZp7Lm2cR ?? "User")
              .font(.custom("Hanchansans-Medium", size: 24))
              .foregroundColor(.white)

            if !isCurrentUser {
              Button {
                guard let otherId = targetUserId,
                  let convId = appDataStore.getOrCreateConversation(with: otherId)
                else { return }
                path.append(.chatDetail(conversationId: convId))
              } label: {
                Image(systemName: "envelope.fill")
                  .foregroundColor(.black)
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .background(
                    Rectangle().fill(Color.white).cornerRadius(
                      16, corners: .allCorners))
              }
            }
          }

          Spacer()
        }
        .padding(.horizontal, 20)

        // Stats
        HStack(spacing: 0) {
          HStack(spacing: 20) {
            if isCurrentUser {
              Button {
                path.append(.userList(.followers))
              } label: {
                VStack(spacing: 4) {
                  Text("\(user?.uFm7Xr8Lp.count ?? 0)")
                    .font(.custom("Hanchansans-Medium", size: 18))
                    .foregroundColor(.white)
                  Text("Followers")
                    .font(.custom("Hanchansans-Medium", size: 14))
                    .foregroundColor(.white.opacity(0.7))
                }
              }
              .buttonStyle(.plain)

              Rectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 2, height: 26)

              Button {
                path.append(.userList(.following))
              } label: {
                VStack(spacing: 4) {
                  Text("\(user?.uFn3Te6Qb.count ?? 0)")
                    .font(.custom("Hanchansans-Medium", size: 18))
                    .foregroundColor(.white)
                  Text("Following")
                    .font(.custom("Hanchansans-Medium", size: 14))
                    .foregroundColor(.white.opacity(0.7))
                }
              }
              .buttonStyle(.plain)
            } else {
              VStack(spacing: 4) {
                Text("\(user?.uFm7Xr8Lp.count ?? 0)")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.white)
                Text("Followers")
                  .font(.custom("Hanchansans-Medium", size: 14))
                  .foregroundColor(.white.opacity(0.7))
              }

              Rectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 2, height: 26)

              VStack(spacing: 4) {
                Text("\(user?.uFn3Te6Qb.count ?? 0)")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.white)
                Text("Following")
                  .font(.custom("Hanchansans-Medium", size: 14))
                  .foregroundColor(.white.opacity(0.7))
              }
            }
          }

          Spacer()

          // Action Button
          if isCurrentUser {
            Button(action: { path.append(.wallet) }) {
              HStack {
                Image("mkirgxytewig_diamond")
                  .resizable()
                  .frame(width: 24, height: 24)
                  .foregroundColor(.blue)
                Text("\(user?.uDg2Jy5Wx ?? 0)")
                  .font(.custom("Hanchansans-Medium", size: 18))
                  .foregroundColor(.black)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 11)
              .background(Color(hex: "#CBED40"))
              .cornerRadius(20)
            }
          } else {
            let isFollowingTarget = (targetUserId.map { appDataStore.isFollowing($0) } ?? false)
            Button(action: {
              guard let uid = targetUserId else { return }
              if isFollowingTarget {
                appDataStore.unfollowUser(uid: uid)
              } else {
                appDataStore.followUser(uid: uid)
              }
            }) {
              Text(isFollowingTarget ? "Following" : "Follow")
                .font(.custom("Hanchansans-Medium", size: 17))
                .foregroundColor(.black)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(Color(hex: "#CBED40"))
                .cornerRadius(12)
            }
          }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
      }
      // .padding(.top, 40)
    }
  }

  // MARK: - Post Section Header
  private var postSectionHeader: some View {
    HStack {
      Text("Post")
        .font(.custom("Hanchansans-Medium", size: 24))
        .foregroundColor(.white)

      Image("eaynmjbwgatf_star")
        .resizable()
        .frame(width: 24, height: 24)
      Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.top, 20)
    .padding(.bottom, 20)
  }

  // MARK: - Post List View

  private var postListView: some View {
    LazyVStack(spacing: 20) {
      ForEach(posts) { post in
        NavigationLink(value: MainRoute.communityPostDetail(postId: post.id)) {
          CommunityPostCard(
            path: $path,
            post: post,
            user: appDataStore.data.adUr9Mz3Qc.first(where: { $0.id == post.pUp4Mx7Cs }),
            tagColors: tagColors
          )
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 100)  // Bottom padding for tab bar
  }
}

// Helper for rounded corners
extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}

// Helper for Hex Color
extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a: UInt64
    let r: UInt64
    let g: UInt64
    let b: UInt64
    switch hex.count {
    case 3:  // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:  // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:  // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue: Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
