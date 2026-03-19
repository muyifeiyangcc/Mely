//
//  AIChatView.swift
//  Mely
//
//  健身舞蹈 AI 提问页：推荐问题卡片、欢迎语气泡、输入框，支持发送消息与 AI 对话（模拟回复）
//

import SwiftUI

// MARK: - AI 聊天消息模型

private struct AIChatMessage: Identifiable, Equatable {
  let id: String
  let text: String
  let isFromUser: Bool
  let createdAt: Date

  static func user(_ text: String) -> AIChatMessage {
    AIChatMessage(id: UUID().uuidString, text: text, isFromUser: true, createdAt: Date())
  }

  static func ai(_ text: String) -> AIChatMessage {
    AIChatMessage(id: UUID().uuidString, text: text, isFromUser: false, createdAt: Date())
  }
}

// MARK: - 推荐问题（可换一批）

private let suggestedQuestions: [[String]] = [
  [
    "What should I warm up before dancing?",
    "How can I improve my fitness dance?",
    "Can you suggest a routine for beginners?",
  ],
  [
    "What are the best stretches for dancers?",
    "How often should I practice fitness dance?",
    "Tips for avoiding injury while dancing?",
  ],
  [
    "How to build stamina for long dance sessions?",
    "What music is good for fitness dance?",
    "How to cool down after a dance workout?",
  ],
]

private let welcomeText =
  "Let's start our conversation now~ Please feel free to ask questions, and I will do my best to meet your needs."

private func randomAIReply(for userText: String) -> String {
  let replies = [
    "Great question! For fitness dance, I recommend starting with 5–10 minutes of light cardio and dynamic stretches to get your body ready. Focus on your legs, hips, and arms. 🎶",
    "I'd be happy to help! Consistency is key—try to practice at least 3 times a week. Start with beginner routines and gradually increase intensity. You've got this! 💪",
    "Sure! A simple beginner routine could be: warm-up (5 min), basic steps (10 min), combination (10 min), cool-down (5 min). Adjust based on how you feel.",
    "That's a wonderful goal! Remember to listen to your body, stay hydrated, and have fun. Dance is not just exercise—it's expression! 🌟",
    "I'm here to support your fitness dance journey. Keep asking and we can build a plan that works for you. Let's dance together!",
  ]
  return replies.randomElement() ?? replies[0]
}

struct AIChatView: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var draftText: String = ""
  @State private var messages: [AIChatMessage] = []
  @State private var suggestedIndex: Int = 0
  @State private var isAIReplying: Bool = false
  @State private var keyboardHeight: CGFloat = 0

  private let aiPink = Color(hex: "#FF1AB6")
  private let aiGreen = Color(hex: "#CBED40")

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        topBar

        ScrollViewReader { proxy in
          ScrollView {
            VStack(alignment: .leading, spacing: 0) {
              // 白色卡片：You can ask me... + 推荐问题
              suggestionCard
              // 欢迎语气泡
              welcomeBubble
                .padding(.top, 20)
                .padding(.bottom, 16)
              // 对话消息列表
              ForEach(messages) { msg in
                chatBubble(msg)
                  .id(msg.id)
                  .padding(.bottom, 16)
              }
              if isAIReplying {
                TypingIndicatorView()
                  .id("typing")
                  .padding(.bottom, 16)
              }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
          }
          .onChange(of: messages.count) { _, _ in
            scrollToBottom(proxy: proxy)
          }
          .onChange(of: isAIReplying) { _, v in
            if v { scrollToBottom(proxy: proxy) }
          }
        }

        inputBar
      }
    }
    // .ignoresSafeArea(edges: .bottom)
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification))
    { notification in
      guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
      else { return }
      withAnimation(.easeOut(duration: 0.25)) { keyboardHeight = frame.height }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
    { _ in
      withAnimation(.easeOut(duration: 0.25)) { keyboardHeight = 0 }
    }
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var topBar: some View {
    HStack(alignment: .bottom) {
      Button {
        dismiss.callAsFunction()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }
      Spacer()
      HStack(spacing: 6) {
        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)
      }
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 8)
  }

  private var suggestionCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("You can ask me something like:")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(aiPink)

      ZStack(alignment: .top) {
        HStack {
          Image("dayanjiqiren")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(Circle())

          Spacer()

          // // swap button
          // Button {
          //   withAnimation(.easeInOut(duration: 0.2)) {
          //     suggestedIndex = (suggestedIndex + 1) % suggestedQuestions.count
          //   }
          // } label: {
          //   HStack(spacing: 4) {
          //     Image(systemName: "arrow.clockwise")
          //       .font(.system(size: 14, weight: .semibold))
          //     Text("Swap it out")
          //       .font(.system(size: 14))
          //   }
          //   .foregroundColor(.black)
          //   .padding(.horizontal, 12)
          //   .padding(.vertical, 10)
          //   .background(
          //     Capsule()
          //       .fill(aiGreen)
          //   )
          // }
        }
        .padding(.leading, 31)
        .padding(.trailing, 10)

        VStack(alignment: .leading, spacing: 18) {
          ForEach(Array(currentSuggestions.enumerated()), id: \.offset) { _, q in
            Button {
              sendText(q)
            } label: {
              Text(q)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
                .background(
                  RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(hex: "#FFF7F7").opacity(0.13))
                )
            }
            .buttonStyle(.plain)
          }
        }
        .padding(.horizontal, 10)
        .padding(.top, 30)
        .padding(.bottom, 20)
        .background(
          Image("quejiaodejuxing")
            .resizable()
            // .scaledToFill()
            // .frame(width: .infinity, height: 230)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        )
        .padding(.top, 70)
      }
    }
    .padding(.horizontal, 16)
    .padding(.top, 16)
    .padding(.bottom, 20)
    // .frame(height: 380)
    .background(
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.white)
    )
  }

  private var currentSuggestions: [String] {
    let list = suggestedQuestions[suggestedIndex]
    return Array(list.prefix(3))
  }

  private var welcomeBubble: some View {
    HStack(alignment: .top, spacing: 0) {
      Text(welcomeText)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          Color(aiPink)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: 0,
            bottomTrailingRadius: 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )
        .frame(maxWidth: .infinity, alignment: .leading)

      Spacer(minLength: 60)
    }
  }

  private func chatBubble(_ message: AIChatMessage) -> some View {
    HStack(alignment: .top, spacing: 0) {
      if message.isFromUser { Spacer(minLength: 48) }
      Text(message.text)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(message.isFromUser ? .black : .white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          Color(message.isFromUser ? aiGreen : aiPink)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: message.isFromUser ? 12 : 0,
            bottomTrailingRadius: message.isFromUser ? 0 : 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )
        .frame(
          maxWidth: UIScreen.main.bounds.width * 0.75,
          alignment: message.isFromUser ? .trailing : .leading)
      if !message.isFromUser { Spacer(minLength: 48) }
    }
    .frame(maxWidth: .infinity, alignment: message.isFromUser ? .trailing : .leading)
  }

  private var inputBar: some View {
    HStack(spacing: 12) {
      TextField(
        "",
        text: $draftText,
        prompt: Text("Just ask me...")
          .foregroundColor(.gray)
      )
      .font(.system(size: 16))
      .foregroundColor(.white)
      .tint(.white)
      .padding(.horizontal, 16)
      .padding(.vertical, 15)
      .submitLabel(.done)
      .background(
        Capsule()
          .fill(Color(hex: "#182037"))
      )

      Button {
        sendText(draftText.trimmingCharacters(in: .whitespacesAndNewlines))
        draftText = ""
        UIApplication.shared.sendAction(
          #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      } label: {
        Image(systemName: "paperplane")
          .font(.system(size: 26))
          .foregroundColor(.white)
      }
      .disabled(draftText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
    }
    .padding(.horizontal, 16)
    .padding(.top, 12)
    .padding(.bottom, max(6, keyboardHeight > 0 ? 0 : 0))
    // .padding(.bottom, max(6, keyboardHeight > 0 ? 0 : 24))
    .background(Color.black)
  }

  private func sendText(_ text: String) {
    guard !text.isEmpty else { return }
    let userMsg = AIChatMessage.user(text)
    messages.append(userMsg)
    isAIReplying = true

    Task { @MainActor in
      let result = await AIService.shared.sendChat(message: text)
      let replyText: String
      switch result {
      case .success(let aiText):
        replyText = aiText
      case .failure:
        replyText = randomAIReply(for: text)
      }
      let aiMsg = AIChatMessage.ai(replyText)
      withAnimation(.easeOut(duration: 0.25)) {
        messages.append(aiMsg)
        isAIReplying = false
      }
    }
  }

  private func scrollToBottom(proxy: ScrollViewProxy) {
    withAnimation(.easeOut(duration: 0.2)) {
      if isAIReplying {
        proxy.scrollTo("typing", anchor: .bottom)
      } else if let last = messages.last {
        proxy.scrollTo(last.id, anchor: .bottom)
      }
    }
  }
}

// MARK: - 输入中指示

private struct TypingIndicatorView: View {
  var body: some View {
    TimelineView(.periodic(from: .now, by: 0.4)) { context in
      let sec = context.date.timeIntervalSinceReferenceDate
      let dotCount = Int(sec / 0.4) % 3
      HStack(alignment: .top, spacing: 0) {
        HStack(spacing: 4) {
          ForEach(0..<3, id: \.self) { i in
            Circle()
              .fill(Color.white.opacity(0.9))
              .frame(width: 6, height: 6)
              .opacity(i <= dotCount ? 1 : 0.4)
          }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
        )
        Spacer(minLength: 48)
      }
    }
  }
}
