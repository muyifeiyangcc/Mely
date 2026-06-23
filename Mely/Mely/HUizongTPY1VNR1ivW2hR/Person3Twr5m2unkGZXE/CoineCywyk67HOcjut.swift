//
//  CoineCywyk67HOcjut.swift
//  Mely
//
//  Created by MELY on 2026/3/9.
//

import SwiftUI

private struct DiaSQxlUeucGab8kH: Identifiable {
  let id: Int
  let diamiRCh7OLPItldoo: Int
  let prioXwazZVtOSYt0l: String
}

struct CoineCywyk67HOcjut: View {
  @EnvironmentObject private var MdJ8ySgYQ7SMif: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @State private var Px61mhLeZFLMQh: String?
  @State private var alrtOvKbTxDwBIMPLh: String?
  @State private var saRJWADOfgR7mR7n = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private static let packages: [DiaSQxlUeucGab8kH] = [
    DiaSQxlUeucGab8kH(id: 0, diamiRCh7OLPItldoo: 400, prioXwazZVtOSYt0l: "$0.99"),
    DiaSQxlUeucGab8kH(id: 1, diamiRCh7OLPItldoo: 800, prioXwazZVtOSYt0l: "$1.99"),
    DiaSQxlUeucGab8kH(id: 2, diamiRCh7OLPItldoo: 2100, prioXwazZVtOSYt0l: "$3.99"),
    DiaSQxlUeucGab8kH(id: 3, diamiRCh7OLPItldoo: 2450, prioXwazZVtOSYt0l: "$4.99"),
    DiaSQxlUeucGab8kH(id: 4, diamiRCh7OLPItldoo: 3950, prioXwazZVtOSYt0l: "$7.99"),
    DiaSQxlUeucGab8kH(id: 5, diamiRCh7OLPItldoo: 5150, prioXwazZVtOSYt0l: "$9.99"),
    DiaSQxlUeucGab8kH(id: 6, diamiRCh7OLPItldoo: 7700, prioXwazZVtOSYt0l: "$12.99"),
    DiaSQxlUeucGab8kH(id: 7, diamiRCh7OLPItldoo: 10800, prioXwazZVtOSYt0l: "$19.99"),
    DiaSQxlUeucGab8kH(id: 8, diamiRCh7OLPItldoo: 29400, prioXwazZVtOSYt0l: "$49.99"),
    DiaSQxlUeucGab8kH(id: 9, diamiRCh7OLPItldoo: 63700, prioXwazZVtOSYt0l: "$99.99"),
  ]

  private var cur9SQYV96k0U5Vma: Int {
    MdJ8ySgYQ7SMif.curp11O3LYjA9ooct?.uDg2Jy5Wx ?? 0
  }

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        nav2Bzseiqq1giFDf

        balDjsKHCgTedjqV

        pa2XR6Zdb0NRsdsU
      }
      .overlay {
        if Px61mhLeZFLMQh != nil {
          Color.black.opacity(0.5)
            .ignoresSafeArea()
          VStack(spacing: 12) {
            ProgressView()
              .scaleEffect(1.2)
              .tint(.white)

            Text("Purchasing...")
              .font(.custom("Hanchansans-Medium", size: 16))
              .foregroundColor(.white)
          }
        }
      }
    }
    .navigationBarHidden(true)
    .alert("Tips", isPresented: $saRJWADOfgR7mR7n) {
      Button("OK", role: .cancel) { alrtOvKbTxDwBIMPLh = nil }
    } message: {
      if let msg = alrtOvKbTxDwBIMPLh { Text(msg) }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var nav2Bzseiqq1giFDf: some View {
    HStack {
      Button(action: { dismiss() }) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Text("Wallet")
        .font(.custom("Hanchansans-Medium", size: 22))
        .foregroundColor(.white)

      Spacer()

      Color.clear
        .frame(width: 40, height: 40)
    }
    .padding(.horizontal, 20)
  }

  private var balDjsKHCgTedjqV: some View {
    ZStack {
      Image("dfrigwunbeab")
        .resizable()
        .scaledToFill()
        .frame(height: 100)

      HStack {
        Text("Balance")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)

        Spacer()

        HStack(spacing: 8) {
          Image("mkirgxytewig_diamond")
            .resizable()
            .frame(width: 36, height: 36)
          Text("\(cur9SQYV96k0U5Vma)")
            .font(.custom("Hanchansans-Medium", size: 24))
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 16)
    }
    .padding(.horizontal, 20)
    .padding(.top, 20)
  }

  private var pa2XR6Zdb0NRsdsU: some View {
    let TWT9nbh6VlsY3B = [
      GridItem(.flexible(), spacing: 12),
      GridItem(.flexible(), spacing: 12),
      GridItem(.flexible(), spacing: 12),
    ]

    return ScrollView {
      LazyVGrid(columns: TWT9nbh6VlsY3B, spacing: 12) {
        ForEach(Self.packages) { pkglKk7JX81uDqGxc in
          let t3fVsBnE9lFQs0 =
            pkglKk7JX81uDqGxc.id < daliangIDSvlxgxhaLelP5rt.count
            ? daliangIDSvlxgxhaLelP5rt[pkglKk7JX81uDqGxc.id] : nil
          Dc5TFZ6oWwkwmwOV(
            pkgH0h170GZ9rGUi6: pkglKk7JX81uDqGxc,
            issedVHMbkfUxcoXs3v: Px61mhLeZFLMQh == t3fVsBnE9lFQs0,
            onTap: {
              guard let t3fVsBnE9lFQs0 else {
                alrtOvKbTxDwBIMPLh = "This package is currently unavailable."
                saRJWADOfgR7mR7n = true
                return
              }
              Px61mhLeZFLMQh = t3fVsBnE9lFQs0
              PurchasetZHH3BKNPRrnVq.shared.purYemianVBiW2isIMqtheq(
                GL76DRy0mJId6fpid: t3fVsBnE9lFQs0,
                daim6LsV2hR56J8VSP: pkglKk7JX81uDqGxc.diamiRCh7OLPItldoo,
                apdastorehpmNCPdUiPsjOW: MdJ8ySgYQ7SMif
              ) { huiCGn5qji7aHM in
                Task { @MainActor in
                  Px61mhLeZFLMQh = nil
                  switch huiCGn5qji7aHM {
                  case .success(let LNWbuVTbNcrSX2):
                    alrtOvKbTxDwBIMPLh =
                      "Purchase successful, \(LNWbuVTbNcrSX2) diamonds added to your account"
                    saRJWADOfgR7mR7n = true
                  case .failure(let er4dNLlo4e3KDBmE):
                    if case .cancelled = er4dNLlo4e3KDBmE {
                      alrtOvKbTxDwBIMPLh = "You have cancelled the payment"
                    } else {
                      alrtOvKbTxDwBIMPLh = er4dNLlo4e3KDBmE.localizedDescription
                    }
                    saRJWADOfgR7mR7n = true
                  }
                }
              }
            }
          )
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, 24)
      .padding(.bottom, 40)
    }
  }
}

private struct Dc5TFZ6oWwkwmwOV: View {
  let pkgH0h170GZ9rGUi6: DiaSQxlUeucGab8kH
  var issedVHMbkfUxcoXs3v = false
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      VStack(spacing: 8) {
        Image("mkirgxytewig_diamond")
          .resizable()
          .frame(width: 38, height: 38)

        Text("\(pkgH0h170GZ9rGUi6.diamiRCh7OLPItldoo)")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
          .padding(.bottom, 8)

        Text(pkgH0h170GZ9rGUi6.prioXwazZVtOSYt0l)
          .font(.custom("Hanchansans-Medium", size: 14))
          .foregroundColor(issedVHMbkfUxcoXs3v ? Color(hex: "#FF1AB6") : Color(hex: "#CBED40"))
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity)
          .background(Color.black)
          .cornerRadius(20)
          .padding(.horizontal, 12)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 12)
      .background(
        LinearGradient(
          colors: issedVHMbkfUxcoXs3v
            ? [Color(hex: "#FF1AB6"), Color.white]
            : [Color(hex: "#CBED40"), Color.white],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .cornerRadius(20)
    }
    .buttonStyle(.plain)
  }
}
