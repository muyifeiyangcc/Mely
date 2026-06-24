//
//  ChalldetNy2W04sqZPngXv.swift
//  Mely
//
//  Created by MELY on 2026/3/6.
//

import SwiftUI

struct ChalldetNy2W04sqZPngXv: View {
  @Binding var path: [MainRoute]
  let chaidPpqAXLyzYjD1D7: String

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var IhREo9o7adNPCE: MelystoreWpvugHy89HDWLR

  @State private var XlGSuBRPSqVSKS: Bool = false
  @State private var sPE9jOtbIwmwn9i: Bool = false

  private var chaVbvERU1wSjPLlM: DancozZ6LtwXHtlqPu? {
    IhREo9o7adNPCE.filchasD9OgZwYuwgrF4I.first { $0.id == chaidPpqAXLyzYjD1D7 }
  }

  private var vdsHD4xmRgUomBTHI: [Chalvdngt3SE6MdwaZYu] {
    IhREo9o7adNPCE.filvdosMDzuiVrv1HceiS.filter { $0.vCh4Ne7Lp == chaidPpqAXLyzYjD1D7 }
  }

  private let i0NhJjfcOvitfc = LinearGradient(
    colors: [
      Color(red: 0.35, green: 0.85, blue: 0.5),
      Color(red: 0.2, green: 0.35, blue: 0.6),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  private let w5VWWvySzdSNsj = LinearGradient(
    colors: [
      Color(red: 0.6, green: 0.35, blue: 0.75),
      Color(red: 0.85, green: 0.4, blue: 0.65),
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )

  var body: some View {
    MelyYemianScaffold(
      background: {
        Image("kgubofsruboqbg")
          .resizable()
          .ignoresSafeArea()
      }
    ) {
      VStack(spacing: 0) {
        TopBLMs4aEB1cnGp9bar(
          ttYl57M7uFheos3o: "",
          onfanGroV0pgM1ABvRj: { dismiss() },
          onLahBc6gaE9DtSKKGe:
            chaVbvERU1wSjPLlM?.dUr4Mp7Ks != IhREo9o7adNPCE.curp11O3LYjA9ooct?.id
            ? {
              XlGSuBRPSqVSKS = true
            } : nil
        )

        tc3CE2WjgJYnihFi

        if vdsHD4xmRgUomBTHI.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView {
            vdgkb88k6bpPjTrPW
              .padding(.horizontal, 16)
              .padding(.vertical, 16)
          }
        }

        jbnsMQUpBOXIP6Rk

      }
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $XlGSuBRPSqVSKS,
      isrepppE4EmwOSEs9Cl: $sPE9jOtbIwmwn9i,
      onOXhiQzKCNvCvG4Block: {
        if let uid = chaVbvERU1wSjPLlM?.dUr4Mp7Ks {
          IhREo9o7adNPCE.boQkspadWNHlX2WBuser(uid: uid)
          path.removeAll()
        }
        XlGSuBRPSqVSKS = false
      },
      onReportSubmit: { _, _ in }
    )
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var tc3CE2WjgJYnihFi: some View {
    ZStack(alignment: .topTrailing) {
      Image("oxboyzczatlm")
        .resizable()
        .padding(.horizontal, 20)
        .padding(.top, 30)

      Image("bvvlvztdgkru_shandian")
        .resizable()
        .frame(width: 100, height: 100)
        .padding(.trailing, 16)

      VStack {
        if let c0Q1aoGq7BpDKpL = chaVbvERU1wSjPLlM {
          HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
              Text(c0Q1aoGq7BpDKpL.dTt6Lf2Vb)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24).bold())
                .foregroundColor(.white)
              Text(
                c0Q1aoGq7BpDKpL.dDe8Av3Jr
              )
              .lineLimit(2)
              .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 16))
              .foregroundColor(.white.opacity(0.8))

              Image("eaynmjbwgatf_star")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 16)
            }
            .padding(.leading, 16)

            Spacer()
          }
          .padding(.horizontal, 20)
        }
      }
      .padding(.top, 50)
    }
    .frame(width: .infinity, height: 210)
  }

  private var vdgkb88k6bpPjTrPW: some View {
    let ESjOWgd6dJ1URq: CGFloat = 12
    let UaFT0bosdf7ShR = [
      GridItem(.flexible(minimum: 0), spacing: ESjOWgd6dJ1URq, alignment: .top),
      GridItem(.flexible(minimum: 0), spacing: ESjOWgd6dJ1URq, alignment: .top),
      GridItem(.flexible(minimum: 0), spacing: ESjOWgd6dJ1URq, alignment: .top),
    ]
    return LazyVGrid(columns: UaFT0bosdf7ShR, spacing: ESjOWgd6dJ1URq) {
      ForEach(vdsHD4xmRgUomBTHI) { video in
        Button {
          path.append(.videoDetail(videoId: video.id))
        } label: {
          ChelvdFnCTXHTDKfpcAZ(
            vdWnKjZvB0CkeOuu: video,
            islocujnG3ShBcnSQLM: IhREo9o7adNPCE.isvdoDkAmIFRsnF0ebX(video)
          )
          .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.vertical, 8)
  }

  private var jbnsMQUpBOXIP6Rk: some View {
    Button {
      path.append(.uploadVideo(challengeId: chaidPpqAXLyzYjD1D7))
    } label: {
      Text("NVt1mN3N9gdkTUOPusHkH2tS".melyDecoded)
        .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 20))
        .foregroundColor(.black)
        .frame(width: 250)
        .padding(.vertical, 15)
        .background(
          Capsule()
            .fill(Color(red: 203 / 255, green: 237 / 255, blue: 64 / 255))
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 20)
    .padding(.bottom, 14)
  }
}

struct ChelvdFnCTXHTDKfpcAZ: View {
  let vdWnKjZvB0CkeOuu: Chalvdngt3SE6MdwaZYu
  let islocujnG3ShBcnSQLM: Bool
  private let pFGGBAcxY8aBC3: CGFloat = 142
  private let tabBpm3EqvNMty: CGFloat = 188

  var body: some View {
    VStack(alignment: .leading, spacing: 3) {
      ZStack(alignment: .center) {
        thumbuvoytZtTw4jbFp
        if islocujnG3ShBcnSQLM {
          locedkbWuttmZFNjflX
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: pFGGBAcxY8aBC3)
      .clipShape(
        UnevenRoundedRectangle(
          topLeadingRadius: 16,
          bottomLeadingRadius: 0,
          bottomTrailingRadius: 0,
          topTrailingRadius: 16,
          style: .continuous
        )
      )

      HStack(spacing: 4) {
        Image("SB1tyFVKKZhI_xinfen")
          .resizable()
          .frame(width: 22, height: 22)
        Text(vdWnKjZvB0CkeOuu.likeCountFormatted)
          .font(.system(size: 13))
          .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
      }
      .padding(.top, 4)
      .padding(.bottom, 6)
      .padding(.horizontal, 8)
    }
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    .frame(height: tabBpm3EqvNMty, alignment: .top)
  }

  private var thumbuvoytZtTw4jbFp: some View {
    Group {
      if let nRFyNV0VP8Qx3p = vdWnKjZvB0CkeOuu.vTn3Hw8Zc, !nRFyNV0VP8Qx3p.isEmpty {
        ImageLJIzgD4rpc6J6v.namedOrPath(nRFyNV0VP8Qx3p, placeholder: Image("dengxuanbg"))
          .scaledToFill()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .clipped()
      } else {
        Color(red: 0.2, green: 0.2, blue: 0.3)
      }
    }
    .blur(radius: islocujnG3ShBcnSQLM ? 4 : 0)
  }

  private var locedkbWuttmZFNjflX: some View {
    HStack(spacing: 4) {
      Image("mkirgxytewig_diamond")
        .resizable()
        .frame(width: 20, height: 20)
      Text("-\(vdWnKjZvB0CkeOuu.vUd5Rp2Xy ?? 0)")
        .font(.custom("Hanchansans-Medium", size: 14))
        .foregroundColor(.white)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 5)
    .background(
      Capsule().fill(Color.black.opacity(0.5))
    )
  }
}
