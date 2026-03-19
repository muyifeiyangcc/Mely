//
//  UploadVideoView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct UploadVideoView: View {
  @Binding var path: [MainRoute]
  let challengeId: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var appDataStore: AppDataStore

  @State private var paymentText: String = ""
  @State private var isPosting: Bool = false
  /// 选中的视频临时 URL（选择后尚未发布）
  @State private var selectedVideoURL: URL?
  /// 临时封面图（选择视频后生成，用于预览）
  @State private var thumbnailImage: UIImage?
  @State private var showVideoSourcePicker: Bool = false

  private let headerGradient = LinearGradient(
    colors: [
      Color(red: 0.35, green: 0.85, blue: 0.5),
      Color(red: 0.2, green: 0.35, blue: 0.6),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        topBar

        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 30) {
            uploadArea
              .padding(.horizontal, 20)

            paymentSection
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)
        }
        .scrollDismissesKeyboard(.immediately)

        Spacer(minLength: 0)

        postButton
      }
    }
    .onTapGesture {
      UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .videoSourcePicker(isPresented: $showVideoSourcePicker) { url in
      handleVideoPicked(url)
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func handleVideoPicked(_ url: URL) {
    selectedVideoURL = url
    thumbnailImage = ImageStorageHelper.generateThumbnail(from: url)
  }

  // MARK: - 顶部导航栏
  private var topBar: some View {
    ZStack(alignment: .leading) {
      HStack {
        Button {
          dismiss.callAsFunction()
        } label: {
          Image(systemName: "chevron.left")
            .font(.system(size: 18))
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Circle().fill(Color.white))
        }
        .padding(.leading, 20)

        Spacer()

        Text("Post")
          .font(.title2.bold())
          .foregroundColor(.white)

        Spacer()

        Color.clear
          .frame(width: 44, height: 44)
      }
    }
  }

  // MARK: - 内容上传区域
  private var uploadArea: some View {
    Button {
      showVideoSourcePicker = true
    } label: {
      Group {
        if let thumb = thumbnailImage {
          Image(uiImage: thumb)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
          // .scaledToFill()
        } else {
          VStack {
            Image("gfqjfrzfemtladd")
              .resizable()
              .frame(width: 60, height: 60)
          }
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: UIScreen.main.bounds.height * 0.5)
      .clipped()
      .background(
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .stroke(Color.white.opacity(0.3), lineWidth: 2)
          .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
              .fill(Color(red: 46 / 255, green: 53 / 255, blue: 71 / 255))
          )
      )
    }
    .buttonStyle(.plain)
  }

  // MARK: - 支付（可选）
  private var paymentSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 6) {
        Text("Payment")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("mkirgxytewig_diamond")
          .resizable()
          .frame(width: 20, height: 20)
        Text("(Optional)")
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 20, height: 20)
      }

      TextField(
        "",
        text: $paymentText,
        prompt: Text("Example 300").foregroundColor(Color(white: 0.7))
      )
      .font(.custom("Hanchansans-Medium", size: 16))
      .foregroundColor(.black)
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Color.white)
      )
      .keyboardType(.numberPad)
      .submitLabel(.done)
    }
  }

  // MARK: - 发布按钮

  private var postButton: some View {
    Button {
      performPost()
    } label: {
      Text("Post")
        .font(.custom("Hanchansans-Medium", size: 20))
        .foregroundColor(.black)
        .frame(width: 200)
        .padding(.vertical, 15)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 20)
    .padding(.bottom, 14)
  }

  private func performPost() {
    guard !isPosting else { return }
    guard let videoURL = selectedVideoURL else { return }
    isPosting = true

    // 1. 保存视频到 Application Support
    guard let videoPath = ImageStorageHelper.saveVideo(from: videoURL) else {
      isPosting = false
      return
    }

    // 2. 生成并保存封面
    let thumbPath: String
    if let thumb = ImageStorageHelper.generateThumbnail(from: videoURL),
      let saved = ImageStorageHelper.saveChallengeVideoThumbnail(thumb)
    {
      thumbPath = saved
    } else if let thumb = thumbnailImage,
      let saved = ImageStorageHelper.saveChallengeVideoThumbnail(thumb)
    {
      thumbPath = saved
    } else {
      thumbPath = "test"  // 回退到占位
    }

    // 3. 解析 Payment 钻石数（可选）
    let diamonds = Int(paymentText.trimmingCharacters(in: .whitespaces)) ?? 0
    let unlockCost = diamonds > 0 ? diamonds : nil

    // 4. 添加到 AppData
    appDataStore.addChallengeVideo(
      challengeId: challengeId,
      videoRelativePath: videoPath,
      thumbnailRelativePath: thumbPath,
      unlockCostDiamonds: unlockCost
    )

    isPosting = false
    if !path.isEmpty { path.removeLast() }
  }
}
