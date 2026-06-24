//
//  Msg3ouu3bzLmqsqmr.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

struct Msg3ouu3bzLmqsqmr: View {
  @EnvironmentObject private var qCY5SApnxN3jJs: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 12) {
        HStack {
          Button {
            dismiss.callAsFunction()
          } label: {
            Image(systemName: "4uYDJml8muLG4Sc8".melyDecoded)
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(.white)
              .clipShape(Circle())
          }
          Spacer()
          Text("d5aq3sEBJg".melyDecoded)
            .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 22))
            .foregroundColor(.white)
          Spacer()
          Color.clear
            .frame(width: 44, height: 44)
        }
        .padding(.horizontal, 20)

        if qCY5SApnxN3jJs.filcvrsKNV3sVIZ1SzZc9.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .padding(.bottom, 60)
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView {
            LazyVStack(spacing: 20) {
              ForEach(qCY5SApnxN3jJs.filcvrsKNV3sVIZ1SzZc9) { conversation in
                NavigationLink {
                  ChadetliLsrfCbqFVharView(path: $path, ihcqcoxwUEDEh7cid: conversation.id)
                } label: {
                  CharowstHKBKlBP88qUb(
                    titkoGnF7OOqdabOR: ke6OUBiuc2OndD(for: conversation),
                    preview: chapreIhfmVvxl8JiwmI(for: conversation),
                    zthZR1W0C0cRru: ctxtMhmmQgg0biZzz1(for: conversation),
                    ikmTo3cP78CDdQ: PQZdvKjHcxhWG0(for: conversation),
                    RXNxzqgMa83k4i: FLPFYUXVtUX4tU(for: conversation)
                  )
                }
                .buttonStyle(.plain)
              }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 24)
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func ke6OUBiuc2OndD(for wlJ0cqHfjxflsJ: Convs8RlUjf8GEZRmYA) -> String {
    guard let O6zjIRtQozXnhC = qCY5SApnxN3jJs.izHqrtotvfHu1g.adCu1Zp6Hm else { return "Sm6PrA".melyDecoded }
    let EY84NKm9gJnloO = wlJ0cqHfjxflsJ.cPu3Ks1Zx.first { $0 != O6zjIRtQozXnhC }
    guard let id = EY84NKm9gJnloO,
      let PFEvCiKkSfzDPE = qCY5SApnxN3jJs.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == id })
    else {
      return "Sm6PrA".melyDecoded
    }
    return PFEvCiKkSfzDPE.uZp7Lm2cR
  }

  private func FLPFYUXVtUX4tU(for wlJ0cqHfjxflsJ: Convs8RlUjf8GEZRmYA) -> String {
    guard let ZxRvYgq14SXfb3 = qCY5SApnxN3jJs.izHqrtotvfHu1g.adCu1Zp6Hm else {
      return "uqbb7j84HWpjlo6b6BsuSTWFqpzxRww".melyDecoded
    }
    let uINMke5XQTYB3P = wlJ0cqHfjxflsJ.cPu3Ks1Zx.first { $0 != ZxRvYgq14SXfb3 }
    guard let id = uINMke5XQTYB3P,
      let PFEvCiKkSfzDPE = qCY5SApnxN3jJs.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == id })
    else {
      return "mely_defava"
    }
    return PFEvCiKkSfzDPE.uQd8Nv5tK
  }

  private func chapreIhfmVvxl8JiwmI(for wlJ0cqHfjxflsJ: Convs8RlUjf8GEZRmYA) -> String {
    guard let l139b5uF0HY6VzB = lastMessage(for: wlJ0cqHfjxflsJ) else {
      return ""
    }
    return wFVktPqPu6Jd1m(for: l139b5uF0HY6VzB)
  }

  private func ctxtMhmmQgg0biZzz1(for c0efCname0MazrM: Convs8RlUjf8GEZRmYA) -> String {
    let l139b5uF0HY6VzB = lastMessage(for: c0efCname0MazrM)
    guard let d5gJ6dwr7QcwrIy = l139b5uF0HY6VzB?.mCt7He4Jn else { return "jbjI-yMyRXqG".melyDecoded }
    let cal = Calendar.current
    if cal.isDateInYesterday(d5gJ6dwr7QcwrIy) { return "jbjI-yMyRXqG".melyDecoded }
    if cal.isDateInToday(d5gJ6dwr7QcwrIy) { return "TH6bqvs".melyDecoded }
    let f = DateFormatter()
    f.dateFormat = "VVzQr-Y".melyDecoded
    return f.string(from: d5gJ6dwr7QcwrIy)
  }

  private func PQZdvKjHcxhWG0(for k6suW3U2lkPUxD: Convs8RlUjf8GEZRmYA) -> Int {
    guard let fkXTusfsBWJCDO = qCY5SApnxN3jJs.izHqrtotvfHu1g.adCu1Zp6Hm else { return 0 }
    return k6suW3U2lkPUxD.cUc2Yp5Hd[fkXTusfsBWJCDO] ?? 0
  }

  private func lastMessage(for k6suW3U2lkPUxD: Convs8RlUjf8GEZRmYA) -> MSgOumAbwJ0MP1dZO? {
    qCY5SApnxN3jJs.izHqrtotvfHu1g.adMs8Lw4Ty
      .filter { $0.mCv4Ne9Hr == k6suW3U2lkPUxD.id }
      .sorted(by: { $0.mCt7He4Jn < $1.mCt7He4Jn })
      .last
  }

  private func wFVktPqPu6Jd1m(for VgNMKydK226one: MSgOumAbwJ0MP1dZO) -> String {
    switch VgNMKydK226one.mTy9Gh1Qb {
    case .emoji:
      return "Yba0wsoPHg".melyDecoded
    case .voice:
      return "YaW2xMMDHg".melyDecoded
    case .image:
      return "Ybq0zMcDHg".melyDecoded
    case .text:

      let trimmed = VgNMKydK226one.mTx2Fp8Vc.trimmingCharacters(in: .whitespacesAndNewlines)
      return trimmed.isEmpty ? "" : trimmed
    }
  }
}

struct CharowstHKBKlBP88qUb: View {
  let titkoGnF7OOqdabOR: String
  let preview: String
  let zthZR1W0C0cRru: String
  let ikmTo3cP78CDdQ: Int
  let RXNxzqgMa83k4i: String

  var body: some View {
    HStack(spacing: 12) {
      avatar

      VStack(alignment: .leading, spacing: 6) {
        Text(titkoGnF7OOqdabOR)
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)

        Text(preview)
          .font(.system(size: 13, weight: .regular))
          .foregroundColor(.gray)
          .lineLimit(1)
      }

      Spacer(minLength: 10)

      VStack(alignment: .trailing, spacing: 10) {
        Text(zthZR1W0C0cRru)
          .font(.system(size: 12, weight: .regular))
          .foregroundColor(.gray)

        if ikmTo3cP78CDdQ > 0 {
          Text("\(ikmTo3cP78CDdQ)")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 22, height: 22)
            .background(.black)
            .clipShape(Circle())
        }
      }
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 14)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
  }

  private var avatar: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [.pink.opacity(0.5), .purple.opacity(0.5)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .frame(width: 46, height: 46)

      UAvatHpoJa1igYGVKS7(avatarSymbol: RXNxzqgMa83k4i, size: 46)
    }
  }
}

struct Bg75AXIQ8yB32fx5: View {
  var body: some View {
    ZStack(alignment: .bottom) {
      LinearGradient(
        colors: [
          Color(red: 0.26, green: 0.52, blue: 0.34).opacity(0.95),
          Color(red: 0.10, green: 0.20, blue: 0.35).opacity(0.98),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )

      GrdveabuDTEHnPTCf()
        .frame(height: 260)
        .opacity(0.55)
    }
  }
}

struct GrdveabuDTEHnPTCf: View {
  var body: some View {
    GeometryReader { mhF8IxZkDeHaTm in
      let w = mhF8IxZkDeHaTm.size.width
      let h = mhF8IxZkDeHaTm.size.height

      Canvas { ctx, _ in
        var QIuDS5pmKcXmnU = Path()

        let stepX: CGFloat = 26
        let stepY: CGFloat = 18

        var x: CGFloat = 0
        while x <= w {
          QIuDS5pmKcXmnU.move(to: CGPoint(x: x, y: 0))
          QIuDS5pmKcXmnU.addLine(to: CGPoint(x: x, y: h))
          x += stepX
        }

        var y: CGFloat = 0
        while y <= h {
          QIuDS5pmKcXmnU.move(to: CGPoint(x: 0, y: y))
          QIuDS5pmKcXmnU.addLine(to: CGPoint(x: w, y: y))
          y += stepY
        }

        ctx.stroke(QIuDS5pmKcXmnU, with: .color(.white.opacity(0.22)), lineWidth: 1)
      }
      .background(
        LinearGradient(
          colors: [.clear, .black.opacity(0.35)],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .mask(
        LinearGradient(
          colors: [.clear, .white, .white],
          startPoint: .top,
          endPoint: .bottom
        )
      )
    }
  }
}
