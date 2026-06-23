//
//  CmpodetQpyzEXwp4onYBY.swift
//  Mely
//
//  Created by MELY on 2026/3/6.
//

import SwiftUI

let emjisAHQtz5uCuPbbIu: [String] = [
  "aobfkwhdzahn1", "aobfkwhdzahn2", "aobfkwhdzahn3", "aobfkwhdzahn4", "aobfkwhdzahn5",
  "aobfkwhdzahn6",
]

struct CmpodetQpyzEXwp4onYBY: View {
  @EnvironmentObject private var a0LnGRpMUTEb4cr: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  let pid9gUnNcPrwJPjHW: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var kjnx8Uvi77E48vc: String = ""
  @State private var isEmojiPanelPresented: Bool = false
  @State private var sreN4urCKrhJdenBf: Bool = false
  @State private var srvYYbh6ra6662jjM: Bool = false
  @State private var rtlF2o5WZoMahyXv: String?

  private var popstE9bQRKjoXFrBEr: CPolpIKsl1mUtFVfy? {
    a0LnGRpMUTEb4cr.filpostsyoSdYIQh87ZAr.first(where: { $0.id == pid9gUnNcPrwJPjHW })
  }

  private var aut2tvtfrs6kDO0fY: UserteYT4uBeg4ObJP? {
    guard let userId = popstE9bQRKjoXFrBEr?.pUp4Mx7Cs else { return nil }
    return a0LnGRpMUTEb4cr.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == userId })
  }

  private var stmsAqn6NfSFbApR1C: [CommunityCommentModel] {
    a0LnGRpMUTEb4cr.filcommsaK2Y3ya7K6GDsB(postId: pid9gUnNcPrwJPjHW)
  }

  var body: some View {
    MelyYemianScaffold(
      alignment: .bottom,
      background: {
        Image("kgubofsruboqbg")
          .resizable()
          .ignoresSafeArea()
      }
    ) {
      VStack(spacing: 0) {
        if let popstE9bQRKjoXFrBEr {
          ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
              Rectangle()
                .fill(Color.clear)
                .frame(height: UIScreen.main.bounds.height * 0.5)
                .frame(maxWidth: .infinity)
                .overlay {
                  ImageLJIzgD4rpc6J6v.namedOrPath(popstE9bQRKjoXFrBEr.pIn6Fw1Zd)
                }
                .clipShape(
                  UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 30,
                    bottomTrailingRadius: 30,
                    topTrailingRadius: 0,
                    style: .continuous
                  )
                )
                .ignoresSafeArea()

              athNGt8tfyOeeLaS2(for: popstE9bQRKjoXFrBEr)
                .padding(.horizontal, 20)
              n4PctP54OZhIFy
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 80)
          }
        }
      }
      .ignoresSafeArea(edges: .top)

      VStack {
        TopBLMs4aEB1cnGp9bar(
          ttYl57M7uFheos3o: "",
          onfanGroV0pgM1ABvRj: { dismiss() },
          onLahBc6gaE9DtSKKGe: popstE9bQRKjoXFrBEr?.pUp4Mx7Cs != a0LnGRpMUTEb4cr.curp11O3LYjA9ooct?.id
            ? {
              rtlF2o5WZoMahyXv = popstE9bQRKjoXFrBEr?.pUp4Mx7Cs
              sreN4urCKrhJdenBf = true
            } : nil
        )

        Spacer()
      }

      AurQSBhGhb2mXw

    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $sreN4urCKrhJdenBf,
      isrepppE4EmwOSEs9Cl: $srvYYbh6ra6662jjM,
      onOXhiQzKCNvCvG4Block: {
        let F7A2v4SikT5Qm4 = rtlF2o5WZoMahyXv
        if let uid = F7A2v4SikT5Qm4 {
          a0LnGRpMUTEb4cr.boQkspadWNHlX2WBuser(uid: uid)
          path.removeAll()
        }
        rtlF2o5WZoMahyXv = nil
        sreN4urCKrhJdenBf = false
      },
      onReportSubmit: { _, _ in rtlF2o5WZoMahyXv = nil },
      onCancel: { rtlF2o5WZoMahyXv = nil }
    )
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func athNGt8tfyOeeLaS2(for A3TpMQLtoMUMZp: CPolpIKsl1mUtFVfy) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 10) {
        if let aut2tvtfrs6kDO0fY {
          Circle()
            .fill(Color.white.opacity(0.25))
            .overlay {
              UAvatHpoJa1igYGVKS7(avatarSymbol: aut2tvtfrs6kDO0fY.uQd8Nv5tK, size: 50)
                .clipShape(Circle())
            }
            .frame(width: 50, height: 50)

          VStack(alignment: .leading, spacing: 4) {
            Text(aut2tvtfrs6kDO0fY.uZp7Lm2cR)
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            Text(A3TpMQLtoMUMZp.dateString)
              .font(.custom("Hanchansans-Medium", size: 13))
              .foregroundColor(.white.opacity(0.7))
          }
        }

        Spacer()

        if let aut2tvtfrs6kDO0fY, aut2tvtfrs6kDO0fY.id != a0LnGRpMUTEb4cr.curp11O3LYjA9ooct?.id {
          let isfohW7WBRMEMW7nsb = a0LnGRpMUTEb4cr.isfings9wxsR6YeqeKUh(aut2tvtfrs6kDO0fY.id)
          Button(isfohW7WBRMEMW7nsb ? "Following" : "Follow") {
            if isfohW7WBRMEMW7nsb {
              a0LnGRpMUTEb4cr.unfowtfG415dyvn173J(uid: aut2tvtfrs6kDO0fY.id)
            } else {
              a0LnGRpMUTEb4cr.fowus97mjk3D9vlxCqB(uid: aut2tvtfrs6kDO0fY.id)
            }
          }
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.black)
          .padding(.horizontal, 16)
          .padding(.vertical, 10)
          .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
              .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
          )
        }
      }

      Text(A3TpMQLtoMUMZp.pDs2Hv8Qp)
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)

    }
  }

  private var n4PctP54OZhIFy: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Text("Comments")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 22, height: 22)
      }
      .padding(.bottom, 10)

      if stmsAqn6NfSFbApR1C.isEmpty {
        EmptyZhanweiView()
          .padding(.bottom, 40)
          .frame(width: .infinity, height: .infinity)
      } else {
        ForEach(stmsAqn6NfSFbApR1C) { cm4KBiGtjxqNtPre in
          Cv2JxLMIHCy1Dd(
            JCkEARIElJTIwV: cm4KBiGtjxqNtPre,
            urBVtuqDvvWrViAA: a0LnGRpMUTEb4cr.izHqrtotvfHu1g.adUr9Mz3Qc.first { $0.id == cm4KBiGtjxqNtPre.cmUc6Fr1Qx },
            onqsurdAvUtLC03S: {
              rtlF2o5WZoMahyXv = cm4KBiGtjxqNtPre.cmUc6Fr1Qx
              sreN4urCKrhJdenBf = true
            }
          )
        }
      }
    }
  }

  private var AurQSBhGhb2mXw: some View {
    VStack {
      if isEmojiPanelPresented {
        emojiPanel
          .transition(.move(edge: .bottom))
      }

      HStack(spacing: 12) {
        HStack {
          TextField(
            "",
            text: $kjnx8Uvi77E48vc,
            prompt: Text("Add comment").foregroundColor(Color.gray)
          )
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 16)
          .submitLabel(.done)

          Button {
            sendD3BjXIHOcdGed4()
            UIApplication.shared.sendAction(
              #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
          } label: {
            Image(systemName: "paperplane")
              .font(Font.system(size: 24))
              .foregroundColor(.white)
              .padding(.horizontal, 12)
          }
        }
        .background(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
        .clipShape(Capsule())

        Button {
          withAnimation(.easeInOut(duration: 0.22)) {
            isEmojiPanelPresented.toggle()
          }
        } label: {
          Image(systemName: "face.smiling")
            .font(.system(size: 34))
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 16)
      .padding(.top, 10)
    }
    .background(
      Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255)
        .ignoresSafeArea(edges: .bottom)
    )
  }

  private var emojiPanel: some View {
    HStack(spacing: 16) {
      Spacer()
      ForEach(emjisAHQtz5uCuPbbIu, id: \.self) { VPboxKpPpUzceS in
        Button {
          a0LnGRpMUTEb4cr.adcomTrPX4Y7I4j3Xj0(txtBWCckiMBZeExKZ: VPboxKpPpUzceS, to: pid9gUnNcPrwJPjHW)
          withAnimation(.easeInOut(duration: 0.18)) {
            isEmojiPanelPresented = false
          }
        } label: {
          Image(VPboxKpPpUzceS)
            .resizable()
            .frame(width: 36, height: 36)
        }
      }
    }
    .frame(maxWidth: .infinity)
    .padding(.top, 12)
    .padding(.trailing, 18)
    .background(
      Color(red: 255 / 255, green: 0 / 255, blue: 191 / 255)
        .ignoresSafeArea(edges: .bottom)
    )
  }

  private func sendD3BjXIHOcdGed4() {
    guard !kjnx8Uvi77E48vc.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
    a0LnGRpMUTEb4cr.adcomTrPX4Y7I4j3Xj0(txtBWCckiMBZeExKZ: kjnx8Uvi77E48vc, to: pid9gUnNcPrwJPjHW)
    kjnx8Uvi77E48vc = ""
  }
}

private struct Cv2JxLMIHCy1Dd: View {
  @EnvironmentObject private var a0LnGRpMUTEb4cr: MelystoreWpvugHy89HDWLR
  let JCkEARIElJTIwV: CommunityCommentModel
  let urBVtuqDvvWrViAA: UserteYT4uBeg4ObJP?
  var onqsurdAvUtLC03S: (() -> Void)?

  var body: some View {
    VStack(spacing: 0) {
      HStack(alignment: .top, spacing: 10) {
        Circle()
          .fill(Color.white.opacity(0.25))
          .overlay {
            if let urBVtuqDvvWrViAA {
              UAvatHpoJa1igYGVKS7(avatarSymbol: urBVtuqDvvWrViAA.uQd8Nv5tK, size: 38)
                .clipShape(Circle())
            }
          }
          .frame(width: 38, height: 38)

        VStack(alignment: .leading, spacing: 8) {
          HStack {
            Text(urBVtuqDvvWrViAA?.uZp7Lm2cR ?? "Username")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            Spacer()

            if urBVtuqDvvWrViAA?.id != a0LnGRpMUTEb4cr.curp11O3LYjA9ooct?.id {
              Button {
                onqsurdAvUtLC03S?()
              } label: {
                Image(systemName: "ellipsis")
                  .font(.system(size: 22))
                  .foregroundColor(.white)
                  .frame(width: 28, height: 28)
                  .background(.black.opacity(0.01))
              }
              .buttonStyle(.plain)
            }
          }
          .padding(.bottom, 4)

          if JCkEARIElJTIwV.cmTx3Hv8Pd.hasPrefix("aobfkwhdzahn") {
            Image(JCkEARIElJTIwV.cmTx3Hv8Pd)
              .resizable()
              .frame(width: 36, height: 36)
          } else {
            Text(JCkEARIElJTIwV.cmTx3Hv8Pd)
              .font(.subheadline)
              .foregroundColor(.white)
              .fixedSize(horizontal: false, vertical: true)
          }

          Text(JCkEARIElJTIwV.dateString)
            .font(.custom("Hanchansans-Medium", size: 13))
            .foregroundColor(.white.opacity(0.6))
        }
        .padding(.top, 6)
      }

      Divider()
        .background(Color.white)
        .padding(.top, 16)
        .padding(.bottom, 6)
    }
  }
}
