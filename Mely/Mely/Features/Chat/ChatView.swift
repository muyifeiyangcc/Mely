//
//  ChatView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

struct ChatView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var inputText: String = ""

  var body: some View {
    VStack(spacing: 0) {
      List {
        if let conversation = appDataStore.data.conversations.first {
          let messages = appDataStore.data.messages.filter { $0.conversationId == conversation.id }

          Section(conversation.title) {
            ForEach(messages) { message in
              HStack {
                let isMe = message.userId == appDataStore.data.currentUserId

                if isMe {
                  Spacer()
                  bubble(text: message.text, isMe: true)
                } else {
                  bubble(text: message.text, isMe: false)
                  Spacer()
                }
              }
              .listRowSeparator(.hidden)
            }
          }
        }
      }
      .listStyle(.plain)

      Divider()

      HStack(spacing: 8) {
        TextField("说点什么…", text: $inputText, axis: .vertical)
          .textFieldStyle(.roundedBorder)

        Button {
          send()
        } label: {
          Image(systemName: "paperplane.fill")
            .foregroundColor(.white)
            .padding(10)
            .background(
              Circle().fill(inputText.isEmpty ? Color.gray : Color.accentColor)
            )
        }
        .disabled(inputText.isEmpty)
      }
      .padding(.horizontal)
      .padding(.vertical, 8)
      .background(.regularMaterial)
    }
    .navigationTitle("聊天")
    #if DEBUG
    .enableInjection()
    #endif
  }

  private func bubble(text: String, isMe: Bool) -> some View {
    Text(text)
      .padding(10)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(isMe ? Color.accentColor.opacity(0.85) : Color(.systemGray6))
      )
      .foregroundColor(isMe ? .white : .primary)
      .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: isMe ? .trailing : .leading)
  }

  private func send() {
    let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return }
    if let conversation = appDataStore.data.conversations.first {
      appDataStore.addMessage(text: trimmed, to: conversation.id)
    }
    inputText = ""
  }
}

