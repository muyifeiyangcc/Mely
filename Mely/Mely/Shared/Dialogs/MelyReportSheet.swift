//
//  MelyReportSheet.swift
//  Mely
//
//  举报弹窗：选择举报原因、填写详细描述、提交/取消
//

import SwiftUI

/// 举报原因枚举
enum ReportReason: String, CaseIterable {
  case politicalSensitive = "Political Sensitive"
  case violentPornography = "Violent Pornography"
  case advertisingHarassment = "Advertising Harassment"
  case infringement = "Infringement"
  case other = "Other"
}

/// 公共举报弹窗
/// - Parameters:
///   - isPresented: 控制弹窗显示/隐藏
///   - onSubmit: 提交举报回调，参数为 (举报原因, 详细描述)
///   - onCancel: 取消回调（可选）
struct MelyReportSheet: View {
  @Binding var isPresented: Bool
  let onSubmit: (ReportReason, String) -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var selectedReason: ReportReason = .politicalSensitive
  @State private var descriptionText: String = ""

  private let aiGreen = Color(hex: "#CBED40")
  private let aiPink = Color(hex: "#FF1AB6")

  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .onTapGesture { performCancel() }

      VStack(spacing: 0) {
        // 白色主体
        VStack(spacing: 20) {
          // 举报原因选项
          VStack(spacing: 10) {
            ForEach(ReportReason.allCases, id: \.self) { reason in
              Button {
                selectedReason = reason
              } label: {
                Text(reason.rawValue)
                  .font(.custom("Hanchansans-Medium", size: 16))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, alignment: .center)
                  .padding(.horizontal, 16)
                  .padding(.vertical, 12)
                  .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                      .fill(selectedReason == reason ? aiGreen : Color(hex: "#BFBFBF"))
                  )
              }
              .buttonStyle(.plain)
              .frame(maxWidth: 235)
            }
          }
          // .padding(.horizontal, 50)
          .padding(.top, 55)

          // 详细描述输入（黑色圆角矩形）
          ZStack(alignment: .topLeading) {
            if descriptionText.isEmpty {
              Text("Describe more clear reporting information")
                .font(.custom("Hanchansans-Medium", size: 15))
                .foregroundColor(Color(white: 0.5))
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
            }
            TextField(
              "",
              text: $descriptionText,
              axis: .vertical
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .lineLimit(4...8)
            .font(.custom("Hanchansans-Medium", size: 15))
            .foregroundColor(.white)

          }
          .frame(width: 235)
          .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .fill(Color.black.opacity(0.9))
          )
          // .padding(.horizontal, 50)

          // 取消、提交按钮
          VStack(spacing: 12) {
            Button {
              performCancel()
            } label: {
              Text("Cancel")
                .font(.custom("Hanchansans-Medium", size: 18))
                .foregroundColor(.black)
                .frame(maxWidth: 200)
                .padding(.vertical, 14)
                .background(
                  Capsule()
                    .fill(aiGreen)
                )
            }
            .buttonStyle(.plain)

            Button {
              isPresented = false
              onSubmit(selectedReason, descriptionText)
            } label: {
              Text("Submit")
                .font(.custom("Hanchansans-Medium", size: 17))
                .foregroundColor(.white)
                .frame(maxWidth: 200)
                .padding(.vertical, 14)
                .background(
                  Capsule()
                    .fill(Color.black)
                )
            }
            .buttonStyle(.plain)
          }
          // .padding(.horizontal, 24)
          .padding(.top, 8)
        }
        .background(
          Image("qpeuskywqaalzy_chang")
            .resizable()
            // .scaledToFit()
            .frame(width: 320, height: 620)
          // .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
          // RoundedRectangle(cornerRadius: 20, style: .continuous)
          //   .fill(Color.white)
        )
        // .overlay(
        //   RoundedRectangle(cornerRadius: 20, style: .continuous)
        //     .stroke(aiPink, lineWidth: 4)
        // )
        .padding(.horizontal, 24)
      }
    }
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
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func performCancel() {
    onCancel?()
    isPresented = false
  }
}

#Preview {
  struct PreviewWrapper: View {
    @State private var show = true
    var body: some View {
      ZStack {
        Color.gray.opacity(0.3)
        if show {
          MelyReportSheet(
            isPresented: $show,
            onSubmit: { reason, desc in print("Report:", reason, desc) },
            onCancel: { print("Cancel") }
          )
        }
      }
    }
  }
  return PreviewWrapper()
}
