//
//  Vdet7QIifokraIERgO.swift
//  Mely
//
//  Created by MELY on 2026/3/9.
//

import AVKit
import SwiftUI

struct Vdet7QIifokraIERgO: View {
  @Binding var path: [MainRoute]
  let vidVPgbGqZoYamqMK: String

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var HfHdmxBWd72DHk: MelystoreWpvugHy89HDWLR
  @State private var player: AVPlayer?
  @State private var pingvjZzp50mMPqd33t = false
  @State private var jilxbwUBaUit6U: Bool = false
  @State private var qaYgFz3FwQQCSD: Bool = false
  @State private var KJgqXJz5YaoNPA: Bool = false

  private var vd8EcA8JTxeWSBa5: Chalvdngt3SE6MdwaZYu? {
    HfHdmxBWd72DHk.filvdosMDzuiVrv1HceiS.first { $0.id == vidVPgbGqZoYamqMK }
  }

  private var mzoS0e1ggXbSe6: UserteYT4uBeg4ObJP? {
    guard let kktsfI7lH34b3c = vd8EcA8JTxeWSBa5?.vUv6Fr1Qd else { return nil }
    return HfHdmxBWd72DHk.izHqrtotvfHu1g.adUr9Mz3Qc.first { $0.id == kktsfI7lH34b3c }
  }

  private var isEffectivelyLocked: Bool {
    guard let v = vd8EcA8JTxeWSBa5 else { return false }
    return HfHdmxBWd72DHk.isvdoDkAmIFRsnF0ebX(v)
  }

  var body: some View {
    ZStack {
      Color(.black)
        .ignoresSafeArea()

      vdbgq7g8YJNozwC0eY

      VStack(spacing: 0) {
        TopBLMs4aEB1cnGp9bar(
          ttYl57M7uFheos3o: "WWmdrA".melyDecoded,
          onfanGroV0pgM1ABvRj: { dismiss() },
          onLahBc6gaE9DtSKKGe:
            vd8EcA8JTxeWSBa5?.vUv6Fr1Qd != HfHdmxBWd72DHk.curp11O3LYjA9ooct?.id
            ? {
              jilxbwUBaUit6U = true
            } : nil
        )
        .padding(.top, 50)

        Spacer()

        if isEffectivelyLocked {
          lockH2m4MPXNjY4tiU
        } else {
          CxX0fALkRBTPRx
        }

        Spacer()

        qixEH3G6BxwXI6
          .padding(.bottom, 20)
      }
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $jilxbwUBaUit6U,
      isrepppE4EmwOSEs9Cl: $qaYgFz3FwQQCSD,
      onOXhiQzKCNvCvG4Block: {
        if let uid = vd8EcA8JTxeWSBa5?.vUv6Fr1Qd {
          HfHdmxBWd72DHk.boQkspadWNHlX2WBuser(uid: uid)
          path.removeAll()
        }
        jilxbwUBaUit6U = false
      },
      onReportSubmit: { _, _ in }
    )
    .overlay {
      if KJgqXJz5YaoNPA {
        MealrtrV0ruPlF8vL7aYDialog(
          isPresented: $KJgqXJz5YaoNPA,
          txtWMDdTAkCxZULWP: "5RAnU13O58TyAAAZaIek0qAIOARt05XHzQJtUH8qhrvG6Dw3Tn2Zo5PwDj5gOPy46fpFJnV8g-3Z6mIuIBZ-geeMulM_B0WLmdKi".melyDecoded,
          icon3gPZhHp6BTieuR: "kuku3kywiTUzOpQ1",
          isizeWAsPaANiuVvrHe: 52,
          btn4fAFqnYJUrZa1u: "eZy3y8kULg".melyDecoded,
          onConfirm: { path.append(.wallet) }
        )
      }
    }
    .ignoresSafeArea()
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .onAppear { stupamU83wztsTwoB0() }
    .onChange(of: vidVPgbGqZoYamqMK) { _, _ in stupamU83wztsTwoB0() }
    .onDisappear { player?.pause() }
  }

  private func stupamU83wztsTwoB0() {
    player?.pause()
    player = nil
    guard let v = vd8EcA8JTxeWSBa5, !HfHdmxBWd72DHk.isvdoDkAmIFRsnF0ebX(v),
      let n6m38trI7GQiOHo = v.vVn7Px5Lm, !n6m38trI7GQiOHo.isEmpty,
      let url = DmoZw3CI5sd42D(n6m38trI7GQiOHo)
    else { return }
    let p = AVPlayer(url: url)
    player = p
    p.play()
    pingvjZzp50mMPqd33t = true
  }

  private func DmoZw3CI5sd42D(_ n6m38trI7GQiOHo: String) -> URL? {
    if let url = ImgstorehR7h57Xdriq7hH.revdonf2Rh0Pw7AYOOT(n6m38trI7GQiOHo) { return url }
    let p9WdPB2kLOSRLap = n6m38trI7GQiOHo.split(separator: "/").map(String.init)
    let Gs5B9sIjBUu3hd = p9WdPB2kLOSRLap.last ?? n6m38trI7GQiOHo
    let s2ZvgWw2UlnDgzF =
      p9WdPB2kLOSRLap.count > 1 ? p9WdPB2kLOSRLap.dropLast().joined(separator: "/") : nil
    return Bundle.main.url(
      forResource: Gs5B9sIjBUu3hd, withExtension: "E0cp".melyDecoded, subdirectory: s2ZvgWw2UlnDgzF)
      ?? Bundle.main.url(forResource: Gs5B9sIjBUu3hd, withExtension: "E0cp".melyDecoded)
  }

  private var vdbgq7g8YJNozwC0eY: some View {
    Group {
      if let p = player, !isEffectivelyLocked {
        GeometryReader { geo in
          let w = geo.size.width
          let h = geo.size.height
          let videoAspect: CGFloat = 9 / 16
          let XM1NIeM0gi4RvU = w
          let fd2f7bqQ3OJDsb = w / videoAspect
          VideoPlayer(player: p)
            .disabled(true)
            .frame(width: XM1NIeM0gi4RvU, height: fd2f7bqQ3OJDsb)
            .frame(width: w, height: h)
            .clipped()
        }
      } else if let n3zo3pYli9Ow81g = vd8EcA8JTxeWSBa5?.vTn3Hw8Zc, !n3zo3pYli9Ow81g.isEmpty {
        ZStack {
          Rectangle()
            .fill(Color.clear)
            .frame(height: .infinity)
            .frame(maxWidth: .infinity)
            .overlay {
              ImageLJIzgD4rpc6J6v.namedOrPath(n3zo3pYli9Ow81g, placeholder: Image("dengxuanbg"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .blur(radius: isEffectivelyLocked ? 5 : 0)
            }

          Color.black.opacity(isEffectivelyLocked ? 0.5 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .ignoresSafeArea()
  }

  private var lockH2m4MPXNjY4tiU: some View {
    ZStack(alignment: .bottom) {
      Image("apavyrcoicqv_lock")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240)

      Button {
        if HfHdmxBWd72DHk.unlockVideo(videoId: vidVPgbGqZoYamqMK) {
          stupamU83wztsTwoB0()
        } else {
          KJgqXJz5YaoNPA = true
        }
      } label: {
        HStack(spacing: 6) {
          Image("mkirgxytewig_diamond")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
          Text("-\(vd8EcA8JTxeWSBa5?.vUd5Rp2Xy ?? 0)")
            .font(.custom("Hanchansans-Medium", size: 28))
            .foregroundColor(.black)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 2)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(hex: "#CBED40"))
            .shadow(color: .white.opacity(0.5), radius: 20)
        )
      }
      .buttonStyle(.plain)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.bottom, 40)
  }

  private var CxX0fALkRBTPRx: some View {
    Color.clear
      .contentShape(Rectangle())
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .onTapGesture {
        guard let p = player else { return }
        if pingvjZzp50mMPqd33t {
          p.pause()
          pingvjZzp50mMPqd33t = false
        } else {
          p.play()
          pingvjZzp50mMPqd33t = true
        }
      }
      .overlay {
        if !pingvjZzp50mMPqd33t {
          Button {
            guard let p = player else { return }
            p.play()
            pingvjZzp50mMPqd33t = true
          } label: {
            ZStack {
              Circle()
                .fill(.white)
                .frame(width: 70, height: 70)
              Image(systemName: "pLHa9mgmSHeT".melyDecoded)
                .font(.system(size: 32))
                .foregroundStyle(
                  LinearGradient(
                    colors: [
                      Color(hex: "#FF1AB6"),
                      Color(hex: "#CBED40"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                  )
                )
            }
          }

        }
      }
  }

  private var qixEH3G6BxwXI6: some View {
    HStack(spacing: 12) {
      if let mzoS0e1ggXbSe6 {
        Button {
          let uid96ah3MaMgKhpcs = mzoS0e1ggXbSe6.id
          path.append(.userProfile(userId: uid96ah3MaMgKhpcs))
        } label: {
          UAvatHpoJa1igYGVKS7(avatarSymbol: mzoS0e1ggXbSe6.uQd8Nv5tK, size: 54)
            .clipShape(Circle())
            .background(
              Circle()
                .stroke(
                  LinearGradient(
                    colors: [
                      Color(hex: "#FF1AB6"),
                      Color(hex: "#CBED40"),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                  ),
                  lineWidth: 3
                )
                .background(Circle().fill(.ultraThinMaterial))
            )
        }
      }

      if let mzoS0e1ggXbSe6, mzoS0e1ggXbSe6.id != HfHdmxBWd72DHk.curp11O3LYjA9ooct?.id {
        let isFollowingAuthor = HfHdmxBWd72DHk.isfings9wxsR6YeqeKUh(mzoS0e1ggXbSe6.id)
        Button(isFollowingAuthor ? "krLX4yk3SHWY".melyDecoded : "bY-k1t4C".melyDecoded) {
          if isFollowingAuthor {
            HfHdmxBWd72DHk.unfowtfG415dyvn173J(uid: mzoS0e1ggXbSe6.id)
          } else {
            HfHdmxBWd72DHk.fowus97mjk3D9vlxCqB(uid: mzoS0e1ggXbSe6.id)
          }
        }
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.black)
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        .background(
          RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white))
      }

      if let vd8EcA8JTxeWSBa5 {
        let islid9wJOVOoUsCvudK = HfHdmxBWd72DHk.isl2Mk3WADzckzIvN(vd8EcA8JTxeWSBa5.id)
        Button {
          if islid9wJOVOoUsCvudK {
            HfHdmxBWd72DHk.unlctnafBiiyIvDuaBKR(vd8EcA8JTxeWSBa5.id)
          } else {
            HfHdmxBWd72DHk.liekctnfMHSlTReaFYI7V(vd8EcA8JTxeWSBa5.id)
          }
        } label: {
          HStack(spacing: 4) {
            Image(islid9wJOVOoUsCvudK ? "SB1tyFVKKZhI_xinfen" : "SB1tyFVKKZhI_xinhui")
              .resizable()
              .frame(width: 24, height: 24)
            Text(vd8EcA8JTxeWSBa5.likeCountFormatted)
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.black)
          }
        }
        .buttonStyle(.plain)
        .padding(.horizontal, 16)
        .padding(.vertical, 9)
        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(.white))
      }
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 34)
  }
}
