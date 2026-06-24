//
//  DanjubaoxMNiJGX6R1RWxo.swift
//  Mely
//
//

import SwiftUI

enum RepReaRuRbLVXQxhizQZ: CaseIterable {
  case politicalSensitive
  case violentPornography
  case advertisingHarassment
  case infringement
  case other

  var title: String {
    switch self {
    case .politicalSensitive:
      "r9H9LBZrbL7r9OJTFnJkrPXc6hwIEme9pfU".melyDecoded.melyDecoded
    case .violentPornography:
      "oPuiLRF4aL_xh-YgC05gn_Xxt0APTgSjoPU".melyDecoded.melyDecoded
    case .advertisingHarassment:
      "1ggDV1PUh-zTQyFKarC8_vAcXDpX9IzrhikiVGW0".melyDecoded.melyDecoded
    case .infringement:
      "JAVjVZax8rkNdmtEwJifqw".melyDecoded.melyDecoded
    case .other:
      "bMGO9dIQAg".melyDecoded.melyDecoded
    }
  }
}

struct DanjubaoxMNiJGX6R1RWxo: View {
  @Binding var isPresented: Bool
  let onSubmit: (RepReaRuRbLVXQxhizQZ, String) -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var PS62nCSKXuaPZX: RepReaRuRbLVXQxhizQZ = .politicalSensitive
  @State private var QbAjmb0FTZbEmO: String = ""

  private let greRv7JKwHmGb99I7 = Color(hex: "#CBED40")

  var body: some View {
    ZStack {
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .onTapGesture { performCancel() }

      VStack(spacing: 0) {
        VStack(spacing: 20) {
          VStack(spacing: 10) {
            ForEach(RepReaRuRbLVXQxhizQZ.allCases, id: \.self) { reason in
              Button {
                PS62nCSKXuaPZX = reason
              } label: {
                Text(reason.title)
                  .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 16))
                  .foregroundColor(.black)
                  .frame(maxWidth: .infinity, alignment: .center)
                  .padding(.horizontal, 16)
                  .padding(.vertical, 12)
                  .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                      .fill(PS62nCSKXuaPZX == reason ? greRv7JKwHmGb99I7 : Color(hex: "GbGf7-YkBQ".melyDecoded))
                  )
              }
              .buttonStyle(.plain)
              .frame(maxWidth: 235)
            }
          }
          .padding(.top, 55)
          ZStack(alignment: .topLeading) {
            if QbAjmb0FTZbEmO.isEmpty {
              Text("sNjoDBRJY57_2sMVOARtlOLfpAg8GEKAntHa6SloQH2RsObyBChfb9E".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 15))
                .foregroundColor(Color(white: 0.5))
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
            }
            TextField(
              "",
              text: $QbAjmb0FTZbEmO,
              axis: .vertical
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .lineLimit(4...8)
            .font(.custom("Hanchansans-Medium", size: 15))
            .foregroundColor(.white)

          }
          .frame(width: 235)
          .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .fill(Color.black.opacity(0.9))
          )
          VStack(spacing: 12) {
            Button {
              performCancel()
            } label: {
              Text("aIGm2dQZ".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 18))
                .foregroundColor(.black)
                .frame(maxWidth: 200)
                .padding(.vertical, 14)
                .background(
                  Capsule()
                    .fill(greRv7JKwHmGb99I7)
                )
            }
            .buttonStyle(.plain)

            Button {
              isPresented = false
              onSubmit(PS62nCSKXuaPZX, QbAjmb0FTZbEmO)
            } label: {
              Text("eJWq19gB".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 17))
                .foregroundColor(.white)
                .frame(maxWidth: 200)
                .padding(.vertical, 14)
                .background(
                  Capsule()
                    .fill(Color.black)
                )
            }
            .buttonStyle(.plain)
          }
          .padding(.top, 8)
        }
        .background(
          Image("qpeuskywqaalzy_chang")
            .resizable()
            .frame(width: 320, height: 620)
        )
        .padding(.horizontal, 24)
      }
    }
    .toolbar {
      ToolbarItemGroup(placement: .keyboard) {
        Spacer()
        Button("TWmAvQ".melyDecoded) {
          UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.blue)
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func performCancel() {
    onCancel?()
    isPresented = false
  }
}
