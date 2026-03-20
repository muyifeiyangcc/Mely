//
//  NFkh9JWFp64mW7Editpf.swift
//  Mely
//
//

import SwiftUI

struct NFkh9JWFp64mW7Editpf: View {
  @EnvironmentObject private var ZrHgJNvzd6foWp: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  @State private var ntxt5NRAQtG5rntTBT: String = ""
  @State private var seava0KwpPJW4iGEj8C: UIImage?
  @State private var pendingAvatarPath: String?
  @State private var sspicKPdJQyGquWSfU0: Bool = false

  private let acgDHmuQl9GJsxAZk = Color(hex: "#CBED40")

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private var acvaoA8Oh7pXAbIAxz: (isImage: Bool, image: UIImage?, symbol: String)? {
    if let imgSOT8LlEPUkorcg = seava0KwpPJW4iGEj8C {
      return (true, imgSOT8LlEPUkorcg, "")
    }
    let symbol = pendingAvatarPath ?? ZrHgJNvzd6foWp.curp11O3LYjA9ooct?.uQd8Nv5tK ?? "mely_defava"
    return (false, nil, symbol)
  }

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        navbn91ibdfEIz89SY

        VStack(spacing: 32) {
          avasfq78pgisZLKWOl
          nmUjSmdc6OhKnDQw
        }
        .padding(.horizontal, 24)
        .padding(.top, 40)

        Spacer()

        savbtniKfc29qCq5ZsRs
          .padding(.bottom, 48)
      }
    }
    .onAppear {
      ntxt5NRAQtG5rntTBT = ZrHgJNvzd6foWp.curp11O3LYjA9ooct?.uZp7Lm2cR ?? ""
    }
    .imageSourcePicker(isPresented: $sspicKPdJQyGquWSfU0) { image in
      seava0KwpPJW4iGEj8C = image
      if let path = ImageStorageHelper.saveAvatarImage(image) {
        pendingAvatarPath = path
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navbn91ibdfEIz89SY: some View {
    HStack {
      Button {
        if !path.isEmpty { path.removeLast() } else { dismiss() }
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Color.clear
        .frame(width: 44, height: 44)
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 4)
  }

  private var avasfq78pgisZLKWOl: some View {
    Button {
      sspicKPdJQyGquWSfU0 = true
    } label: {
      ZStack(alignment: .bottomTrailing) {
        ZStack {
          Circle()
            .fill(acgDHmuQl9GJsxAZk)
            .frame(width: 120, height: 120)

          if let nI1hBmfgN8iJPI = acvaoA8Oh7pXAbIAxz {
            if nI1hBmfgN8iJPI.isImage, let img = nI1hBmfgN8iJPI.image {
              Image(uiImage: img)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            } else {
              SmartImageView.namedOrPath(
                nI1hBmfgN8iJPI.symbol,
                placeholder: Image("mely_defava")
              )
              .scaledToFill()
              .frame(width: 120, height: 120)
              .clipShape(Circle())
            }
          }
        }

        Circle()
          .fill(Color.white)
          .frame(width: 36, height: 36)
          .overlay {
            Image(systemName: "camera.fill")
              .font(.system(size: 16))
              .foregroundColor(.black)
          }
          .offset(x: -4, y: -4)
      }
    }
    .buttonStyle(.plain)
  }

  private var nmUjSmdc6OhKnDQw: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Name")
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)

      TextField("Please enter", text: $ntxt5NRAQtG5rntTBT)
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color.black.opacity(0.7))
        )
        .submitLabel(.done)
    }
  }

  private var savbtniKfc29qCq5ZsRs: some View {
    Button {
      persav4QU02cJvYIzidN()
    } label: {
      Text("Save")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 28, style: .continuous)
            .fill(acgDHmuQl9GJsxAZk)
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 24)
  }

  private func persav4QU02cJvYIzidN() {
    let ArPTUYreUO3Q39 = ntxt5NRAQtG5rntTBT.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !ArPTUYreUO3Q39.isEmpty || pendingAvatarPath != nil else { return }
    ZrHgJNvzd6foWp.updcurN1qgl1w1c1h58n(
      name: ArPTUYreUO3Q39.isEmpty ? nil : ArPTUYreUO3Q39,
      avatarSymbol: pendingAvatarPath
    )
    if !path.isEmpty { path.removeLast() } else { dismiss() }
  }
}
