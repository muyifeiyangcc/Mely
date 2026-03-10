//
//  AIGuideView.swift
//  Mely
//
//  健身舞蹈 AI 引导页：展示介绍与「消耗300钻石开始聊天」按钮，点击后跳转 AI 提问页
//

import SwiftUI

struct AIGuideView: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let aiGreen = Color(hex: "#CBED40")
  private let aiPink = Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255)
  private let darkGradient = LinearGradient(
    colors: [
      Color(red: 0.15, green: 0.18, blue: 0.35),
      Color(red: 0.08, green: 0.10, blue: 0.20),
    ],
    startPoint: .top,
    endPoint: .bottom
  )

  var body: some View {
    ZStack(alignment: .top) {
      Image("nmhenaqqihcs")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // 标题 Fitness Dance / Q&A AI + 声波
        titleSection
        Spacer(minLength: 20)
        // 中部：介绍文案 + 星星
        introSection
        Spacer(minLength: 24)
        // 底部：消耗300钻石按钮
        chatButton
      }
      .padding(.bottom, 34)

      // 顶部导航：返回
      topBar
    }
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var topBar: some View {
    HStack(alignment: .top, spacing: 0) {
      Button {
        dismiss.callAsFunction()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()
    }
    .padding(.horizontal, 20)
  }

  private var titleSection: some View {
    ZStack(alignment: .top) {
      // 标题
      HStack(alignment: .center, spacing: 0) {
        VStack(alignment: .leading, spacing: 4) {
          Text("Fitness Dance")
            .font(.custom("Hanchansans-Medium", size: 30))
            .foregroundColor(.black)
            .tracking(-0.6)
          Text("Q&A AI")
            .font(.custom("Hanchansans-Medium", size: 30))
            .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
            .shadow(color: Color.white.opacity(0.28), radius: 4, x: 0, y: 2)
        }
        .padding(.top, 15)

        Spacer()

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
      .padding(.top, 90)

      // AI 头像
      HStack(alignment: .top) {
        Spacer()

        Image("hitubiaoyun")
          .resizable()
          .scaledToFit()
          .frame(width: 65, height: 65)

        Image("dayanjiqiren")
          .resizable()
          .scaledToFit()
          .frame(width: 120, height: 120)
          .clipShape(Circle())
      }
      .padding(.trailing, 20)
      .padding(.top, 10)
    }
  }

  private var introSection: some View {
    VStack(spacing: 18) {
      HStack(spacing: 0) {
        Spacer()

        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)
      }

      Text(
        "I can give you dance tips, help you develop a fitness dance plan, or chat with you about interesting things in dance. Whether you are a beginner or an expert, I am here to accompany you to improve and inspire you to challenge yourself. Tell me what you need and let's dance together! 🎶💪"
      )
      .font(.system(size: 17, weight: .medium))
      .foregroundColor(.white)
      .multilineTextAlignment(.leading)
      .lineSpacing(22)

      HStack(spacing: 0) {
        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)

        Spacer()
      }
      .padding(.top, 6)
    }
    .padding(.horizontal, 24)
  }

  private var chatButton: some View {
    Button {
      startAIChat()
    } label: {
      HStack(spacing: 8) {
        Image("mkirgxytewig_diamond")
          .resizable()
          .scaledToFit()
          .frame(width: 28, height: 28)
        Text("-300")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
        Text("Chat")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
          .padding(.leading, 6)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        Capsule()
          .fill(aiGreen)
      )
    }
    .buttonStyle(.plain)
    .frame(width: 260, height: 50)
    // .padding(.horizontal, 24)
    // .disabled((appDataStore.currentUser?.diamonds ?? 0) < 300)
    // .opacity((appDataStore.currentUser?.diamonds ?? 0) >= 300 ? 1 : 0.6)
  }

  private func startAIChat() {
    guard appDataStore.deductDiamonds(300) else { return }
    path.append(.aiChat)
  }
}
