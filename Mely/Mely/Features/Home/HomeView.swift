//
//  HomeView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct HomeView: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var searchText: String = ""

  private var challenges: [DanceChallenge] {
    appDataStore.data.challenges
  }

  private let topGradient = LinearGradient(
    colors: [Color(red: 0.4, green: 0.85, blue: 0.55), Color(red: 0.25, green: 0.35, blue: 0.6)],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    ZStack {
      // 深色背景
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading, spacing: 0) {
          // 顶部信息栏 + 搜索
          topBarAndSearch

          // 中间 AI 面板
          aiPanel
            .padding(.vertical, 20)

          // 舞蹈挑战列表
          challengeSection
        }
        .padding(.bottom, 100)
      }
    }
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - 顶部信息栏与搜索

  private var topBarAndSearch: some View {
    VStack(alignment: .leading, spacing: 12) {
      // 状态栏下方：Logo + 右侧加号按钮
      HStack {
        Image("Melycaised")
          .resizable()
          .scaledToFit()
          .frame(height: 38)

        Spacer()

        Button {
          path.append(.challengeCreate)
        } label: {
          Image("xieqingadd")
            .resizable()
            .frame(width: 44, height: 44)
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, 8)

      // 搜索栏
      HStack(spacing: 10) {
        Image(systemName: "magnifyingglass")
          .font(.system(size: 20).bold())
          .foregroundColor(.white)
        TextField(
          "", text: $searchText, prompt: Text("Search").foregroundColor(.white.opacity(0.6))
        )
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)
        .submitLabel(.search)

        // 有输入内容的时候显示一个清空按钮
        if !searchText.isEmpty {
          Button {
            searchText = ""
            // 收起键盘
            UIApplication.shared.sendAction(
              #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
          } label: {
            Image(systemName: "xmark.circle.fill")
              .font(.system(size: 20).bold())
              .foregroundColor(.white.opacity(0.7))
          }
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(
        Capsule()
          .fill(Color.white.opacity(0.20))
      )
      .padding(.horizontal, 20)
      .padding(.top, 12)
    }
  }

  // MARK: - 中间 AI 面板
  private var aiPanel: some View {
    HStack(alignment: .center, spacing: 0) {
      VStack(alignment: .leading, spacing: 4) {
        Text("Fitness Dance")
          .font(.custom("Hanchansans-Medium", size: 30))
          .foregroundColor(.white)
          .tracking(-0.6)
        Text("Q&A AI")
          .font(.custom("Hanchansans-Medium", size: 30))
          .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
          .shadow(color: Color.white.opacity(0.28), radius: 4, x: 0, y: 2)
      }
      .padding(.top, 13)

      Spacer()

      // AI 头像
      Button {
        path.append(.aiGuide)
      } label: {
        ZStack(alignment: .center) {
          HStack(spacing: 26) {
            Text("Go")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.black)

            // 右箭头图标
            Image(systemName: "arrow.right")
              .font(.subheadline.weight(.semibold))
              .foregroundColor(.black)
          }
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(
            Capsule()
              .fill(Color.white)
          )
          .padding(.top, 80)

          Image("dayanjiqiren")
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
        }
      }
    }
    .background(
      Image("wangshange")
        .resizable()
        .scaledToFill()
        .padding(.horizontal, 18)
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .padding(.top, 26)
    )
    .padding(.horizontal, 20)
  }

  // MARK: - 舞蹈挑战区

  private var challengeSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 8) {
        Text("Fitness Dance Challenge")
          .font(.custom("Hanchansans-Medium", size: 26))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .scaledToFit()
          .frame(width: 26, height: 26)
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(challenges) { challenge in
            DanceChallengeCard(challenge: challenge) {
              path.append(.challengeDetail(challengeId: challenge.id))
            }
          }
        }
        .padding(.horizontal, 20)
      }
    }
    .padding(.vertical, 12)
  }

}

// MARK: - 舞蹈挑战卡片
struct DanceChallengeCard: View {
  let challenge: DanceChallenge
  let onJoin: () -> Void

  var body: some View {
    ZStack(alignment: .center) {
      // Image(challenge.imageName!)
      //   .resizable()
      //   .scaledToFill()
      //   .cornerRadius(20)
      //   .frame(width: 200, height: 280)

      VStack {
        HStack {
          Text(challenge.title)
            .font(.custom("Hanchansans-Medium", size: 18))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
          Spacer()
        }

        Spacer()

        Button(action: onJoin) {
          Text("Join the challenge")
            .font(.custom("Hanchansans-Medium", size: 17))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(
              Capsule()
                .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
            )
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 12)

      }
      // .frame(width: 200, height: 280)
      .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

    }
    .contentShape(Rectangle())
    .onTapGesture {
      onJoin()
    }
    .buttonStyle(.plain)
    .frame(width: 220, height: 310)
    .background(
      challengeCoverBackground
        .frame(width: 220, height: 310)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    )
    .padding(.top, 16)

  }

  /// 封面背景：SmartImageView 内部兼容 Asset 与持久化文件路径
  @ViewBuilder
  private var challengeCoverBackground: some View {
    if let name = challenge.imageName {
      SmartImageView(resource: .namedOrPath(name), contentMode: .fill)
    } else {
      placeholderGradient
    }
  }

  private var placeholderGradient: some View {
    LinearGradient(
      colors: [
        Color(red: 0.4, green: 0.35, blue: 0.6),
        Color(red: 0.25, green: 0.2, blue: 0.45),
      ],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
    .overlay {
      Image(systemName: "figure.dance")
        .font(.system(size: 44))
        .foregroundColor(.white.opacity(0.6))
    }
  }
}

#Preview {
  NavigationStack {
    HomeView(path: .constant([]))
      .environmentObject(AppDataStore())
  }
}
