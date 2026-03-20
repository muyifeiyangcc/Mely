//
//  EULAmLsaSpDjzzZTqsView.swift
//  Mely
//
//

import SwiftUI

struct EULAmLsaSpDjzzZTqsView: View {
  @EnvironmentObject private var appDataStore: MelystoreWpvugHy89HDWLR
  @State private var hasScrolledToBottom: Bool = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    ZStack {
      Image("sancaihebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 16) {
        HStack {
          Text("EULA")
            .font(.custom("Hanchansans-Medium", size: 24))
            .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.top, 12)

        Spacer(minLength: 0)

        VStack(spacing: 16) {
          ScrollView {
            VStack(alignment: .leading, spacing: 16) {
              Text(
                "Welcome to Mely!"
              )
              .font(.system(size: 20))
              Text(
                "To make a better place, the following content is not allowed inthe app in particular"
              )
              .font(.system(size: 20))
              .lineSpacing(4)
              Text(
                "1.Any content about child harm, pornography related detrimental to children.\n2. Fake and harmful messages about recent or current events.\n3. Any violence,bullying content, publicly promotes pornography and other content."
              )
              .font(.system(size: 20))
              .lineSpacing(4)
              Text(
                "If we find any content including and not limited to the above violations your content will be deleted and account will bebanned. By clicking the above button,youagreeto the Terms of Use and Privacy Policy"
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
              Text("Cancel")
                .font(.custom("Hanchansans-Medium", size: 20))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 15)
                .background(
                  RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(hex: "#CBED40"))
                )
            }

            Button {
              appDataStore.markEULAAccepted()
            } label: {
              Text("I agree")
                .font(.custom("Hanchansans-Medium", size: 20))
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
    #if DEBUG
      .enableInjection()
    #endif
  }
}
