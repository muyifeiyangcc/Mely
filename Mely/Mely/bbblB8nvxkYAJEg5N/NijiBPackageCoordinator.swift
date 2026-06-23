import Foundation
import Combine
import SwiftUI

@MainActor
final class NijiBPackageCoordinator: ObservableObject {
  enum Phase: Equatable {
    case checking
    case aPackage
    case bLogin
    case bWeb
  }

  @Published private(set) var phase: Phase = .checking
  @Published var message: String?
  private var hasStarted = false

  func start() {
    guard !hasStarted else { return }
    hasStarted = true
    Task {
      await bootstrap()
    }
  }

  func submitBLogin() async {
    message = nil
    prepareDeviceContext()

    let response = await requestBLoginWithWarmupRetry()
    guard let response,
      let code = response["code"] as? String,
      code == "0000"
    else {
      message = response?["message"] as? String ?? "Login failed"
      return
    }

    if let result = response["result"] as? [String: Any],
      let token = result["token"] as? String
    {
      Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2 = token
      if Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.k60nZY01jAR3wUD.isEmpty,
        let password = result["password"] as? String
      {
        Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.k60nZY01jAR3wUD = password
      }
      phase = .bWeb
    } else {
      message = response["message"] as? String ?? "Login failed"
    }
  }

  func showBWeb() {
    guard Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.fRUslNXXisVmIx else { return }
    phase = .bWeb
  }

  func closeBWeb() {
    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2 = ""
    phase = .bLogin
  }

  private func bootstrap() async {
    prepareDeviceContext()

    let vpnStatus = Vpnde94uROL16wl8I42.vpnStatus()
    var response: [String: Any]?
    var retry = 0
    var loadingFailureCount = 0

    response = await aPBXHaqBtqyVag(vpnStatus)
    while response == nil {
      response = await aPBXHaqBtqyVag(vpnStatus)
      if response == nil {
        let delay = min(0.5 + Double(min(retry, 3)) * 0.5, 2.0)
        try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        retry += 1
        loadingFailureCount += 1
        if loadingFailureCount >= 10 && loadingFailureCount % 5 == 0 {
          Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.fRUslNXXisVmIx = false
          phase = .aPackage
          message = "The operation failed due to an unexpected network disruption. Please try again soon."
          return
        }
      }
    }

    guard let response,
      let code = response["code"] as? String,
      code == "0000",
      Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.I6GIcJgEWXFSFk.contains("iPhone"),
      let result = response["result"] as? [String: Any],
      let openValue = result["openValue"] as? String,
      !openValue.isEmpty
    else {
      Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.fRUslNXXisVmIx = false
      phase = .aPackage
      return
    }

    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.fRUslNXXisVmIx = true
    Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.CAqfqQU9UDXl5X = openValue

    let loginFlag = result["loginFlag"] as? Int ?? 0
    if !Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2.isEmpty && loginFlag == 1 {
      phase = .bWeb
    } else {
      phase = .bLogin
    }
  }

  private func prepareDeviceContext() {
    _ = Fr8d7tSVMYWA7qat()
    N4bykHk3pIQezzt()
    VPG68YRdjl0OAq()
    rQlQWgC0e2GAnh()
    woTMsb0MdFuR91()
  }

  private func requestBLoginWithWarmupRetry() async -> [String: Any]? {
    var latestResponse: [String: Any]?

    for attempt in 0..<3 {
      latestResponse = await jZfYGDA1kTR6Gb()
      if isUsableBLoginResponse(latestResponse) {
        return latestResponse
      }

      if attempt < 2 {
        try? await Task.sleep(nanoseconds: UInt64(0.8 * 1_000_000_000))
      }
    }

    return latestResponse
  }

  private func isUsableBLoginResponse(_ response: [String: Any]?) -> Bool {
    guard let response,
      let code = response["code"] as? String,
      code == "0000",
      let result = response["result"] as? [String: Any],
      let token = result["token"] as? String,
      !token.isEmpty
    else {
      return false
    }

    return true
  }
}

struct NijiBPackageGateView: View {
  @ObservedObject var coordinator: NijiBPackageCoordinator
  @State private var isSubmitting = false
  @State private var agreeLegal = true
  @State private var protocolPath: [NijiBPackageProtocolRoute] = []

  var body: some View {
    NavigationStack(path: $protocolPath) {
      ZStack(alignment: .bottom) {
        naventhFittinglog("Mely_entrybg")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()

        VStack(spacing: 0) {
          Spacer()

          NijiBPackageBrandBlock(logoSize: 116, titleSize: 34)
            .padding(.bottom, 74)

          Button {
            guard !isSubmitting, agreeLegal else { return }
            isSubmitting = true
            Task {
              await coordinator.submitBLogin()
              await MainActor.run {
                isSubmitting = false
              }
            }
          } label: {
            ZStack {
              if isSubmitting {
                ProgressView()
                  .tint(.black)
                // NijiBPackageButtonLoader()
              } else {
                Text("Start")
                  .font(.system(size: 18, weight: .heavy))
                  .foregroundStyle(.black)
              }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
              Color(red: 0.66, green: 0.92, blue: 0.2).opacity(agreeLegal ? 1 : 0.45),
              in: RoundedRectangle(cornerRadius: 18)
            )
          }
          .padding(.horizontal, 44)
          .padding(.bottom, 16)
          .buttonStyle(.plain)
          .disabled(!agreeLegal || isSubmitting)
          .padding(.bottom, 24)

          if let message = coordinator.message {
            Text(message)
              .font(.system(size: 14, weight: .semibold))
              .foregroundStyle(.white)
              .multilineTextAlignment(.center)
              .padding(.horizontal, 28)
              .padding(.top, 18)
          }

          Spacer()
            .frame(height: 72)
        }
      }
      .navigationDestination(for: NijiBPackageProtocolRoute.self) { route in
        NijiBPackageProtocolView(route: route)
      }
    }
  }
}

struct NijiBPackageBootstrapView: View {
  let message: String?

  var body: some View {
    ZStack(alignment: .bottom) {
      naventhFittinglog("Mely_entrybg")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      VStack(spacing: 26) {
        NijiBPackageBrandBlock(logoSize: 116, titleSize: 34)

        NijiBPackageLoadingBadge()
          .padding(.top, 36)
          .padding(.bottom, 100)

        if let message {
          Text(message)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 28)
        }
      }
      .padding(.bottom, 26)
    }
  }
}

private struct NijiBPackageBrandBlock: View {
  let logoSize: CGFloat
  let titleSize: CGFloat

  var body: some View {
    VStack(spacing: 14) {
      naventhFittinglog("Mely_logo")
        .resizable()
        .scaledToFit()
        .frame(width: logoSize, height: logoSize)
        .shadow(color: .black.opacity(0.22), radius: 12, x: 0, y: 8)
        .clipShape(RoundedRectangle(cornerRadius: 26))

      Text("Mely")
        .font(.system(size: titleSize, weight: .black))
        .foregroundStyle(.white)
        .lineLimit(1)
        .minimumScaleFactor(0.78)
    }
  }
}
