//
//  LaheijubaoPP2zvCW5twWJok.swift
//  Mely
//
//

import SwiftUI

struct LaheijubaoPP2zvCW5twWJok: View {
  @Binding var isPresented: Bool
  let onReport: () -> Void
  let onOXhiQzKCNvCvG4Block: () -> Void
  var onCancel: (() -> Void)?

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let greRXeqvWKCvK5UUq = Color(hex: "#CBED40")
  private let pikRXeqvWKCvK5UUq = Color(hex: "#FF1AB6")

  var body: some View {
    ZStack(alignment: .bottom) {
      Color.black.opacity(0.6)
        .ignoresSafeArea()
        .onTapGesture { cn0qteEjPeH5JD1k() }

      VStack(spacing: 46) {
        HStack(spacing: 80) {
          Button {
            isPresented = false
            onReport()
          } label: {
            Text("Report")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
              .frame(width: 94, height: 94)
              .background(pikRXeqvWKCvK5UUq)
              .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
              .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                  .stroke(Color.white, lineWidth: 2)
              )
          }
          .buttonStyle(.plain)

          Button {
            isPresented = false
            onOXhiQzKCNvCvG4Block()
          } label: {
            Text("Block account")
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.red)
              .multilineTextAlignment(.center)
              .frame(width: 94, height: 94)
              .background(greRXeqvWKCvK5UUq)
              .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
              .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                  .stroke(Color.white, lineWidth: 2)
              )
          }
          .buttonStyle(.plain)
        }

        Button {
          cn0qteEjPeH5JD1k()
        } label: {
          Text("Cancel")
            .font(.custom("Hanchansans-Medium", size: 18))
            .foregroundColor(.black)
            .frame(maxWidth: 240)
            .padding(.vertical, 14)
            .background(Color.white)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      .padding(.bottom, 34)
      .padding(.horizontal, 16)
      .padding(.bottom, 16)
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private func cn0qteEjPeH5JD1k() {
    onCancel?()
    isPresented = false
  }
}
