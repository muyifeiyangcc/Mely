//
//  MhoshoutosPR9GnzvOjHw.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

struct MhoshoutosPR9GnzvOjHw: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var bHtOTg1jCD0WmZ: MelystoreWpvugHy89HDWLR

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var s8Ttn4DR5mxF7d7: String = ""

  private var Bqk0DhBCQb7eMf: [DancozZ6LtwXHtlqPu] {
    let TxxGGgE92KCiTe = bHtOTg1jCD0WmZ.filchasD9OgZwYuwgrF4I
    let q = s8Ttn4DR5mxF7d7.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    guard !q.isEmpty else { return TxxGGgE92KCiTe }
    return TxxGGgE92KCiTe.filter {
      $0.dTt6Lf2Vb.lowercased().contains(q) || $0.dDe8Av3Jr.lowercased().contains(q)
    }
  }

  var body: some View {
    MelyYemianScaffold {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading, spacing: 0) {
          fB1N9PmOCcE70zsear

          aiPanelIzuHTE6WZ72Ona
            .padding(.vertical, 20)

          chasudZ6Hxl7WKNHNp
        }
        .padding(.bottom, 100)
      }
    }
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var fB1N9PmOCcE70zsear: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image("Melycaised")
          .resizable()
          .scaledToFit()
          .frame(height: 38)

        Spacer()

        Button {
          path.append(.challengeCreate)
        } label: {
          Image("xieqingadd")
            .resizable()
            .frame(width: 44, height: 44)
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, 8)

      HStack(spacing: 10) {
        Image(systemName: "magnifyingglass")
          .font(.system(size: 20).bold())
          .foregroundColor(.white)
        TextField(
          "", text: $s8Ttn4DR5mxF7d7, prompt: Text("eIWpyNId".melyDecoded).foregroundColor(.white.opacity(0.6))
        )
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)
        .submitLabel(.search)

        if !s8Ttn4DR5mxF7d7.isEmpty {
          Button {
            s8Ttn4DR5mxF7d7 = ""
            UIApplication.shared.sendAction(
              #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
          } label: {
            Image(systemName: "FEhSdaXmyvoFPHh6y7rf7FM".melyDecoded)
              .font(.system(size: 20).bold())
              .foregroundColor(.white.opacity(0.7))
          }
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(
        Capsule()
          .fill(Color.white.opacity(0.20))
      )
      .padding(.horizontal, 20)
      .padding(.top, 12)
    }
  }

  private var aiPanelIzuHTE6WZ72Ona: some View {
    HStack(alignment: .center, spacing: 0) {
      VStack(alignment: .leading, spacing: 4) {
        Text("1vADLW9_lv__8j44RA".melyDecoded)
          .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 30))
          .foregroundColor(.white)
          .tracking(-0.6)
        Text("esaJmvA8".melyDecoded)
          .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 30))
          .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
          .shadow(color: Color.white.opacity(0.28), radius: 4, x: 0, y: 2)
      }
      .padding(.top, 13)

      Spacer()

      Button {
        path.append(.aiGuide)
      } label: {
        ZStack(alignment: .center) {
          HStack(spacing: 26) {
            Text("KEs".melyDecoded)
              .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
              .foregroundColor(.black)

            Image(systemName: "l83nDhMMdZS63cY".melyDecoded)
              .font(.subheadline.weight(.semibold))
              .foregroundColor(.black)
          }
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(
            Capsule()
              .fill(Color.white)
          )
          .padding(.top, 80)

          Image("dayanjiqiren")
            .resizable()
            .scaledToFit()
            .frame(width: 90, height: 90)
            .clipShape(Circle())
        }
      }
    }
    .background(
      Image("wangshange")
        .resizable()
        .scaledToFill()
        .padding(.horizontal, 18)
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .padding(.top, 26)
    )
    .padding(.horizontal, 20)
  }

  private var chasudZ6Hxl7WKNHNp: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 8) {
        Text("jKrd8zUlQClVmJDW7lIfQjiM6J_2TAU".melyDecoded)
          .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 26))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .scaledToFit()
          .frame(width: 26, height: 26)
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)

      if Bqk0DhBCQb7eMf.isEmpty {
        HStack {
          Spacer()
          EmptyZhanweiView()
          Spacer()
        }
        .frame(width: .infinity, height: 280)
      } else {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 20) {
            ForEach(Bqk0DhBCQb7eMf) { challenge in
              SzEMlHR6IHY7nGDanca(fttwT1a9WqxBht: challenge) {
                path.append(.challengeDetail(challengeId: challenge.id))
              }
            }
          }
          .padding(.horizontal, 20)
        }
      }

    }
    .padding(.vertical, 12)
  }

}

struct SzEMlHR6IHY7nGDanca: View {
  let fttwT1a9WqxBht: DancozZ6LtwXHtlqPu
  let onJoin: () -> Void

  var body: some View {
    ZStack(alignment: .center) {
      VStack {
        HStack {
          Text(fttwT1a9WqxBht.dTt6Lf2Vb)
            .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
          Spacer()
        }

        Spacer()

        Button(action: onJoin) {
          Text("NVt1mN3N9gdkTUOPusHkH2tS".melyDecoded)
            .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 17))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(
              Capsule()
                .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
            )
        }
        .padding(.horizontal, 12)
        .padding(.bottom, 12)

      }
      .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

    }
    .contentShape(Rectangle())
    .onTapGesture {
      onJoin()
    }
    .buttonStyle(.plain)
    .frame(width: 220, height: 310)
    .background(
      ChabgGBgqmm0onm9Yoy
        .frame(width: 220, height: 310)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    )
    .padding(.top, 16)

  }

  @ViewBuilder
  private var ChabgGBgqmm0onm9Yoy: some View {
    if let ilHG2R0RsLCrkx = fttwT1a9WqxBht.dIn1Xy8Ck {
      ImageLJIzgD4rpc6J6v(resource: .namedOrPath(ilHG2R0RsLCrkx), contentMode: .fill)
    } else {
      kCKHu6rAJ0KJMd
    }
  }

  private var kCKHu6rAJ0KJMd: some View {
    LinearGradient(
      colors: [
        Color(red: 0.4, green: 0.35, blue: 0.6),
        Color(red: 0.25, green: 0.2, blue: 0.45),
      ],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
    .overlay {
      Image(systemName: "5-cBJWl22qjL6iIt".melyDecoded)
        .font(.system(size: 44))
        .foregroundColor(.white.opacity(0.6))
    }
  }
}
