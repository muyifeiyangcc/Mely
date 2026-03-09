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
  let usePinkGradient: Bool
}

struct WalletView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private static let packages: [DiamondPackage] = [
    DiamondPackage(id: 0, diamonds: 400, price: "$0.99", usePinkGradient: true),
    DiamondPackage(id: 1, diamonds: 800, price: "$1.99", usePinkGradient: false),
    DiamondPackage(id: 2, diamonds: 2100, price: "$3.99", usePinkGradient: false),
    DiamondPackage(id: 3, diamonds: 2450, price: "$4.99", usePinkGradient: false),
    DiamondPackage(id: 4, diamonds: 3950, price: "$7.99", usePinkGradient: false),
    DiamondPackage(id: 5, diamonds: 4900, price: "$9.99", usePinkGradient: false),
    DiamondPackage(id: 6, diamonds: 7700, price: "$14.99", usePinkGradient: false),
    DiamondPackage(id: 7, diamonds: 9800, price: "$19.99", usePinkGradient: false),
    DiamondPackage(id: 8, diamonds: 24500, price: "$49.99", usePinkGradient: false),
    DiamondPackage(id: 9, diamonds: 49000, price: "$99.99", usePinkGradient: false),
  ]

  private var currentDiamonds: Int {
    appDataStore.currentUser?.diamonds ?? 0
  }

  var body: some View {
    ZStack {
      // 背景
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // 导航栏
        navigationBar

        // 余额区
        balanceSection

        // 钻石套餐网格
        packagesGrid
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navigationBar: some View {
    HStack {
      Button(action: { dismiss() }) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.black)
          .frame(width: 40, height: 40)
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
          DiamondPackageCard(
            package: pkg,
            onTap: { appDataStore.addDiamonds(pkg.diamonds) }
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
          .foregroundColor(package.usePinkGradient ? Color(hex: "#FF1AB6") : Color(hex: "#CBED40"))
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
          colors: package.usePinkGradient
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
