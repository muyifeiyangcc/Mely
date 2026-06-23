import StoreKit
import SwiftUI
import UIKit

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

#if canImport(FBSDKCoreKit)
  import FBSDKCoreKit
#endif

func naventhFittinglog(_ name: String) -> Image {
  let mappedName: String
  switch name {
  case "Mely_entrybg":
    mappedName = "dengxuanbg"
  case "Mely_logo":
    mappedName = "melylogo"
  default:
    mappedName = name
  }
  return Image(mappedName)
}

struct NijiBPackagePulseBars: View {
  enum Style {
    case button
    case panel
  }

  let style: Style
  @State private var isAnimating = false

  private var tint: Color {
    Color(red: 0.66, green: 0.92, blue: 0.2)
  }

  private var barWidth: CGFloat {
    style == .button ? 5 : 7
  }

  private var barHeight: CGFloat {
    style == .button ? 17 : 28
  }

  private var spacing: CGFloat {
    style == .button ? 5 : 7
  }

  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      ForEach(0..<4, id: \.self) { index in
        RoundedRectangle(cornerRadius: barWidth / 2, style: .continuous)
          .fill(index == 1 ? .white : tint)
          .frame(width: barWidth, height: barHeight)
          .scaleEffect(y: isAnimating ? activeScale(for: index) : idleScale(for: index), anchor: .center)
          .opacity(isAnimating ? activeOpacity(for: index) : 0.82)
          .animation(
            .easeInOut(duration: 0.66)
              .repeatForever(autoreverses: true)
              .delay(Double(index) * 0.1),
            value: isAnimating
          )
      }
    }
    .frame(height: barHeight)
    .onAppear {
      isAnimating = true
    }
  }

  private func activeScale(for index: Int) -> CGFloat {
    [0.62, 1.1, 0.78, 1.28][index]
  }

  private func idleScale(for index: Int) -> CGFloat {
    [1.2, 0.74, 1.18, 0.68][index]
  }

  private func activeOpacity(for index: Int) -> CGFloat {
    index == 1 ? 1 : 0.7
  }
}

struct NijiBPackageButtonLoader: View {
  var body: some View {
    HStack(spacing: 10) {
      NijiBPackagePulseBars(style: .button)

      Text("Loading")
        .font(.system(size: 16, weight: .heavy))
        .foregroundStyle(.black)
    }
  }
}

struct NijiBPackageLoadingBadge: View {
  @State private var trimEnd: CGFloat = 0.18

  var body: some View {
    HStack(spacing: 12) {
      NijiBPackagePulseBars(style: .button)

      Capsule()
        .fill(.white.opacity(0.2))
        .frame(width: 74, height: 5)
        .overlay(alignment: .leading) {
          Capsule()
            .fill(Color(red: 0.66, green: 0.92, blue: 0.2))
            .frame(width: 74 * trimEnd, height: 5)
        }
    }
    .padding(.horizontal, 18)
    .padding(.vertical, 13)
    .background(.black.opacity(0.38), in: Capsule())
    .overlay {
      Capsule()
        .stroke(.white.opacity(0.24), lineWidth: 1)
    }
    .shadow(color: .black.opacity(0.28), radius: 16, x: 0, y: 10)
    .onAppear {
      trimEnd = 0.18
      withAnimation(.easeInOut(duration: 1.05).repeatForever(autoreverses: true)) {
        trimEnd = 1
      }
    }
  }
}

struct NijiBPackageLoadingPanel: View {
  let message: String
  @State private var trimEnd: CGFloat = 0.24

  var body: some View {
    VStack(spacing: 18) {
      ZStack {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .fill(Color.white.opacity(0.08))
          .frame(width: 82, height: 82)
          .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
              .stroke(.white.opacity(0.18), lineWidth: 1)
          }

        NijiBPackagePulseBars(style: .panel)
      }

      VStack(spacing: 10) {
        Text(message)
          .font(.system(size: 15, weight: .bold))
          .foregroundStyle(.white)
          .lineLimit(1)
          .minimumScaleFactor(0.78)

        Capsule()
          .fill(.white.opacity(0.16))
          .frame(width: 132, height: 5)
          .overlay(alignment: .leading) {
            Capsule()
              .fill(Color(red: 0.66, green: 0.92, blue: 0.2))
              .frame(width: 132 * trimEnd, height: 5)
          }
      }
    }
    .padding(.horizontal, 34)
    .padding(.vertical, 28)
    .background(Color.black.opacity(0.72), in: RoundedRectangle(cornerRadius: 24, style: .continuous))
    .overlay {
      RoundedRectangle(cornerRadius: 24, style: .continuous)
        .stroke(.white.opacity(0.2), lineWidth: 1)
    }
    .shadow(color: .black.opacity(0.34), radius: 24, x: 0, y: 16)
    .onAppear {
      trimEnd = 0.24
      withAnimation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true)) {
        trimEnd = 1
      }
    }
  }
}

final class qrenthavoliaMuxiron {
  static let shared = qrenthavoliaMuxiron()
  private static let adjustPurchaseEventToken = "jpc1ff"

  private init() {}

  func bPackagePurchase(
    lavqoraThreadfray productId: String,
    orderCode: String,
    completion: @escaping (Result<SKPaymentTransaction, Purerr5HDt4Mr7LrDAkS>) -> Void
  ) {
    PurchasetZHH3BKNPRrnVq.shared.purcprosd2BobgXIKRnA0lY(
      v4zoTu0d0VZr0ypid: productId
    ) { result in
      switch result {
      case .success(let transaction):
        Task {
          guard let receipt = Self.appStoreReceiptBase64() else {
            _ = await AdjstReptZyn1Ck0ptorTch(eventType: "purchase_failed")
            await MainActor.run {
              completion(.failure(.unknown))
            }
            return
          }

          let verified = await qxwF8SmvyGgtlN(
            purchaseID: transaction.transactionIdentifier,
            serverVerificationData: receipt,
            swk89MmAgXRT7vmn: orderCode
          )
          _ = await AdjstReptZyn1Ck0ptorTch(eventType: verified ? "purchase_success" : "purchase_failed")
          await MainActor.run {
            if verified {
              Self.logPurchase(productId: productId, orderCode: orderCode)
              completion(.success(transaction))
            } else {
              completion(.failure(.unknown))
            }
          }
        }

      case .failure(let error):
        Task {
          _ = await AdjstReptZyn1Ck0ptorTch(eventType: "purchase_failed")
          await MainActor.run {
            completion(.failure(error))
          }
        }
      }
    }
  }

  private static func appStoreReceiptBase64() -> String? {
    guard let receiptURL = Bundle.main.appStoreReceiptURL,
      let receiptData = try? Data(contentsOf: receiptURL)
    else {
      return nil
    }
    return receiptData.base64EncodedString()
  }

  private static func logPurchase(productId: String, orderCode: String) {
    let product = PurchasetZHH3BKNPRrnVq.shared.product(for: productId)
    let amount = product?.price.doubleValue ?? 0
    let currency = product?.priceLocale.currencyCode ?? "USD"

    #if canImport(FBSDKCoreKit)
      AppEvents.shared.logPurchase(
        amount: amount,
        currency: currency,
        parameters: [
          AppEvents.ParameterName("fb_mobile_purchase"): "true",
          AppEvents.ParameterName("product_id"): productId,
          AppEvents.ParameterName("order_code"): orderCode,
        ]
      )
    #endif

    #if canImport(AdjustSdk)
      if let event = ADJEvent(eventToken: adjustPurchaseEventToken) {
        event.setRevenue(amount, currency: currency)
        Adjust.trackEvent(event)
      }
    #endif
  }
}
