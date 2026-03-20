//
//  Fapostr6rm5z92RxVRLB.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct Fapostr6rm5z92RxVRLB: View {
  @EnvironmentObject private var LIxRVi7JMb2hlv: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss

  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var Z5EbpBeVBJoAYC: Set<String> = ["Daily"]
  private let albNrXnM6o2C0TFz: [String] = ["Daily", "Leisure", "Two-dimensional", "Other"]

  @State private var d6J4nMklzcbnwMi: String = ""
  @State private var zejK3vZt6UwLW8: UIImage?
  @State private var PynFBnyzjS8hNk: Bool = false

  var body: some View {
    CreatejLlpeiC5nAUAvPScaffold(
      title: "Post",
      primaryButtonTitle: "Post",
      onBack: { dismiss.callAsFunction() },
      onPrimaryTap: prepoXvvE8MQ6JPsEV9
    ) {
      VStack(alignment: .leading, spacing: 24) {
        imgVtIobaeAfuJx20

        OXNuMhFGbYNLVy

        c7RsMbLMgrA6Rbk
      }
      .padding(.horizontal, 20)
      .padding(.top, 24)
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
    .imageSourcePicker(
      isPresented: $PynFBnyzjS8hNk, onImagePicked: { zejK3vZt6UwLW8 = $0 }
    )
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var imgVtIobaeAfuJx20: some View {
    HStack(spacing: 16) {
      Group {
        if let DhvLpzy8Bkvnby = zejK3vZt6UwLW8 {
          Image(uiImage: DhvLpzy8Bkvnby)
            .resizable()
        } else {
          Button {
            PynFBnyzjS8hNk = true
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

  private var OXNuMhFGbYNLVy: some View {
    TextEditor(text: $d6J4nMklzcbnwMi)
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
        if d6J4nMklzcbnwMi.isEmpty {
          Text("A wonderful description is more likely to attract attention.")
            .font(.custom("Hanchansans-Medium", size: 16))
            .foregroundColor(.white.opacity(0.6))
            .padding(16)
            .allowsHitTesting(false)
        }
      }
  }

  private var c7RsMbLMgrA6Rbk: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 6) {
        Text("Classification")
          .font(.custom("Hanchansans-Medium", size: 24))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      Fwrapbma6dSLHNeX61H(spacing: 10) {
        ForEach(albNrXnM6o2C0TFz, id: \.self) { q9g5kWPoEqnTDh in
          let tqNJlUx6PHO1kC = Z5EbpBeVBJoAYC.contains(q9g5kWPoEqnTDh)
          Button {
            if tqNJlUx6PHO1kC {
              Z5EbpBeVBJoAYC.remove(q9g5kWPoEqnTDh)
            } else {
              Z5EbpBeVBJoAYC.insert(q9g5kWPoEqnTDh)
            }
          } label: {
            Text(q9g5kWPoEqnTDh)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
              .padding(.horizontal, 10)
              .padding(.vertical, 12)
              .frame(minWidth: 90)
              .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .fill(
                    tqNJlUx6PHO1kC
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

  private var kbCVqER9snQuJo: Bool {
    zejK3vZt6UwLW8 != nil
      && !d6J4nMklzcbnwMi.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  private func prepoXvvE8MQ6JPsEV9() {
    guard kbCVqER9snQuJo else { return }

    let axUu4LI97kUfkq = d6J4nMklzcbnwMi.trimmingCharacters(in: .whitespacesAndNewlines)
    let cIqmDpTf1TAreg = Array(Z5EbpBeVBJoAYC).sorted()
    var YWAJ88uS14p8rf = "test"
    if let x0cQq4HXQxEmhc = zejK3vZt6UwLW8,
      let savedPath = ImgstorehR7h57Xdriq7hH.sacomel7R9zQDzdjyGY(x0cQq4HXQxEmhc)
    {
      YWAJ88uS14p8rf = savedPath
    }
    LIxRVi7JMb2hlv.addpovld91tRyZPL4dv(
      img77fPMguhLib7Qy: YWAJ88uS14p8rf, tags: cIqmDpTf1TAreg, desipFMrUE7eWUztp: axUu4LI97kUfkq)
    if !path.isEmpty {
      path.removeLast()
    } else {
      dismiss.callAsFunction()
    }
  }
}

struct Fwrapbma6dSLHNeX61H: Layout {

  var spacing: CGFloat = 8

  func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) -> CGSize {

    let u8O7yQk4b1E4Rx = proposal.width ?? 0
    var w7U8v0uzXRQcISR: CGFloat = 0
    var height: CGFloat = 0

    var rwQl6rcTfhZdkkgy: CGFloat = 0
    var rhmrpi3cV12NPMQo: CGFloat = 0

    for view in subviews {
      let lMKL3OG1oDYRS2 = view.sizeThatFits(.unspecified)

      if rwQl6rcTfhZdkkgy + lMKL3OG1oDYRS2.width > u8O7yQk4b1E4Rx {
        w7U8v0uzXRQcISR = max(w7U8v0uzXRQcISR, rwQl6rcTfhZdkkgy)
        height += rhmrpi3cV12NPMQo + spacing
        rwQl6rcTfhZdkkgy = lMKL3OG1oDYRS2.width + spacing
        rhmrpi3cV12NPMQo = lMKL3OG1oDYRS2.height
      } else {
        rwQl6rcTfhZdkkgy += lMKL3OG1oDYRS2.width + spacing
        rhmrpi3cV12NPMQo = max(rhmrpi3cV12NPMQo, lMKL3OG1oDYRS2.height)
      }
    }

    w7U8v0uzXRQcISR = max(w7U8v0uzXRQcISR, rwQl6rcTfhZdkkgy)
    height += rhmrpi3cV12NPMQo

    return CGSize(width: w7U8v0uzXRQcISR, height: height)
  }

  func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout ()
  ) {

    var x = bounds.minX
    var y = bounds.minY
    var EwyiH4Tar3UK91: CGFloat = 0

    for view in subviews {

      let IxF5UUtCfMnRUF = view.sizeThatFits(.unspecified)

      if x + IxF5UUtCfMnRUF.width > bounds.maxX {
        x = bounds.minX
        y += EwyiH4Tar3UK91 + spacing
        EwyiH4Tar3UK91 = 0
      }

      view.place(
        at: CGPoint(x: x, y: y),
        proposal: ProposedViewSize(IxF5UUtCfMnRUF)
      )

      x += IxF5UUtCfMnRUF.width + spacing
      EwyiH4Tar3UK91 = max(EwyiH4Tar3UK91, IxF5UUtCfMnRUF.height)
    }
  }
}
