//
//  WalletView.swift
//  Mely
//
//  Created by yangyang on 2026/3/9.
//

import SwiftUI

private struct DiamondPackage: Identifiable {
  let id: Int
  let diamonds: Int
  let price: String
}

struct WalletView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss
  @State private var purchasingProductId: String?
  @State private var alertMessage: String?
  @State private var showAlert = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private static let packages: [DiamondPackage] = [
    DiamondPackage(id: 0, diamonds: 400, price: "$0.99"),
    DiamondPackage(id: 1, diamonds: 800, price: "$1.99"),
    DiamondPackage(id: 2, diamonds: 2100, price: "$3.99"),
    DiamondPackage(id: 3, diamonds: 2450, price: "$4.99"),
    DiamondPackage(id: 4, diamonds: 3950, price: "$7.99"),
    DiamondPackage(id: 5, diamonds: 5150, price: "$9.99"),
    DiamondPackage(id: 6, diamonds: 7700, price: "$12.99"),
    DiamondPackage(id: 7, diamonds: 10800, price: "$19.99"),
    DiamondPackage(id: 8, diamonds: 29400, price: "$49.99"),
    DiamondPackage(id: 9, diamonds: 63700, price: "$99.99"),
  ]

  private var currentDiamonds: Int {
    appDataStore.currentUser?.uDg2Jy5Wx ?? 0
  }

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        // 导航栏
        navigationBar

        // 余额区
        balanceSection

        // 钻石套餐网格
        packagesGrid
      }
      // 全屏 loading（支付中）
      .overlay {
        if purchasingProductId != nil {
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
    .alert("Tips", isPresented: $showAlert) {
      Button("OK", role: .cancel) { alertMessage = nil }
    } message: {
      if let msg = alertMessage { Text(msg) }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navigationBar: some View {
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

      // 占位保持标题居中
      Color.clear
        .frame(width: 40, height: 40)
    }
    .padding(.horizontal, 20)
  }

  private var balanceSection: some View {
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
          Text("\(currentDiamonds)")
            .font(.custom("Hanchansans-Medium", size: 24))
            .foregroundColor(.white)
        }
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 16)
      // .padding(.vertical, 16)
    }
    .padding(.horizontal, 20)
    .padding(.top, 20)
  }

  private var packagesGrid: some View {
    let columns = [
      GridItem(.flexible(), spacing: 12),
      GridItem(.flexible(), spacing: 12),
      GridItem(.flexible(), spacing: 12),
    ]

    return ScrollView {
      LazyVGrid(columns: columns, spacing: 12) {
        ForEach(Self.packages) { pkg in
          let productId = pkg.id < walletProductIds.count ? walletProductIds[pkg.id] : nil
          DiamondPackageCard(
            package: pkg,
            isSelected: purchasingProductId == productId,
            onTap: {
              guard let productId else {
                alertMessage = "该套餐暂不可用"
                showAlert = true
                return
              }
              purchasingProductId = productId
              IAPManager.shared.purchaseDiamonds(
                productId: productId,
                diamonds: pkg.diamonds,
                appDataStore: appDataStore
              ) { result in
                Task { @MainActor in
                  purchasingProductId = nil
                  switch result {
                  case .success(let diamonds):
                    alertMessage = "Purchase successful, \(diamonds) diamonds added to your account"
                    showAlert = true
                  case .failure(let error):
                    if case .cancelled = error {
                      alertMessage = "You have cancelled the payment"
                    } else {
                      alertMessage = error.localizedDescription
                    }
                    showAlert = true
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

private struct DiamondPackageCard: View {
  let package: DiamondPackage
  var isSelected = false
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      VStack(spacing: 8) {
        Image("mkirgxytewig_diamond")
          .resizable()
          .frame(width: 38, height: 38)

        Text("\(package.diamonds)")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
          .padding(.bottom, 8)

        Text(package.price)
          .font(.custom("Hanchansans-Medium", size: 14))
          .foregroundColor(isSelected ? Color(hex: "#FF1AB6") : Color(hex: "#CBED40"))
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
          colors: isSelected
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
