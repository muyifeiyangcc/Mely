//
//  ChatDetailView.swift
//  Mely
//
//  Created by AI on 2026/3/6.
//

import AVFoundation
import Combine
import SwiftUI

struct ChatDetailView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  let conversationId: String

  @State private var draftText: String = ""
  @State private var isVoiceExpanded: Bool = false
  @State private var isEmojiExpanded: Bool = false
  @State private var seedItems: [ChatItem] = []
  @State private var localItems: [ChatItem] = []
  @State private var isPhotoSourceDialogPresented: Bool = false
  @State private var isImagePickerPresented: Bool = false
  @State private var imagePickerSource: ImagePickerView.Source = .photoLibrary
  @State private var permissionDeniedMessage: String?
  @State private var isPermissionAlertPresented: Bool = false
  @State private var isVoiceRecording: Bool = false
  @State private var keyboardHeight: CGFloat = 0

  var body: some View {
    GeometryReader { geo in
      ZStack {
        Image("zhuyaoyebg")
          .resizable()
          .ignoresSafeArea()

        VStack(spacing: 0) {
          ChatTopBarView(
            title: conversationTitle,
            showsBackButton: true,
            onBack: { dismiss() },
            trailing: {
              Button {
                // 占位：更多
              } label: {
                Image(systemName: "ellipsis")
                  .font(.system(size: 18, weight: .semibold))
                  .foregroundColor(.white)
                  .frame(width: 44, height: 44)
                  .background(.white.opacity(0.15))
                  .clipShape(Circle())
              }
            }
          )

          ScrollViewReader { proxy in
            ScrollView {
              LazyVStack(spacing: 0) {
                ForEach(displayItems) { item in
                  ChatBubbleRowView(
                    item: item,
                    meAvatar: meAvatarSymbol,
                    otherAvatar: otherAvatarSymbol
                  )
                  .id(item.id)
                  .padding(.bottom, 16)
                }
              }
              .padding(.horizontal, 16)
              .padding(.top, 18)
              .padding(.bottom, 16)
            }
            .onChange(of: displayCount) { _, _ in
              scrollToBottom(proxy: proxy)
            }
            .onAppear {
              // seedIfNeeded()
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                scrollToBottom(proxy: proxy)
              }
            }
          }

          ChatComposerView(
            text: $draftText,
            isVoiceExpanded: $isVoiceExpanded,
            isEmojiExpanded: $isEmojiExpanded,
            onTapPhoto: { isPhotoSourceDialogPresented = true },
            onTapSend: { sendText() },
            onTapEmoji: { emoji in
              sendEmoji(emoji)
            },
            onVoiceRecorded: { path, duration in
              sendVoiceMessage(audioPath: path, duration: duration)
            },
            onVoiceRecordingStateChanged: { isVoiceRecording = $0 },
            onVoicePermissionDenied: { msg in
              permissionDeniedMessage = msg
              isPermissionAlertPresented = true
            }
          )

        }
        .frame(height: max(0, geo.size.height - keyboardHeight))
        .frame(maxHeight: .infinity, alignment: .top)
      }
    }
    .ignoresSafeArea(edges: .bottom)
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification))
    { notification in
      guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
      else { return }
      withAnimation(.easeOut(duration: 0.25)) {
        keyboardHeight = frame.height
      }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
    { _ in
      withAnimation(.easeOut(duration: 0.25)) {
        keyboardHeight = 0
      }
    }
    .toolbar(.hidden, for: .navigationBar)
    .confirmationDialog(
      "Select image source",
      isPresented: $isPhotoSourceDialogPresented,
      titleVisibility: .visible
    ) {
      Button("Gallery") {
        imagePickerSource = .photoLibrary
        requestPhotoLibraryPermissionAndPresentPicker()
      }
      Button("Camera") {
        imagePickerSource = .camera
        requestCameraPermissionAndPresentPicker()
      }
      Button("Cancel", role: .cancel) {}
    }
    .alert("Permission Required", isPresented: $isPermissionAlertPresented) {
      Button("Go to Settings") {
        if let url = URL(string: UIApplication.openSettingsURLString) {
          UIApplication.shared.open(url)
        }
      }
      Button("Cancel", role: .cancel) {}
    } message: {
      if let msg = permissionDeniedMessage {
        Text(msg)
      }
    }
    .sheet(isPresented: $isImagePickerPresented) {
      ImagePickerView(source: imagePickerSource) { image in
        handlePickedImage(image)
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var conversationTitle: String {
    guard
      let conversation = appDataStore.data.conversations.first(where: { $0.id == conversationId }),
      let currentId = appDataStore.data.currentUserId
    else { return "Chat" }
    let otherId = conversation.participantUserIds.first { $0 != currentId }
    guard let id = otherId,
      let user = appDataStore.data.users.first(where: { $0.id == id })
    else {
      return "Chat"
    }
    return user.name
  }

  private var meAvatarSymbol: String {
    appDataStore.currentUser?.avatarSymbol ?? "person.crop.circle.fill"
  }

  private var otherAvatarSymbol: String {
    guard
      let conversation = appDataStore.data.conversations.first(where: { $0.id == conversationId }),
      let currentId = appDataStore.data.currentUserId
    else { return "person.crop.circle.fill" }
    let otherId = conversation.participantUserIds.first { $0 != currentId }
    guard let id = otherId,
      let user = appDataStore.data.users.first(where: { $0.id == id })
    else {
      return "person.crop.circle.fill"
    }
    return user.avatarSymbol
  }

  private var persistedItems: [ChatItem] {
    let items: [ChatItem] =
      appDataStore.data.messages
      .filter { $0.conversationId == conversationId }
      .sorted(by: { $0.createdAt < $1.createdAt })
      .map { msg -> ChatItem in
        let content: ChatItem.Content

        switch msg.type {
        case .emoji:
          content = .emojiImage(name: msg.text)
        case .voice:
          let seconds = msg.audioDurationSeconds ?? 0
          let path = msg.audioPath ?? ""
          content = .audio(seconds: seconds, path: path)
        case .image:
          // 从持久化的 imagePath 取路径，再次进入聊天时据此显示图片
          content = .image(path: msg.imagePath ?? msg.text)
        case .text:
          if emojiOptions.contains(msg.text) {
            content = .emojiImage(name: msg.text)
          } else {
            content = .text(msg.text)
          }
        }

        return ChatItem(
          id: msg.id,
          isMe: msg.userId == appDataStore.data.currentUserId,
          content: content,
          timeText: timeText(from: msg.createdAt)
        )
      }
    return items
  }

  private var displayItems: [ChatItem] {
    seedItems + persistedItems + localItems
  }

  private var displayCount: Int {
    displayItems.count
  }

  private func timeText(from date: Date) -> String {
    let f = DateFormatter()
    f.dateFormat = "h:mm a"
    return f.string(from: date)
  }

  private func scrollToBottom(proxy: ScrollViewProxy) {
    guard let lastId = displayItems.last?.id else { return }
    withAnimation(.easeOut(duration: 0.25)) {
      proxy.scrollTo(lastId, anchor: .bottom)
    }
  }

  private func requestPhotoLibraryPermissionAndPresentPicker() {
    ImagePickerView.requestPhotoLibraryAccess { granted, message in
      if granted {
        isImagePickerPresented = true
      } else if let message = message {
        permissionDeniedMessage = message
        isPermissionAlertPresented = true
      }
    }
  }

  private func requestCameraPermissionAndPresentPicker() {
    ImagePickerView.requestCameraAccess { granted, message in
      if granted {
        isImagePickerPresented = true
      } else if let message = message {
        permissionDeniedMessage = message
        isPermissionAlertPresented = true
      }
    }
  }

  private func sendText() {
    let trimmed = draftText.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return }
    appDataStore.addMessage(text: trimmed, type: .text, to: conversationId)
    draftText = ""
  }

  private func sendEmoji(_ emoji: String) {
    appDataStore.addMessage(text: emoji, type: .emoji, to: conversationId)
  }

  private func sendVoiceMessage(audioPath: String, duration: Int) {
    appDataStore.addMessage(
      text: "",
      type: .voice,
      audioPath: audioPath,
      audioDurationSeconds: duration,
      to: conversationId
    )
  }

  private func handlePickedImage(_ image: UIImage) {
    guard let path = saveImageToPersistentStorage(image) else { return }
    appDataStore.addMessage(text: "", type: .image, imagePath: path, to: conversationId)
  }

  /// 将图片保存到 Application Support，返回相对路径（如 ChatImages/img_xxx.jpg），重启 app 后通过解析得到完整路径加载
  private func saveImageToPersistentStorage(_ image: UIImage) -> String? {
    guard let data = image.jpegData(compressionQuality: 0.85) else { return nil }

    let fileManager = FileManager.default
    guard
      let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        .first
    else {
      return nil
    }

    let folderURL = appSupport.appendingPathComponent("ChatImages", isDirectory: true)
    if !fileManager.fileExists(atPath: folderURL.path) {
      try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
    }

    let fileName = "img_\(UUID().uuidString).jpg"
    let fileURL = folderURL.appendingPathComponent(fileName)
    do {
      try data.write(to: fileURL, options: [.atomic])
      // 存储相对路径，避免绝对路径在重启后失效（如模拟器容器变化）
      return "ChatImages/\(fileName)"
    } catch {
      print("Failed to save image: \(error)")
      return nil
    }
  }

  // private func seedIfNeeded() {
  //   guard seedItems.isEmpty else { return }
  //   guard persistedItems.isEmpty else { return }

  //   seedItems = [
  //     ChatItem(id: "seed_demo1", isMe: false, content: .text("Hello! 😂"), timeText: "3:09 AM"),
  //     ChatItem(id: "seed_demo2", isMe: true, content: .text("Hello! 😂"), timeText: "3:09 AM"),
  //     ChatItem(id: "seed_img1", isMe: true, content: .imagePlaceholder, timeText: "3:09 AM"),
  //     ChatItem(id: "seed_audio1", isMe: true, content: .audio(seconds: 15), timeText: "3:09 AM"),
  //   ]
  // }
}

// MARK: - Composer & Bubble Models

private struct ChatComposerView: View {
  @Binding var text: String
  @Binding var isVoiceExpanded: Bool
  @Binding var isEmojiExpanded: Bool

  let onTapPhoto: () -> Void
  let onTapSend: () -> Void
  let onTapEmoji: (String) -> Void
  let onVoiceRecorded: (String, Int) -> Void
  let onVoiceRecordingStateChanged: (Bool) -> Void
  let onVoicePermissionDenied: (String) -> Void

  var body: some View {
    VStack(spacing: 0) {
      if isEmojiExpanded {
        EmojiPanelView { emoji in
          onTapEmoji(emoji)
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
      }

      ZStack(alignment: .bottom) {
        HStack(spacing: 10) {
          Button {
            // withAnimation(.spring(response: 0.28, dampingFraction: 0.85)) {
            withAnimation(.easeInOut(duration: 0.22)) {
              isVoiceExpanded.toggle()
              if isVoiceExpanded { isEmojiExpanded = false }
            }
          } label: {
            Image(systemName: isVoiceExpanded ? "keyboard" : "mic.fill")
              .font(.system(size: 22, weight: .semibold))
              .foregroundColor(.white)
          }

          Group {
            TextField(
              "",
              text: $text,
              prompt: Text("Add content")
                .foregroundColor(Color(white: 0.65))
            )
            .textFieldStyle(.plain)
            .foregroundColor(.white)
            .tint(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
            .clipShape(Capsule(style: .continuous))
          }

          Button {
            // withAnimation(.spring(response: 0.28, dampingFraction: 0.85)) {
            withAnimation(.easeInOut(duration: 0.22)) {
              isEmojiExpanded.toggle()
              if isEmojiExpanded { isVoiceExpanded = false }
            }
          } label: {
            Image(systemName: "face.smiling")
              .font(.system(size: 28))
              .foregroundColor(.white)
          }

          Button {
            if canSendText {
              onTapSend()
            } else {
              onTapPhoto()
            }
          } label: {
            Image(systemName: canSendText ? "paperplane.fill" : "photo")
              .font(.system(size: 26))
              .foregroundColor(.white)
          }
          .disabled(isVoiceExpanded && canSendText)
        }
        .padding(.horizontal, 16)
        .padding(.top, isEmojiExpanded ? 0 : 12)
      }

      if isVoiceExpanded {
        BigVoiceButtonView(
          onVoiceRecorded: onVoiceRecorded,
          onVoiceRecordingStateChanged: onVoiceRecordingStateChanged,
          onVoicePermissionDenied: onVoicePermissionDenied
        )
        .padding(.top, 24)
        .transition(.scale.combined(with: .opacity))
      }
    }
    .padding(.bottom, 36)
    .background(.black)
    .clipShape(
      UnevenRoundedRectangle(
        topLeadingRadius: 24,
        bottomLeadingRadius: 0,
        bottomTrailingRadius: 0,
        topTrailingRadius: 24,
        style: .continuous
      )
    )
  }

  private var canSendText: Bool {
    !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}

private struct EmojiPanelView: View {
  let onSelect: (String) -> Void

  var body: some View {
    HStack(spacing: 14) {
      ForEach(emojiOptions, id: \.self) { emoji in
        Button {
          onSelect(emoji)
        } label: {
          Image(emoji)
            .resizable()
            .frame(width: 36, height: 36)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .buttonStyle(.plain)
      }
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
  }
}

private struct BigVoiceButtonView: View {
  let onVoiceRecorded: (String, Int) -> Void
  let onVoiceRecordingStateChanged: (Bool) -> Void
  let onVoicePermissionDenied: (String) -> Void

  @State private var recorder: AVAudioRecorder?
  @State private var isPressing: Bool = false
  @State private var recordingBlink: Bool = false
  @State private var blinkTimer: Timer?

  private var isRecording: Bool { recorder != nil }

  var body: some View {
    ZStack {
      Circle()
        .fill(.white.opacity(isRecording ? (recordingBlink ? 0.5 : 0.15) : 0.2))
        .frame(width: 86, height: 86)

      Circle()
        .fill(.white.opacity(isRecording ? (recordingBlink ? 0.6 : 0.25) : 0.3))
        .frame(width: 64, height: 64)

      Circle()
        .fill(.white.opacity(isRecording ? (recordingBlink ? 0.7 : 0.4) : 0.4))
        .frame(width: 42, height: 42)

      Image(systemName: "mic.fill")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
    }
    .animation(.easeInOut(duration: 0.35), value: recordingBlink)
    .contentShape(Circle())
    .gesture(
      DragGesture(minimumDistance: 0)
        .onChanged { _ in
          if !isPressing {
            isPressing = true
            startRecordingIfAllowed()
          }
        }
        .onEnded { _ in
          isPressing = false
          stopBlinkTimer()
          stopRecordingAndSend()
        }
    )
  }

  private func startBlinkTimer() {
    stopBlinkTimer()
    recordingBlink = true
    blinkTimer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
      recordingBlink.toggle()
    }
    RunLoop.main.add(blinkTimer!, forMode: .common)
  }

  private func stopBlinkTimer() {
    blinkTimer?.invalidate()
    blinkTimer = nil
    recordingBlink = false
  }

  private func startRecordingIfAllowed() {
    ImagePickerView.requestMicrophoneAccess { granted, message in
      if granted {
        if let r = VoiceRecorderHelper.startRecording() {
          recorder = r
          startBlinkTimer()
          onVoiceRecordingStateChanged(true)
        }
      } else if let msg = message {
        onVoicePermissionDenied(msg)
      }
    }
  }

  private func stopRecordingAndSend() {
    guard let r = recorder else { return }
    onVoiceRecordingStateChanged(false)
    recorder = nil
    stopBlinkTimer()
    if let result = VoiceRecorderHelper.stopRecording(r) {
      onVoiceRecorded(result.path, result.duration)
    }
  }
}

// MARK: - Voice Message Bubble (可点击播放)
private class VoicePlaybackController: ObservableObject {
  @Published var isPlaying: Bool = false
  private var player: AVAudioPlayer?
  private var delegate: AudioPlayerDelegate?

  func toggle(url: URL) {
    if isPlaying {
      stop()
      return
    }
    do {
      let p = try AVAudioPlayer(contentsOf: url)
      let d = AudioPlayerDelegate { [weak self] in
        DispatchQueue.main.async { self?.stop() }
      }
      delegate = d
      p.delegate = d
      player = p
      p.play()
      isPlaying = true
    } catch {
      print("VoicePlaybackController play failed: \(error)")
    }
  }

  func stop() {
    player?.stop()
    player = nil
    delegate = nil
    isPlaying = false
  }
}

private class AudioPlayerDelegate: NSObject, AVAudioPlayerDelegate {
  let onFinish: () -> Void
  init(onFinish: @escaping () -> Void) { self.onFinish = onFinish }
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { onFinish() }
}

private struct VoiceMessageBubble: View {
  let seconds: Int
  let path: String
  let isMe: Bool

  @StateObject private var playback = VoicePlaybackController()

  private var bubbleColor: Color {
    isMe ? Color(red: 0.72, green: 0.86, blue: 0.24) : Color(red: 0.96, green: 0.23, blue: 0.64)
  }

  var body: some View {
    Button {
      let resolvedPath = VoiceRecorderHelper.resolveAudioPath(path)
      guard !resolvedPath.isEmpty, FileManager.default.fileExists(atPath: resolvedPath) else {
        return
      }
      playback.toggle(url: URL(fileURLWithPath: resolvedPath))
    } label: {
      HStack(spacing: 10) {
        Image(systemName: playback.isPlaying ? "stop.fill" : "play.fill")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(isMe ? .black.opacity(0.8) : .white.opacity(0.9))
          .frame(width: 18, height: 18)
        Text("\(seconds)S")
          .font(.system(size: 16))
          .foregroundColor(isMe ? .black.opacity(0.85) : .white.opacity(0.9))
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 12)
      .background(bubbleColor)
      .clipShape(
        UnevenRoundedRectangle(
          topLeadingRadius: 12,
          bottomLeadingRadius: isMe ? 12 : 0,
          bottomTrailingRadius: isMe ? 0 : 12,
          topTrailingRadius: 12,
          style: .continuous
        )
      )
    }
    .buttonStyle(.plain)
    .onDisappear { playback.stop() }
  }
}

// MARK: - Bubble & Models

private struct ChatBubbleRowView: View {
  let item: ChatItem
  let meAvatar: String
  let otherAvatar: String

  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      if item.isMe {
        Spacer(minLength: 36)
      } else {
        avatar(symbol: otherAvatar)
      }

      VStack(alignment: item.isMe ? .trailing : .leading, spacing: 6) {
        bubbleMsg

        Text(item.timeText)
          .font(.system(size: 12))
          .foregroundColor(.white.opacity(0.55))
      }
      .frame(
        maxWidth: UIScreen.main.bounds.width * 0.72, alignment: item.isMe ? .trailing : .leading)

      if item.isMe {
        avatar(symbol: meAvatar)
      } else {
        Spacer(minLength: 36)
      }
    }
  }

  @ViewBuilder
  private var bubbleMsg: some View {
    switch item.content {
    case .text(let text):
      Text(text)
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(item.isMe ? .black : .white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          item.isMe
            ? Color(red: 0.72, green: 0.86, blue: 0.24) : Color(red: 0.96, green: 0.23, blue: 0.64)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: item.isMe ? 12 : 0,
            bottomTrailingRadius: item.isMe ? 0 : 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )

    case .emojiImage(let name):
      Image(name)
        .resizable()
        .frame(width: 60, height: 60)
        .padding(8)
        .background(
          RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(
              item.isMe
                ? Color(red: 0.72, green: 0.86, blue: 0.24)
                : Color(red: 0.96, green: 0.23, blue: 0.64)
            )
        )

    case .image(let path):
      let bubbleColor =
        item.isMe
        ? Color(red: 0.72, green: 0.86, blue: 0.24)
        : Color(red: 0.96, green: 0.23, blue: 0.64)
      ZStack {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(bubbleColor)
        SmartImageView(
          resource: .file(path: path),
          placeholder: Image(systemName: "photo"),
          contentMode: .fill
        )
        .foregroundStyle(.white.opacity(0.9))
      }
      .frame(width: 160, height: 160)
      .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

    case .imagePlaceholder:
      ZStack {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(
            item.isMe
              ? Color(red: 0.72, green: 0.86, blue: 0.24)
              : Color(red: 0.96, green: 0.23, blue: 0.64))

        Image(systemName: "photo")
          .font(.system(size: 38, weight: .semibold))
          .foregroundColor(.white.opacity(0.9))
      }
      .frame(width: 120, height: 120)
      .overlay(
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .stroke(.white.opacity(0.18), lineWidth: 2)
      )

    case .audio(let seconds, let path):
      VoiceMessageBubble(seconds: seconds, path: path, isMe: item.isMe)
    }
  }

  private func avatar(symbol: String) -> some View {
    Image(systemName: symbol)
      .font(.system(size: 30))
      .foregroundColor(.white.opacity(0.9))
      .frame(width: 36, height: 36)
      .background(.white.opacity(0.15))
      .clipShape(Circle())
  }
}

private struct ChatItem: Identifiable, Equatable {
  enum Content: Equatable {
    case text(String)
    case emojiImage(name: String)
    case image(path: String)
    case imagePlaceholder
    case audio(seconds: Int, path: String)
  }

  let id: String
  let isMe: Bool
  let content: Content
  let timeText: String
}

struct ChatTopBarView<Trailing: View>: View {
  let title: String
  let showsBackButton: Bool
  let onBack: () -> Void
  @ViewBuilder let trailing: () -> Trailing

  init(
    title: String, showsBackButton: Bool, onBack: @escaping () -> Void,
    @ViewBuilder trailing: @escaping () -> Trailing
  ) {
    self.title = title
    self.showsBackButton = showsBackButton
    self.onBack = onBack
    self.trailing = trailing
  }

  var body: some View {
    HStack {
      if showsBackButton {
        Button(action: onBack) {
          Image(systemName: "chevron.left")
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 44, height: 44)
            .background(.white.opacity(0.15))
            .clipShape(Circle())
        }
      } else {
        Spacer().frame(width: 44)
      }

      Spacer()

      Text(title)
        .font(.system(size: 22, weight: .semibold))
        .foregroundColor(.white)

      Spacer()

      trailing()
        .frame(width: 44, height: 44)
    }
    .padding(.horizontal, 16)
    .padding(.top, 6)
    .padding(.bottom, 10)
  }
}
