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
  @State private var paymentText: String = ""
  @State private var isPosting: Bool = false

  private let headerGradient = LinearGradient(
    colors: [
      Color(red: 0.35, green: 0.85, blue: 0.5),
      Color(red: 0.2, green: 0.35, blue: 0.6),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

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

        Spacer(minLength: 0)

        postButton
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - 顶部导航栏

  private var topBar: some View {
    ZStack(alignment: .leading) {
      HStack {
        Button {
          dismiss.callAsFunction()
        } label: {
          Image(systemName: "chevron.left")
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Circle().fill(Color.white))
        }
        .padding(.leading, 16)

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
    VStack {
      Image("gfqjfrzfemtladd")
        .resizable()
        .frame(width: 60, height: 60)
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height * 0.5)
        .background(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color.white.opacity(0.3), lineWidth: 2)
            // .strokeBorder(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 2, dash: [8]))
            .background(
              RoundedRectangle(cornerRadius: 20, style: .continuous)
                //rgb(46, 53, 71)
                .fill(Color(red: 46 / 255, green: 53 / 255, blue: 71 / 255))
            )
        )
    }
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
    .disabled(isPosting)
    .padding(.horizontal, 20)
    .padding(.bottom, 14)
  }

  private func performPost() {
    guard !isPosting else { return }
    isPosting = true
    // 模拟发布后返回上一页（挑战详情）
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      isPosting = false
      if !path.isEmpty { path.removeLast() }
    }
  }
}

#Preview {
  NavigationStack {
    UploadVideoView(path: .constant([]), challengeId: AppData.makeSample().challenges[0].id)
  }
}
