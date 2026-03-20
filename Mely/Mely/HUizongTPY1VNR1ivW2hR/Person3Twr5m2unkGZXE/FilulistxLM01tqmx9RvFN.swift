//
//  FilulistxLM01tqmx9RvFN.swift
//  Mely
//
//  Created by yangyang on 2026/3/11.
//

import SwiftUI

enum UstzJWuwZtLDItVHl: Hashable {
  case boU8usEO7k4XTyO4
  case foMMHt0OAJAUpn9v
  case fwhRmiekN92I0G5h

  var title: String {
    switch self {
    case .boU8usEO7k4XTyO4: return "Blocklist"
    case .foMMHt0OAJAUpn9v: return "Following"
    case .fwhRmiekN92I0G5h: return "Followers"
    }
  }
}

struct FilulistxLM01tqmx9RvFN: View {
  @EnvironmentObject private var oRMseBC0wsL8zO: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  let lstyKEt8B9er18SA63: UstzJWuwZtLDItVHl

  private var TvM5adRXwervyz: UserteYT4uBeg4ObJP? {
    oRMseBC0wsL8zO.curp11O3LYjA9ooct
  }

  private var RiLY4U8UtAJKjF: [String] {
    guard let ur8IBdVjiT9UUK3p = TvM5adRXwervyz else { return [] }
    let blocked = Set(ur8IBdVjiT9UUK3p.uBh9Ca1Zs)
    switch lstyKEt8B9er18SA63 {
    case .boU8usEO7k4XTyO4: return ur8IBdVjiT9UUK3p.uBh9Ca1Zs
    case .foMMHt0OAJAUpn9v: return ur8IBdVjiT9UUK3p.uFn3Te6Qb.filter { !blocked.contains($0) }
    case .fwhRmiekN92I0G5h: return ur8IBdVjiT9UUK3p.uFm7Xr8Lp.filter { !blocked.contains($0) }
    }
  }

  private var usersBfGOefqZwrr7G8: [UserteYT4uBeg4ObJP] {
    RiLY4U8UtAJKjF.compactMap { uid in
      oRMseBC0wsL8zO.izHqrtotvfHu1g.adUr9Mz3Qc.first { $0.id == uid }
    }
  }

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        bav9RbdMPbtSUG9Pa
        if usersBfGOefqZwrr7G8.isEmpty {
          VStack {
            Spacer()
            EmptyZhanweiView()
            Spacer()
          }
          .padding(.bottom, 60)
          .frame(width: .infinity, height: .infinity)
        } else {
          ustvGpET3dLNSp6qGT
        }
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var bav9RbdMPbtSUG9Pa: some View {
    ZStack {
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

        Text(lstyKEt8B9er18SA63.title)
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.white)

        Spacer()

        Color.clear
          .frame(width: 44, height: 44)
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 16)
    }
  }

  private var ustvGpET3dLNSp6qGT: some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        ForEach(usersBfGOefqZwrr7G8) { user in
          uroJav04aG7l5hX6o(uY1UQ2rEegxEUx4: user)
        }
      }
      .padding(.horizontal, 20)
    }
  }

  private func uroJav04aG7l5hX6o(uY1UQ2rEegxEUx4: UserteYT4uBeg4ObJP) -> some View {
    HStack(spacing: 16) {
      Button {
        path.append(.userProfile(userId: uY1UQ2rEegxEUx4.id))
      } label: {
        UAvatHpoJa1igYGVKS7(avatarSymbol: uY1UQ2rEegxEUx4.uQd8Nv5tK, size: 52)
          .overlay {
            Circle().stroke(Color.white, lineWidth: 3)
          }
          .clipShape(Circle())
      }
      .buttonStyle(.plain)

      Text(uY1UQ2rEegxEUx4.uZp7Lm2cR)
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.white)

      Spacer()

      actionButton(for: uY1UQ2rEegxEUx4)
    }
    .padding(.vertical, 12)
    .cornerRadius(14)
  }

  @ViewBuilder
  private func actionButton(for u5ngT13EcSj71yh: UserteYT4uBeg4ObJP) -> some View {
    switch lstyKEt8B9er18SA63 {
    case .boU8usEO7k4XTyO4:
      Button {
        oRMseBC0wsL8zO.unbol09gWb9KvHD4JjV(uid: u5ngT13EcSj71yh.id)
      } label: {
        Text("Cancel")
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.black)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Color(hex: "#CBED40"))
          .clipShape(Capsule())
      }
      .buttonStyle(.plain)

    case .foMMHt0OAJAUpn9v:
      Button {
        oRMseBC0wsL8zO.unfowtfG415dyvn173J(uid: u5ngT13EcSj71yh.id)
      } label: {
        Image(systemName: "checkmark")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.black)
          .frame(width: 64, height: 30)
          .background(Color(hex: "#CBED40"))
          .clipShape(Capsule())
      }
      .buttonStyle(.plain)

    case .fwhRmiekN92I0G5h:
      let ifowDquL93Oyoias9i = oRMseBC0wsL8zO.isfings9wxsR6YeqeKUh(u5ngT13EcSj71yh.id)
      Button {
        if ifowDquL93Oyoias9i {
          oRMseBC0wsL8zO.unfowtfG415dyvn173J(uid: u5ngT13EcSj71yh.id)
        } else {
          oRMseBC0wsL8zO.fowus97mjk3D9vlxCqB(uid: u5ngT13EcSj71yh.id)
        }
      } label: {
        Group {
          if ifowDquL93Oyoias9i {
            Image(systemName: "checkmark")
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(.white)
          } else {
            Image(systemName: "plus")
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.white)
          }
        }
        .frame(width: 44, height: 36)
        .background(Color(hex: "#CBED40"))
        .cornerRadius(12)
      }
      .buttonStyle(.plain)
    }
  }
}
