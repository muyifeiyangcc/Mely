//
//  TopBLMs4aEB1cnGp9bar.swift
//  Mely
//
//

import SwiftUI

struct TopBLMs4aEB1cnGp9bar: View {
  let ttYl57M7uFheos3o: String
  let onfanGroV0pgM1ABvRj: () -> Void
  var onLahBc6gaE9DtSKKGe: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    HStack {
      Button(action: onfanGroV0pgM1ABvRj) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(.white)
          .clipShape(Circle())
      }
      .buttonStyle(.plain)

      Spacer()

      Text(ttYl57M7uFheos3o)
        .font(.system(size: 22, weight: .semibold))
        .foregroundColor(.white)

      Spacer()

      Group {
        if let onLahBc6gaE9DtSKKGe {
          Button(action: onLahBc6gaE9DtSKKGe) {
            Image(systemName: "ellipsis")
              .font(.system(size: 18, weight: .semibold))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
              .background(.white)
              .clipShape(Circle())
          }
          .buttonStyle(.plain)
        } else {
          Color.clear
            .frame(width: 44, height: 44)
        }
      }
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 10)
    #if DEBUG
      .enableInjection()
    #endif
  }
}

struct UAvatHpoJa1igYGVKS7: View {
  let avatarSymbol: String
  var placeholder: Image = Image("mely_defava")
  var size: CGFloat = 80

  var body: some View {
    ImageLJIzgD4rpc6J6v.namedOrPath(avatarSymbol, placeholder: placeholder)
      .scaledToFill()
      .frame(width: size, height: size)
      .clipShape(Circle())
  }
}
