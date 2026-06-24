//
//  EULAmLsaSpDjzzZTqsView.swift
//  Mely
//
//

import SwiftUI

struct EULAmLsaSpDjzzZTqsView: View {
  @EnvironmentObject private var appDataStore: MelystoreWpvugHy89HDWLR
  @State private var hasScrolledToBottom: Bool = false

  var body: some View {
    ZStack {
      Image("sancaihebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 16) {
        HStack {
          Text("TFOimQ".melyDecoded)
            .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 24))
            .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.top, 12)

        Spacer(minLength: 0)

        VStack(spacing: 16) {
          ScrollView {
            VStack(alignment: .leading, spacing: 16) {
              Text(
                "Ci9Od7Cy3aASLyVBkafesg".melyDecoded
              )
              .font(.system(size: 20))
              Text(
                "jbme5SIwWSSD7OvlDDtGZYqln64IQ0MQRZazgM0MKFB1g5jW50coUCyJ_on3Hh5bCYihzJPqADhda7y0iPYdMxJgg_7Lpn8pby6WsennHS9faKC6".melyDecoded
              )
              .font(.system(size: 20))
              .lineSpacing(4)
              Text(
                "4PD37jJjR3OUoPT2FGdKfc2oj-cAdn5krebG-SEGYBRik4ve5xghRiqN-t_pUxNBVYuikN8WIF5jiYTG5PYXbwZii_Tbpys8a3OQ5ompUmRkbaKlmO4NM0p90v3GgNocUVNzk5jC4xkpFFCar9L_X3BYOMKtipcHGwZtjYG5yfoGfHxmjbHH9BRPUHHb1_H5YThPf7e22u8PaGN9nJuixrwKKxR8wJPd1wJyCFOOvsjrDwVZOJ-x2KcaZwp4Zr-_4_AZJ3lilLTDtDA2RCeEq4r4SSdAMbm87Ogadg".melyDecoded
              )
              .font(.system(size: 20))
              .lineSpacing(4)
              Text(
                "iKiG5z5zUmWEoKHpHg57TD2D_5L9WkdRV5Wy3ccSMkMijYfEuAEsQ2qZ-oLisio0MWqZ4P_rAXxbdr6uxacdNg1x2vPKsTk7KX-BreGL7xs8SFyevJ_kDnZJY92-1tsFDUtylZ-T9QIuBECLs7jO4UZtHD6f4qf6PDRfZq2-2KpCDnAgm6PK9EE8HSjL0ofVkR80T12G5N7vAAVXbsuy0LccfBVm24PHiRImXRNfiabf73k_Tj-mtJ-lQnFfdo-y6PgHM2IzpKPG7SIx".melyDecoded
              )
              .font(.system(size: 20))
              .lineSpacing(4)
            }
            .foregroundColor(.primary)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.systemBackground))
            )
            .padding(.horizontal, 24)
            .padding(.bottom, 8)
          }
          .background(Color.clear)
          .onAppear {
            hasScrolledToBottom = true
          }

          HStack(spacing: 16) {
            Button {
            } label: {
              Text("aIGm2dQZ".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 20))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(
                  RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(hex: "GbCb6ORScw".melyDecoded))
                )
            }

            Button {
              appDataStore.markEULAAccepted()
            } label: {
              Text("c9O4ytIDJg".melyDecoded)
                .font(.custom("N1VylZXY8BElQFjDm8jlGHla".melyDecoded, size: 20))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(
                  RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white)
                )
            }
            .disabled(!hasScrolledToBottom)
          }
          .padding(.horizontal, 30)
          .padding(.bottom, 24)
        }
      }
    }
  }
}
