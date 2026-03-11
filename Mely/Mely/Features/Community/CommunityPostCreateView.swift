//
//  CommunityPostCreateView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct CommunityPostCreateView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var selectedTags: Set<String> = ["Daily"]
  private let allTags: [String] = ["Daily", "Leisure", "Two-dimensional", "Other"]

  /// 帖子描述输入
  @State private var descriptionText: String = ""

  /// 用户选择的帖子主图
  @State private var selectedPostImage: UIImage?
  @State private var showImageSourcePicker: Bool = false

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        topBar

        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 24) {
            imageArea

            descriptionInput

            classificationSection
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
    .imageSourcePicker(
      isPresented: $showImageSourcePicker, onImagePicked: { selectedPostImage = $0 }
    )
    #if DEBUG
      .enableInjection()
    #endif
  }

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

  private var imageArea: some View {
    HStack(spacing: 16) {
      // 主图展示：选中图片或占位
      Group {
        if let image = selectedPostImage {
          Image(uiImage: image)
            .resizable()
        } else {
          // 点击上传图片：打开资源选择弹窗 → 权限 → 选择图片
          Button {
            showImageSourcePicker = true
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                .background(
                  RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(red: 46 / 255, green: 53 / 255, blue: 71 / 255))
                )

              Image("gfqjfrzfemtladd")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            }
          }
          .buttonStyle(.plain)
          .frame(width: 160, height: 240)
        }
      }
      .scaledToFill()
      .frame(width: 160, height: 240)
      .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
  }

  private var descriptionInput: some View {
    TextEditor(text: $descriptionText)
      .font(.custom("Hanchansans-Medium", size: 16))
      .foregroundColor(.white)
      .scrollContentBackground(.hidden)
      .padding(.horizontal, 12)
      .padding(.vertical, 10)
      .frame(minHeight: 100)
      .frame(maxWidth: .infinity)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color.black.opacity(0.7))
      )
      .overlay(alignment: .topLeading) {
        if descriptionText.isEmpty {
          Text("A wonderful description is more likely to attract attention.")
            .font(.custom("Hanchansans-Medium", size: 16))
            .foregroundColor(.white.opacity(0.6))
            .padding(16)
            .allowsHitTesting(false)
        }
      }
  }

  private var classificationSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 6) {
        Text("Classification")
          .font(.custom("Hanchansans-Medium", size: 24))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      // let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

      FlowLayout(spacing: 10) {
        ForEach(allTags, id: \.self) { tag in
          let isSelected = selectedTags.contains(tag)
          Button {
            if isSelected {
              selectedTags.remove(tag)
            } else {
              selectedTags.insert(tag)
            }
          } label: {
            Text(tag)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
              .padding(.horizontal, 10)
              .padding(.vertical, 12)
              .frame(minWidth: 90)
              // .frame(maxWidth: .infinity, alignment: .center)
              .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .fill(
                    isSelected
                      ? Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255)
                      : Color.white
                  )
                  .stroke(Color.white, lineWidth: 1)
              )
          }
          .buttonStyle(.plain)
        }
      }
    }
  }

  /// 图片和描述都填写才能发布
  private var canPost: Bool {
    selectedPostImage != nil
      && !descriptionText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  private var postButton: some View {
    Button {
      performPost()
    } label: {
      Text("Post")
        .font(.custom("Hanchansans-Medium", size: 20))
        .foregroundColor(.black)
        .frame(width: 200)
        .padding(.vertical, 14)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
        // .opacity(canPost ? 1 : 0.6)
    }
    .buttonStyle(.plain)
    // .disabled(!canPost)
    .padding(.horizontal, 20)
    .padding(.bottom, 14)
  }

  private func performPost() {
    guard canPost else { return }

    let desc = descriptionText.trimmingCharacters(in: .whitespacesAndNewlines)
    let tags = Array(selectedTags).sorted()
    var imageName = "test"
    if let image = selectedPostImage,
      let savedPath = ImageStorageHelper.saveCommunityImage(image)
    {
      imageName = savedPath
    }
    appDataStore.addCommunityPost(imageName: imageName, tags: tags, description: desc)
    // 返回社区广场
    if !path.isEmpty {
      path.removeLast()
    } else {
      dismiss.callAsFunction()
    }
  }
}

struct FlowLayout: Layout {

  var spacing: CGFloat = 8

  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {

    let maxWidth = proposal.width ?? 0
    var width: CGFloat = 0
    var height: CGFloat = 0

    var rowWidth: CGFloat = 0
    var rowHeight: CGFloat = 0

    for view in subviews {
      let size = view.sizeThatFits(.unspecified)

      if rowWidth + size.width > maxWidth {
        width = max(width, rowWidth)
        height += rowHeight + spacing
        rowWidth = size.width + spacing
        rowHeight = size.height
      } else {
        rowWidth += size.width + spacing
        rowHeight = max(rowHeight, size.height)
      }
    }

    width = max(width, rowWidth)
    height += rowHeight

    return CGSize(width: width, height: height)
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {

    var x = bounds.minX
    var y = bounds.minY
    var rowHeight: CGFloat = 0

    for view in subviews {

      let size = view.sizeThatFits(.unspecified)

      if x + size.width > bounds.maxX {
        x = bounds.minX
        y += rowHeight + spacing
        rowHeight = 0
      }

      view.place(
        at: CGPoint(x: x, y: y),
        proposal: ProposedViewSize(size)
      )

      x += size.width + spacing
      rowHeight = max(rowHeight, size.height)
    }
  }
}
