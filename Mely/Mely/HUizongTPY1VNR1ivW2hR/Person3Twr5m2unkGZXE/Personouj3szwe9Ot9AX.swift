//
//  Personouj3szwe9Ot9AX.swift
//  Mely
//
//  Created by MELY on 2026/3/5.
//

import SwiftUI

struct Personouj3szwe9Ot9AX: View {
  @EnvironmentObject private var KEVEKJrKGZLAbj: MelystoreWpvugHy89HDWLR
  @Environment(\.presentationMode) var q55RO0d3zIqjtb
  @Binding var path: [MainRoute]

  var EoseNHMco4sgRUuid: String? = nil

  private var taruid2Sg5sI6pldAN9X: String? {
    EoseNHMco4sgRUuid ?? KEVEKJrKGZLAbj.curp11O3LYjA9ooct?.id
  }

  private var iscurEBkozQ20RhjLpi: Bool {
    guard let L87hYUrRiqE1D1 = KEVEKJrKGZLAbj.curp11O3LYjA9ooct?.id,
      let target = taruid2Sg5sI6pldAN9X
    else {
      return false
    }
    return L87hYUrRiqE1D1 == target
  }

  private var RgXM4H9N7aFqvk: UserteYT4uBeg4ObJP? {
    guard let UnaEEIAkzIgnBi = taruid2Sg5sI6pldAN9X else { return nil }
    return KEVEKJrKGZLAbj.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == UnaEEIAkzIgnBi })
  }

  private var p3nTYYmHTquNBDx: [CPolpIKsl1mUtFVfy] {
    guard let UnaEEIAkzIgnBi = taruid2Sg5sI6pldAN9X else { return [] }
    return KEVEKJrKGZLAbj.filpostsyoSdYIQh87ZAr.filter { $0.pUp4Mx7Cs == UnaEEIAkzIgnBi }
  }

  private let tg9POrJX0sSTURuL: [Color] = [
    Color(hex: "#CBED40"),
    Color(red: 0.95, green: 0.85, blue: 0.4),
    Color(red: 0.4, green: 0.6, blue: 0.95),
  ]

  @State private var bbIuOsWNXLbj56: Bool = false
  @State private var iUwnZ8tkYHln8b: Bool = false

  var body: some View {
    MelyYemianScaffold(alignment: .top) {
      ScrollView {
        VStack(spacing: 0) {
          gOHPU0oPZ33K9X
          B82tyTlYhPP59V
          if p3nTYYmHTquNBDx.isEmpty {
            VStack {
              Spacer()
              EmptyZhanweiView()
              Spacer()
            }
            .frame(width: .infinity, height: 300)
          } else {
            pliRtpOcmx9Pi126V
          }
        }
      }
      .ignoresSafeArea(edges: .top)

      HStack {
        Button(action: {
          q55RO0d3zIqjtb.wrappedValue.dismiss()
        }) {
          Image(systemName: "4uYDJml8muLG4Sc8".melyDecoded)
            .font(.system(size: 18))
            .foregroundColor(.black)
            .frame(width: 44, height: 44)
            .background(Circle().fill(Color.white))
        }

        Spacer()

        if iscurEBkozQ20RhjLpi {
          Button(action: {
            path.append(.settings)
          }) {
            Image(systemName: "s7ja_TUoQGua".melyDecoded)
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(Circle().fill(Color.white))
          }
        } else {
          Button(action: {
            bbIuOsWNXLbj56 = true
          }) {
            Image(systemName: "oK7G9SckWXs".melyDecoded)
              .font(.system(size: 20, weight: .bold))
              .foregroundColor(.black)
              .padding(18)
              .background(Circle().fill(Color.white))
          }
        }
      }
      .padding(.horizontal, 20)
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $bbIuOsWNXLbj56,
      isrepppE4EmwOSEs9Cl: $iUwnZ8tkYHln8b,
      onOXhiQzKCNvCvG4Block: {
        if let uid = taruid2Sg5sI6pldAN9X {
          KEVEKJrKGZLAbj.boQkspadWNHlX2WBuser(uid: uid)
          path.removeAll()
        }
        bbIuOsWNXLbj56 = false
      },
      onReportSubmit: { _, _ in }
    )
    .navigationBarHidden(true)
  }

  private var gOHPU0oPZ33K9X: some View {
    ZStack(alignment: .bottom) {
      ImageLJIzgD4rpc6J6v.namedOrPath(
        RgXM4H9N7aFqvk?.uQd8Nv5tK ?? "mely_defava", placeholder: Image("mely_defava")
      )
      .frame(maxWidth: .infinity)
      .frame(height: 300)
      .clipped()
      .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
      .ignoresSafeArea()

      LinearGradient(
        gradient: Gradient(colors: [Color.clear, Color(hex: "#FF1AB6")]),
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(height: 300)
      .cornerRadius(40, corners: [.bottomLeft, .bottomRight])

      VStack(spacing: 16) {
        HStack(spacing: 16) {
          ZStack {
            Circle()
              .stroke(Color.white.opacity(0.5), lineWidth: 2)
              .frame(width: 94, height: 94)

            UAvatHpoJa1igYGVKS7(avatarSymbol: RgXM4H9N7aFqvk?.uQd8Nv5tK ?? "mely_defava", size: 80)
              .overlay(Circle().stroke(Color.white, lineWidth: 2))
          }

          HStack(spacing: 20) {
            Text(RgXM4H9N7aFqvk?.uZp7Lm2cR ?? "XHWLqg".melyDecoded)
              .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
              .foregroundColor(.white)

            if !iscurEBkozQ20RhjLpi {
              Button {
                guard let otherId = taruid2Sg5sI6pldAN9X,
                  let convId = KEVEKJrKGZLAbj.getOrCreateConversation(with: otherId)
                else { return }
                path.append(.chatDetail(conversationId: convId))
              } label: {
                Image(systemName: "9fcBJmZjlbqV9Tk3TQ".melyDecoded)
                  .foregroundColor(.black)
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .background(
                    Rectangle().fill(Color.white).cornerRadius(
                      16, corners: .allCorners))
              }
            }
          }

          Spacer()
        }
        .padding(.horizontal, 20)

        HStack(spacing: 0) {
          HStack(spacing: 20) {
            if iscurEBkozQ20RhjLpi {
              Button {
                path.append(.userList(.fwhRmiekN92I0G5h))
              } label: {
                VStack(spacing: 4) {
                  Text("\(RgXM4H9N7aFqvk?.uFm7Xr8Lp.count ?? 0)")
                    .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                    .foregroundColor(.white)
                  Text("krLX4yk3RGmM".melyDecoded)
                    .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 14))
                    .foregroundColor(.white.opacity(0.7))
                }
              }
              .buttonStyle(.plain)

              Rectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 2, height: 26)

              Button {
                path.append(.userList(.foMMHt0OAJAUpn9v))
              } label: {
                VStack(spacing: 4) {
                  Text("\(RgXM4H9N7aFqvk?.uFn3Te6Qb.count ?? 0)")
                    .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                    .foregroundColor(.white)
                  Text("krLX4yk3SHWY".melyDecoded)
                    .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 14))
                    .foregroundColor(.white.opacity(0.7))
                }
              }
              .buttonStyle(.plain)
            } else {
              VStack(spacing: 4) {
                Text("\(RgXM4H9N7aFqvk?.uFm7Xr8Lp.count ?? 0)")
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                  .foregroundColor(.white)
                Text("krLX4yk3RGmM".melyDecoded)
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 14))
                  .foregroundColor(.white.opacity(0.7))
              }

              Rectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 2, height: 26)

              VStack(spacing: 4) {
                Text("\(RgXM4H9N7aFqvk?.uFn3Te6Qb.count ?? 0)")
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                  .foregroundColor(.white)
                Text("krLX4yk3SHWY".melyDecoded)
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 14))
                  .foregroundColor(.white.opacity(0.7))
              }
            }
          }

          Spacer()

          if iscurEBkozQ20RhjLpi {
            Button(action: { path.append(.wallet) }) {
              HStack {
                Image("mkirgxytewig_diamond")
                  .resizable()
                  .frame(width: 24, height: 24)
                  .foregroundColor(.blue)
                Text("\(RgXM4H9N7aFqvk?.uDg2Jy5Wx ?? 0)")
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                  .foregroundColor(.black)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 11)
              .background(Color(hex: "#CBED40"))
              .cornerRadius(20)
            }
          } else {
            let isfo4hwjh4tl3l0K0k =
              (taruid2Sg5sI6pldAN9X.map { KEVEKJrKGZLAbj.isfings9wxsR6YeqeKUh($0) } ?? false)
            Button(action: {
              guard let uid = taruid2Sg5sI6pldAN9X else { return }
              if isfo4hwjh4tl3l0K0k {
                KEVEKJrKGZLAbj.unfowtfG415dyvn173J(uid: uid)
              } else {
                KEVEKJrKGZLAbj.fowus97mjk3D9vlxCqB(uid: uid)
              }
            }) {
              Text(isfo4hwjh4tl3l0K0k ? "krLX4yk3SHWY".melyDecoded : "bY-k1t4C".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 17))
                .foregroundColor(.black)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(Color(hex: "#CBED40"))
                .cornerRadius(12)
            }
          }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 30)
      }
    }
  }

  private var B82tyTlYhPP59V: some View {
    HStack {
      Text("WWmdrA".melyDecoded)
        .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
        .foregroundColor(.white)

      Image("eaynmjbwgatf_star")
        .resizable()
        .frame(width: 24, height: 24)
      Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.top, 20)
    .padding(.bottom, 20)
  }

  private var pliRtpOcmx9Pi126V: some View {
    LazyVStack(spacing: 20) {
      ForEach(p3nTYYmHTquNBDx) { post in
        NavigationLink(value: MainRoute.communityPostDetail(postId: post.id)) {
          CpaMpDIlzProK1ZOA(
            path: $path,
            pofZkHvcyDiX6dl9: post,
            o4d7Zwj7OPRoJi: KEVEKJrKGZLAbj.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: {
              $0.id == post.pUp4Mx7Cs
            }
            ),
            AAoY4jFg3z1T8z: tg9POrJX0sSTURuL
          )
        }
        .buttonStyle(.plain)
      }
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 100)
  }
}

extension View {
  func cornerRadius(_ ouj3szwe9Ot9AX: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: ouj3szwe9Ot9AX, corners: corners))
  }
}

struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}

extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let assmlfkilgroe: UInt64
    let rbqagwzemmkgo: UInt64
    let gwfdtugtwokvm: UInt64
    let bknmtxxnvmovu: UInt64
    switch hex.count {
    case 3:
      (assmlfkilgroe, rbqagwzemmkgo, gwfdtugtwokvm, bknmtxxnvmovu) = (
        255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17
      )
    case 6:
      (assmlfkilgroe, rbqagwzemmkgo, gwfdtugtwokvm, bknmtxxnvmovu) = (
        255, int >> 16, int >> 8 & 0xFF, int & 0xFF
      )
    case 8:
      (assmlfkilgroe, rbqagwzemmkgo, gwfdtugtwokvm, bknmtxxnvmovu) = (
        int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF
      )
    default:
      (assmlfkilgroe, rbqagwzemmkgo, gwfdtugtwokvm, bknmtxxnvmovu) = (1, 1, 1, 0)
    }

    self.init(
      .sRGB,
      red: Double(rbqagwzemmkgo) / 255,
      green: Double(gwfdtugtwokvm) / 255,
      blue: Double(bknmtxxnvmovu) / 255,
      opacity: Double(assmlfkilgroe) / 255
    )
  }
}
