//
//  CmntzhkG2J7gRwrRiEPo.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

struct CmntzhkG2J7gRwrRiEPo: View {
  @EnvironmentObject private var khmk7UUVVzV8xH: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  @State private var zcJNTu6a7JPrLC: Bool = false
  @State private var spr44uyrds8ry9hQ7: Bool = false
  @State private var tQfoEOpaMcxjHg: String?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let AAoY4jFg3z1T8z: [Color] = [
    Color(hex: "#CBED40"),
    Color(red: 0.95, green: 0.85, blue: 0.4),
    Color(red: 0.4, green: 0.6, blue: 0.95),
  ]

  var body: some View {
    MelyYemianScaffold {
      VStack {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(Circle().fill(Color.white))
          }
          Spacer()

          Text("Circle Square")
            .font(.custom("Hanchansans-Medium", size: 24))
            .foregroundColor(.white)
          Spacer()

          Button {
            path.append(.communityPostCreate)
          } label: {
            Image("xieqingadd")
              .resizable()
              .frame(width: 44, height: 44)
          }
        }
        .padding(.horizontal, 20)

        if khmk7UUVVzV8xH.filpostsyoSdYIQh87ZAr.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .frame(width: .infinity, height: .infinity)
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 20) {
              ForEach(khmk7UUVVzV8xH.filpostsyoSdYIQh87ZAr) { xYqmINSjRpX0KJ in
                CpaMpDIlzProK1ZOA(
                  path: $path,
                  pofZkHvcyDiX6dl9: xYqmINSjRpX0KJ,
                  o4d7Zwj7OPRoJi: khmk7UUVVzV8xH.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: {
                    $0.id == xYqmINSjRpX0KJ.pUp4Mx7Cs
                  }),
                  AAoY4jFg3z1T8z: AAoY4jFg3z1T8z,
                  oncrdg8A3Ophqze7d40: {
                    path.append(.communityPostDetail(postId: xYqmINSjRpX0KJ.id))
                  },
                  onmoZW5XXOjPHYeRXv: {
                    tQfoEOpaMcxjHg = xYqmINSjRpX0KJ.pUp4Mx7Cs
                    zcJNTu6a7JPrLC = true
                  }
                )
              }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 32)
          }
        }
      }
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $zcJNTu6a7JPrLC,
      isrepppE4EmwOSEs9Cl: $spr44uyrds8ry9hQ7,
      onOXhiQzKCNvCvG4Block: {
        if let uid = tQfoEOpaMcxjHg {
          khmk7UUVVzV8xH.boQkspadWNHlX2WBuser(uid: uid)
          path.removeAll()
        }
        tQfoEOpaMcxjHg = nil
        zcJNTu6a7JPrLC = false
      },
      onReportSubmit: { _, _ in tQfoEOpaMcxjHg = nil },
      onCancel: { tQfoEOpaMcxjHg = nil }
    )
    .navigationBarBackButtonHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }
}

struct CpaMpDIlzProK1ZOA: View {
  @EnvironmentObject private var khmk7UUVVzV8xH: MelystoreWpvugHy89HDWLR
  @Binding var path: [MainRoute]
  let pofZkHvcyDiX6dl9: CPolpIKsl1mUtFVfy
  let o4d7Zwj7OPRoJi: UserteYT4uBeg4ObJP?
  let AAoY4jFg3z1T8z: [Color]
  var oncrdg8A3Ophqze7d40: (() -> Void)?
  var onmoZW5XXOjPHYeRXv: (() -> Void)?

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      HStack(alignment: .center, spacing: 10) {
        Circle()
          .fill(Color.white.opacity(0.25))
          .overlay {
            if let Znwn0sVRbR2wTI = o4d7Zwj7OPRoJi {
              Button {
                path.append(.userProfile(userId: Znwn0sVRbR2wTI.id))
              } label: {
                UAvatHpoJa1igYGVKS7(avatarSymbol: Znwn0sVRbR2wTI.uQd8Nv5tK, size: 40)
                  .clipShape(Circle())
              }
              .buttonStyle(.plain)
            }
          }
          .frame(width: 40, height: 40)

        VStack(alignment: .leading, spacing: 2) {
          Text(o4d7Zwj7OPRoJi?.uZp7Lm2cR ?? "User")
            .font(.subheadline.weight(.medium))
            .foregroundColor(.white)
          Text(pofZkHvcyDiX6dl9.dateString)
            .font(.caption)
            .foregroundColor(.white.opacity(0.7))
        }

        Spacer()

        if o4d7Zwj7OPRoJi?.id != khmk7UUVVzV8xH.curp11O3LYjA9ooct?.id {
          Button {
            onmoZW5XXOjPHYeRXv?()
          } label: {
            Image(systemName: "ellipsis")
              .font(.body.weight(.medium))
              .foregroundColor(.white)
              .frame(width: 30, height: 30)
              .background(.black.opacity(0.01))
          }
          .buttonStyle(.plain)
        }
      }
      .padding(.horizontal, 12)
      .padding(.top, 12)
      .padding(.bottom, 10)

      Group {
        Rectangle()
          .fill(Color.clear)
          .frame(height: 280)
          .frame(maxWidth: .infinity)
          .overlay {
            ImageLJIzgD4rpc6J6v.namedOrPath(pofZkHvcyDiX6dl9.pIn6Fw1Zd)
          }
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .padding(.horizontal, 12)

        HStack(alignment: .center, spacing: 10) {
          HStack(spacing: 8) {
            ForEach(Array(pofZkHvcyDiX6dl9.pTg7Rx5Bn.enumerated()), id: \.offset) { index, tag in
              Text(tag)
                .font(.custom("Hanchansans-Medium", size: 14))
                .foregroundColor(.black)
                .lineLimit(1)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                  RoundedRectangle(cornerRadius: 8).fill(
                    AAoY4jFg3z1T8z[index % AAoY4jFg3z1T8z.count])
                )
            }

            Text(pofZkHvcyDiX6dl9.pDs2Hv8Qp)
              .font(.custom("Hanchansans-Medium", size: 14))
              .foregroundColor(.white)
              .lineLimit(1)
              .padding(.horizontal, 3)
          }

          Spacer()

          HStack(spacing: 16) {
            Button {
            } label: {
              HStack(spacing: 4) {
                Image("j3MSKYctddao_lunp")
                  .resizable()
                  .frame(width: 20, height: 20)
                if pofZkHvcyDiX6dl9.pCc8Jt4Vm > 0 {
                  Text("\(pofZkHvcyDiX6dl9.pCc8Jt4Vm)")
                    .font(.custom("Hanchansans-Medium", size: 13))
                }
              }
              .foregroundColor(.primary)
            }

            Button {
              if khmk7UUVVzV8xH.isl2Mk3WADzckzIvN(pofZkHvcyDiX6dl9.id) {
                khmk7UUVVzV8xH.unlctnafBiiyIvDuaBKR(pofZkHvcyDiX6dl9.id)
              } else {
                khmk7UUVVzV8xH.liekctnfMHSlTReaFYI7V(pofZkHvcyDiX6dl9.id)
              }
            } label: {
              HStack(spacing: 4) {
                Image(
                  khmk7UUVVzV8xH.isl2Mk3WADzckzIvN(pofZkHvcyDiX6dl9.id)
                    ? "n0d7NjDl3Zun_zanfen" : "n0d7NjDl3Zun_zanhei"
                )
                .resizable()
                .frame(width: 20, height: 20)
              }
              .foregroundColor(
                khmk7UUVVzV8xH.isl2Mk3WADzckzIvN(pofZkHvcyDiX6dl9.id)
                  ? Color(red: 1, green: 0.4, blue: 0.55) : .primary)
            }
            .buttonStyle(.plain)
          }
          .padding(.horizontal, 14)
          .padding(.vertical, 7)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .fill(Color.white)
          )
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, 12)
      }
      .contentShape(Rectangle())
      .onTapGesture {
        oncrdg8A3Ophqze7d40?()
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
        .stroke(Color.white.opacity(0.5), lineWidth: 1)
    )
  }
}
