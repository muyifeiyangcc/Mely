//
//  UpdvdoS6ihyCxXzP8q3e.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import SwiftUI

struct UpdvdoS6ihyCxXzP8q3e: View {
  @Binding var path: [MainRoute]
  let chaidGv626ziV6BGf53: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var Zt5iNFkioegZpw: MelystoreWpvugHy89HDWLR

  @State private var mzlnHvlNVU98CS: String = ""
  @State private var poing1wXBCYXxjhy90Z: Bool = false
  @State private var vsurlHSmxq6oGW7xR1A: URL?
  @State private var thuimg1jgoim57t64kKD: UIImage?
  @State private var shvdopWLHYE8VsBFGOg: Bool = false

  var body: some View {
    CreatejLlpeiC5nAUAvPScaffold(
      title: "Post",
      primaryButtonTitle: "Post",
      onBack: { dismiss.callAsFunction() },
      onPrimaryTap: perposKw4u98IvpEuqna,
      buttonVerticalPadding: 15,
      onBackgroundTap: {
        UIApplication.shared.sendAction(
          #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    ) {
      VStack(spacing: 30) {
        updaX1sYs0GwUZXlge
          .padding(.horizontal, 20)

        pay6ad9u5DemD5FZo
      }
      .padding(.horizontal, 20)
      .padding(.top, 24)
      .scrollDismissesKeyboard(.immediately)
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .videoSourcePicker(isPresented: $shvdopWLHYE8VsBFGOg) { url in
      handvdouTcSYKythCGJ8G(url)
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func handvdouTcSYKythCGJ8G(_ url: URL) {
    vsurlHSmxq6oGW7xR1A = url
    thuimg1jgoim57t64kKD = ImgstorehR7h57Xdriq7hH.genthumC9QsQCFsyaFEfw(from: url)
  }

  private var updaX1sYs0GwUZXlge: some View {
    Button {
      shvdopWLHYE8VsBFGOg = true
    } label: {
      Group {
        if let uirFed9ASElC9Q = thuimg1jgoim57t64kKD {
          Image(uiImage: uirFed9ASElC9Q)
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
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

  private var pay6ad9u5DemD5FZo: some View {
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
        text: $mzlnHvlNVU98CS,
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

  private func perposKw4u98IvpEuqna() {
    guard !poing1wXBCYXxjhy90Z else { return }
    guard let axzUkjfx4zXpAd = vsurlHSmxq6oGW7xR1A else { return }
    poing1wXBCYXxjhy90Z = true

    guard let v2kSls8T06eHhyN = ImgstorehR7h57Xdriq7hH.saveVideo(from: axzUkjfx4zXpAd) else {
      poing1wXBCYXxjhy90Z = false
      return
    }

    let BBfJ4z2GEgi5uv: String
    if let vgVlsYWvH2I4FX = ImgstorehR7h57Xdriq7hH.genthumC9QsQCFsyaFEfw(from: axzUkjfx4zXpAd),
      let saved = ImgstorehR7h57Xdriq7hH.svthumwMZLyhpH2lK8Ad(vgVlsYWvH2I4FX)
    {
      BBfJ4z2GEgi5uv = saved
    } else if let vgVlsYWvH2I4FX = thuimg1jgoim57t64kKD,
      let saved = ImgstorehR7h57Xdriq7hH.svthumwMZLyhpH2lK8Ad(vgVlsYWvH2I4FX)
    {
      BBfJ4z2GEgi5uv = saved
    } else {
      BBfJ4z2GEgi5uv = "test"
    }

    let daa1UOFaUSvrpf7t = Int(mzlnHvlNVU98CS.trimmingCharacters(in: .whitespaces)) ?? 0
    let unlocWyoyMeUATYVU0 = daa1UOFaUSvrpf7t > 0 ? daa1UOFaUSvrpf7t : nil

    Zt5iNFkioegZpw.advdonqvuaQ5wP0xLwf(
      LuHT6IbHDcGq0N: chaidGv626ziV6BGf53,
      RJQh7nvW6vkfpu: v2kSls8T06eHhyN,
      tum7xBLorz4Cj7VHZ: BBfJ4z2GEgi5uv,
      FSS8h4RGqA6OZ0: unlocWyoyMeUATYVU0
    )

    poing1wXBCYXxjhy90Z = false
    if !path.isEmpty { path.removeLast() }
  }
}
