//
//  CreateChallengeView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct CreateChallengeView: View {
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss

  @State private var title: String = ""
  @State private var rule: String = ""
  @State private var hasCover: Bool = false
  @State private var selectedCoverImage: UIImage?
  @State private var isCreating: Bool = false
  @State private var showImageSourcePicker: Bool = false

  private let ruleLimit: Int = 50

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        topBar

        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 30) {
            coverSection
            themeSection
            ruleSection
          }
          .padding(.horizontal, 20)
          .padding(.top, 24)
        }

        Spacer(minLength: 0)

        createButton
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .toolbar {
      ToolbarItemGroup(placement: .keyboard) {
        Spacer()
        Button("Done") {
          UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.blue)
      }
    }
    .imageSourcePicker(isPresented: $showImageSourcePicker) { image in
      selectedCoverImage = image
      hasCover = true
    }
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

  // MARK: - 封面上传
  private var coverSection: some View {
    VStack(spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .fill(Color(red: 46 / 255, green: 53 / 255, blue: 71 / 255))
          .stroke(Color.white.opacity(0.25), lineWidth: 2)
          .frame(height: 180)
          .padding(.horizontal, 16)
          .clipped()

        if let image = selectedCoverImage {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 16)
        } else {
          Image("gfqjfrzfemtladd")
            .resizable()
            .frame(width: 52, height: 52)
        }
      }
      .onTapGesture {
        showImageSourcePicker = true
      }

      Text("Cover  (\(hasCover ? 1 : 0)/1)")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
  }

  // MARK: - 主题
  private var themeSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 10) {
        Text("Challenge Theme")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      TextField(
        "",
        text: $title,
        prompt: Text("Please enter").foregroundColor(Color(white: 0.7))
      )
      .font(.custom("Hanchansans-Medium", size: 16))
      .foregroundColor(.black)
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color.white)
      )
    }
  }

  // MARK: - 规则描述
  private var ruleSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 10) {
        Text("Rule")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      ZStack(alignment: .topLeading) {
        TextEditor(text: $rule)
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.black)
          .padding(.horizontal, 12)
          .padding(.vertical, 8)
          .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .fill(Color.white)
          )

        if rule.isEmpty {
          Text("Please enter")
            .font(.custom("Hanchansans-Medium", size: 16))
            .foregroundColor(Color(white: 0.7))
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }

        VStack {
          Spacer()
          HStack {
            Spacer()
            Text("\(rule.count)/\(ruleLimit)")
              .font(.caption)
              .foregroundColor(.black)
          }
          .padding(10)
        }

      }
      .frame(height: 140)

    }
  }

  // MARK: - 创建按钮
  private var createButton: some View {
    Button {
      performCreate()
    } label: {
      Text("Create")
        .font(.custom("Hanchansans-Medium", size: 20))
        .foregroundColor(.black)
        .frame(width: 200)
        .padding(.vertical, 14)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 20)
    .padding(.bottom, 20)
  }

  /// 图片和输入内容都填写完成后才能创建
  private var canCreate: Bool {
    selectedCoverImage != nil
      && !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      && !rule.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  // TextEditor 绑定的截断代理
  private var ruleLimited: Binding<String> {
    Binding(
      get: { rule },
      set: { newValue in
        if newValue.count <= ruleLimit {
          rule = newValue
        } else {
          rule = String(newValue.prefix(ruleLimit))
        }
      }
    )
  }

  private func performCreate() {
    guard canCreate, !isCreating else { return }
    isCreating = true

    var coverImageName: String? = nil
    if let image = selectedCoverImage, let path = ImageStorageHelper.saveChallengeCover(image) {
      coverImageName = path
    }
    appDataStore.addChallenge(title: title, rule: rule, coverImageName: coverImageName)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      isCreating = false
      dismiss()
    }
  }
}

#Preview {
  NavigationStack {
    CreateChallengeView()
      .environmentObject(AppDataStore())
  }
}
