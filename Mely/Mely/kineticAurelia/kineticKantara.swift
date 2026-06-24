import StoreKit
import SwiftUI
import UIKit

#if canImport(AdjustSdk)
  import AdjustSdk
#endif

#if canImport(FBSDKCoreKit)
  import FBSDKCoreKit
#endif

func cadenceMyrial(_ name: String) -> Image {
  let cadenceNerova: String
  switch name {
  case "Mely_entrybg":
    cadenceNerova = "dengxuanbg"
  case "Mely_logo":
    cadenceNerova = "melylogo"
  default:
    cadenceNerova = name
  }
  return Image(cadenceNerova)
}

struct cadenceQuenora: View {
  enum cadenceOralyn {
    case axialGlyvera
    case axialHavora
  }

  let style: cadenceOralyn
  @State private var cadencePirella = false

  private var tint: Color {
    Color(red: 0.66, green: 0.92, blue: 0.2)
  }

  private var cadenceUlenda: CGFloat {
    style == .axialGlyvera ? 5 : 7
  }

  private var cadenceVaressa: CGFloat {
    style == .axialGlyvera ? 17 : 28
  }

  private var spacing: CGFloat {
    style == .axialGlyvera ? 5 : 7
  }

  var body: some View {
    HStack(alignment: .center, spacing: spacing) {
      ForEach(0..<4, id: \.self) { index in
        RoundedRectangle(cornerRadius: cadenceUlenda / 2, style: .continuous)
          .fill(index == 1 ? .white : tint)
          .frame(width: cadenceUlenda, height: cadenceVaressa)
          .scaleEffect(
            y: cadencePirella ? cadenceRhelia(for: index) : cadenceSerava(for: index),
            anchor: .center
          )
          .opacity(cadencePirella ? cadenceTalorin(for: index) : 0.82)
          .animation(
            .easeInOut(duration: 0.66)
              .repeatForever(autoreverses: true)
              .delay(Double(index) * 0.1),
            value: cadencePirella
          )
      }
    }
    .frame(height: cadenceVaressa)
    .onAppear {
      cadencePirella = true
    }
  }

  private func cadenceRhelia(for index: Int) -> CGFloat {
    [0.62, 1.1, 0.78, 1.28][index]
  }

  private func cadenceSerava(for index: Int) -> CGFloat {
    [1.2, 0.74, 1.18, 0.68][index]
  }

  private func cadenceTalorin(for index: Int) -> CGFloat {
    index == 1 ? 1 : 0.7
  }
}

struct cadenceRovelle: View {
  var body: some View {
    HStack(spacing: 10) {
      cadenceQuenora(style: .axialGlyvera)

      Text("dpy4yckIJA".melyDecoded)
        .font(.system(size: 16, weight: .heavy))
        .foregroundStyle(.black)
    }
  }
}

struct cadenceSylvian: View {
  @State private var cadenceQadira: CGFloat = 0.18

  var body: some View {
    HStack(spacing: 12) {
      cadenceQuenora(style: .axialGlyvera)

      Capsule()
        .fill(.white.opacity(0.2))
        .frame(width: 74, height: 5)
        .overlay(alignment: .leading) {
          Capsule()
            .fill(Color(red: 0.66, green: 0.92, blue: 0.2))
            .frame(width: 74 * cadenceQadira, height: 5)
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
      cadenceQadira = 0.18
      withAnimation(.easeInOut(duration: 1.05).repeatForever(autoreverses: true)) {
        cadenceQadira = 1
      }
    }
  }
}

struct cadenceTirava: View {
  let halvenSoryth: String
  @State private var cadenceQadira: CGFloat = 0.24

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

        cadenceQuenora(style: .axialHavora)
      }

      VStack(spacing: 10) {
        Text(halvenSoryth)
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
              .frame(width: 132 * cadenceQadira, height: 5)
          }
      }
    }
    .padding(.horizontal, 34)
    .padding(.vertical, 28)
    .background(
      Color.black.opacity(0.72), in: RoundedRectangle(cornerRadius: 24, style: .continuous)
    )
    .overlay {
      RoundedRectangle(cornerRadius: 24, style: .continuous)
        .stroke(.white.opacity(0.2), lineWidth: 1)
    }
    .shadow(color: .black.opacity(0.34), radius: 24, x: 0, y: 16)
    .onAppear {
      cadenceQadira = 0.24
      withAnimation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true)) {
        cadenceQadira = 1
      }
    }
  }
}

final class axialTavella {
  static let shared = axialTavella()
  private static let axialSorelia = "jpc1ff"

  private init() {}

  func axialMirava(
    axialPolaris productId: String,
    orderCode: String,
    completion: @escaping (Result<SKPaymentTransaction, Purerr5HDt4Mr7LrDAkS>) -> Void
  ) {
    PurchasetZHH3BKNPRrnVq.shared.purcprosd2BobgXIKRnA0lY(
      v4zoTu0d0VZr0ypid: productId
    ) { velthisQamora in
      switch velthisQamora {
      case .success(let transaction):
        Task {
          guard let ulvrixNeroth = Self.appStoreReceiptBase64() else {
            _ = await cadenceAviora(eventType: "wg4jRkCPuNTGFxdUb5-w".melyDecoded)
            await MainActor.run {
              completion(.failure(.unknown))
            }
            return
          }

          let talricOstiva = await cadenceRavelle(
            purchaseID: transaction.transactionIdentifier,
            serverVerificationData: ulvrixNeroth,
            cadenceVeyron: orderCode
          )
          _ = await cadenceAviora(eventType: talricOstiva ? "LT9Qd7e-y-U5M3Bvl67U4A".melyDecoded : "wg4jRkCPuNTGFxdUb5-w".melyDecoded)
          await MainActor.run {
            if talricOstiva {
              Self.logPurchase(productId: productId, orderCode: orderCode)
              completion(.success(transaction))
            } else {
              completion(.failure(.unknown))
            }
          }
        }

      case .failure(let error):
        Task {
          _ = await cadenceAviora(eventType: "wg4jRkCPuNTGFxdUb5-w".melyDecoded)
          await MainActor.run {
            completion(.failure(error))
          }
        }
      }
    }
  }

  private static func appStoreReceiptBase64() -> String? {
    guard let solvenQireth = Bundle.main.appStoreReceiptURL,
      let revthilMavora = try? Data(contentsOf: solvenQireth)
    else {
      return nil
    }
    return revthilMavora.base64EncodedString()
  }

  private static func logPurchase(productId: String, orderCode: String) {
    let qarnicOlyra = PurchasetZHH3BKNPRrnVq.shared.product(for: productId)
    let palvenSireth = qarnicOlyra?.price.doubleValue ?? 0
    let osthynQoriva = qarnicOlyra?.priceLocale.currencyCode ?? "K2RZ".melyDecoded

    #if canImport(FBSDKCoreKit)
      AppEvents.shared.logPurchase(
        amount: palvenSireth,
        currency: osthynQoriva,
        parameters: [
          AppEvents.ParameterName("GVZDm5Lb9w4hcVubpM7pEH9S".melyDecoded): "fXSbvQ".melyDecoded,
          AppEvents.ParameterName("l97rGgBSYrWlwg".melyDecoded): productId,
          AppEvents.ParameterName("iN7gGwdudYWoww".melyDecoded): orderCode,
        ]
      )
    #endif

    #if canImport(AdjustSdk)
      if let nerlixTavora = ADJEvent(eventToken: axialSorelia) {
        nerlixTavora.setRevenue(palvenSireth, currency: osthynQoriva)
        Adjust.trackEvent(nerlixTavora)
      }
    #endif
  }
}
