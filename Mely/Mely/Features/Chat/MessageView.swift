//
//  MessageView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct MessageView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 12) {
        HStack {
          Button {
            dismiss.callAsFunction()
          } label: {
            Image(systemName: "chevron.left")
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(.white)
              .clipShape(Circle())
          }
          Spacer()
          Text("Message")
            .font(.custom("Hanchansans-Medium", size: 22))
            .foregroundColor(.white)
          Spacer()
          Color.clear
            .frame(width: 44, height: 44)
        }
        .padding(.horizontal, 20)

        if appDataStore.filteredConversations.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .padding(.bottom, 60)
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView {
            LazyVStack(spacing: 20) {
              ForEach(appDataStore.filteredConversations) { conversation in
                NavigationLink {
                  ChatDetailView(path: $path, conversationId: conversation.id)
                } label: {
                  ChatListRowView(
                    title: chatTitle(for: conversation),
                    preview: chatPreview(for: conversation),
                    timeText: chatTimeText(for: conversation),
                    unreadCount: chatUnreadCount(for: conversation),
                    avatarSymbol: chatAvatarSymbol(for: conversation)
                  )
                }
                .buttonStyle(.plain)
              }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 24)
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func chatTitle(for conversation: ConversationModel) -> String {
    guard let currentId = appDataStore.data.currentUserId else { return "Chat" }
    let otherId = conversation.participantUserIds.first { $0 != currentId }
    guard let id = otherId,
      let user = appDataStore.data.users.first(where: { $0.id == id })
    else {
      return "Chat"
    }
    return user.name
  }

  private func chatAvatarSymbol(for conversation: ConversationModel) -> String {
    guard let currentId = appDataStore.data.currentUserId else { return "person.crop.circle.fill" }
    let otherId = conversation.participantUserIds.first { $0 != currentId }
    guard let id = otherId,
      let user = appDataStore.data.users.first(where: { $0.id == id })
    else {
      return "mely_defava"
    }
    return user.avatarSymbol
  }

  private func chatPreview(for conversation: ConversationModel) -> String {
    guard let last = lastMessage(for: conversation) else {
      return ""
    }
    return previewText(for: last)
  }

  private func chatTimeText(for conversation: ConversationModel) -> String {
    let last = lastMessage(for: conversation)
    guard let date = last?.createdAt else { return "Yesterday" }
    let cal = Calendar.current
    if cal.isDateInYesterday(date) { return "Yesterday" }
    if cal.isDateInToday(date) { return "Today" }
    let f = DateFormatter()
    f.dateFormat = "MM/dd"
    return f.string(from: date)
  }

  private func chatUnreadCount(for conversation: ConversationModel) -> Int {
    guard let currentId = appDataStore.data.currentUserId else { return 0 }
    return conversation.unreadCountByUserId[currentId] ?? 0
  }

  private func lastMessage(for conversation: ConversationModel) -> MessageModel? {
    appDataStore.data.messages
      .filter { $0.conversationId == conversation.id }
      .sorted(by: { $0.createdAt < $1.createdAt })
      .last
  }

  // MARK: - Message Preview
  private func previewText(for message: MessageModel) -> String {
    switch message.type {
    case .emoji:
      return "[Emoji]"
    case .voice:
      return "[Voice]"
    case .image:
      return "[Image]"
    case .text:
      // // 兼容旧数据：type 还是 .text 但 text 是 emoji 资源名
      // if emojiOptions.contains(message.text) {
      //   return "【emoji】"
      // }

      let trimmed = message.text.trimmingCharacters(in: .whitespacesAndNewlines)
      return trimmed.isEmpty ? "" : trimmed
    }
  }
}

// MARK: - UI Pieces
struct ChatListRowView: View {
  let title: String
  let preview: String
  let timeText: String
  let unreadCount: Int
  let avatarSymbol: String

  var body: some View {
    HStack(spacing: 12) {
      avatar

      VStack(alignment: .leading, spacing: 6) {
        Text(title)
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)

        Text(preview)
          .font(.system(size: 13, weight: .regular))
          .foregroundColor(.gray)
          .lineLimit(1)
      }

      Spacer(minLength: 10)

      VStack(alignment: .trailing, spacing: 10) {
        Text(timeText)
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.gray)

        if unreadCount > 0 {
          Text("\(unreadCount)")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 22, height: 22)
            .background(.black)
            .clipShape(Circle())
        }
      }
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 14)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
  }

  private var avatar: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [.pink.opacity(0.5), .purple.opacity(0.5)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .frame(width: 46, height: 46)

      UserAvatarView(avatarSymbol: avatarSymbol, size: 46)
    }
  }
}

struct ChatBackgroundView: View {
  var body: some View {
    ZStack(alignment: .bottom) {
      LinearGradient(
        colors: [
          Color(red: 0.26, green: 0.52, blue: 0.34).opacity(0.95),
          Color(red: 0.10, green: 0.20, blue: 0.35).opacity(0.98),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )

      GridFloorView()
        .frame(height: 260)
        .opacity(0.55)
    }
  }
}

struct GridFloorView: View {
  var body: some View {
    GeometryReader { geo in
      let w = geo.size.width
      let h = geo.size.height

      Canvas { ctx, _ in
        var path = Path()

        let stepX: CGFloat = 26
        let stepY: CGFloat = 18

        var x: CGFloat = 0
        while x <= w {
          path.move(to: CGPoint(x: x, y: 0))
          path.addLine(to: CGPoint(x: x, y: h))
          x += stepX
        }

        var y: CGFloat = 0
        while y <= h {
          path.move(to: CGPoint(x: 0, y: y))
          path.addLine(to: CGPoint(x: w, y: y))
          y += stepY
        }

        ctx.stroke(path, with: .color(.white.opacity(0.22)), lineWidth: 1)
      }
      .background(
        LinearGradient(
          colors: [.clear, .black.opacity(0.35)],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .mask(
        LinearGradient(
          colors: [.clear, .white, .white],
          startPoint: .top,
          endPoint: .bottom
        )
      )
    }
  }
}
