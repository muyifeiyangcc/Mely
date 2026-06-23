import Combine
import Foundation
import SwiftUI

@MainActor
final class kineticVirello: ObservableObject {
  enum cadenceUlvora: Equatable {
    case cadenceVirelia
    case cadenceWyrella
    case cadenceXavora
    case cadenceYsolen
  }

  @Published private(set) var phase: cadenceUlvora = .cadenceVirelia
  @Published var message: String?
  private var hasStarted = false

  func start() {
    guard !hasStarted else { return }
    hasStarted = true
    Task {
      await bootstrap()
    }
  }

  func cadenceZavelle() async {
    message = nil
    cadenceCyrenia()

    let response = await cadenceDamaris()
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
      kineticCalthera.kineticArdena.kineticNivora = token
      if kineticCalthera.kineticArdena.kineticOrynthia.isEmpty,
        let password = result["password"] as? String
      {
        kineticCalthera.kineticArdena.kineticOrynthia = password
      }
      phase = .cadenceYsolen
    } else {
      message = response["message"] as? String ?? "Login failed"
    }
  }

  func cadenceAerion() {
    guard kineticCalthera.kineticArdena.kineticDovira else { return }
    phase = .cadenceYsolen
  }

  func cadenceBorella() {
    kineticCalthera.kineticArdena.kineticNivora = ""
    phase = .cadenceXavora
  }

  private func bootstrap() async {
    cadenceCyrenia()

    let cadenceIverna = kineticMavrix.cadenceIverna()
    var response: [String: Any]?
    var retry = 0
    var cadenceFendora = 0

    response = await cadenceCelestra(cadenceIverna)
    while response == nil {
      response = await cadenceCelestra(cadenceIverna)
      if response == nil {
        let delay = min(0.5 + Double(min(retry, 3)) * 0.5, 2.0)
        try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        retry += 1
        cadenceFendora += 1
        if cadenceFendora >= 10 && cadenceFendora % 5 == 0 {
          kineticCalthera.kineticArdena.kineticDovira = false
          phase = .cadenceWyrella
          message =
            "The operation failed due to an unexpected network disruption. Please try again soon."
          return
        }
      }
    }

    guard let response,
      let code = response["code"] as? String,
      code == "0000",
      kineticCalthera.kineticArdena.kineticZerelle.contains("iPhone"),
      let result = response["result"] as? [String: Any],
      let openValue = result["openValue"] as? String,
      !openValue.isEmpty
    else {
      kineticCalthera.kineticArdena.kineticDovira = false
      phase = .cadenceWyrella
      return
    }

    kineticCalthera.kineticArdena.kineticDovira = true
    kineticCalthera.kineticArdena.kineticFioren = openValue

    let loginFlag = result["loginFlag"] as? Int ?? 0
    if !kineticCalthera.kineticArdena.kineticNivora.isEmpty && loginFlag == 1 {
      phase = .cadenceYsolen
    } else {
      phase = .cadenceXavora
    }
  }

  private func cadenceCyrenia() {
    _ = rhythmicVessaro()
    kineticLaventh()
    rhythmicLunora()
    rhythmicMeridian()
    rhythmicMirava()
  }

  private func cadenceDamaris() async -> [String: Any]? {
    var cadenceGlyvera: [String: Any]?

    for attempt in 0..<3 {
      cadenceGlyvera = await cadenceCalthera()
      if cadenceElarion(cadenceGlyvera) {
        return cadenceGlyvera
      }

      if attempt < 2 {
        try? await Task.sleep(nanoseconds: UInt64(0.8 * 1_000_000_000))
      }
    }

    return cadenceGlyvera
  }

  private func cadenceElarion(_ response: [String: Any]?) -> Bool {
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

struct cadenceNorvian: View {
  @ObservedObject var coordinator: kineticVirello
  @State private var cadenceIlyssan = false
  @State private var cadenceJunora = true
  @State private var cadenceHavora: [cadenceJovelle] = []

  var body: some View {
    NavigationStack(path: $cadenceHavora) {
      ZStack(alignment: .bottom) {
        cadenceMyrial("Mely_entrybg")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()

        VStack(spacing: 0) {
          Spacer()

          cadencePavelle(cadenceKirella: 116, cadenceLioren: 34)
            .padding(.bottom, 74)

          Button {
            guard !cadenceIlyssan, cadenceJunora else { return }
            cadenceIlyssan = true
            Task {
              await coordinator.cadenceZavelle()
              await MainActor.run {
                cadenceIlyssan = false
              }
            }
          } label: {
            ZStack {
              if cadenceIlyssan {
                ProgressView()
                  .tint(.black)
                // cadenceSylvian()
              } else {
                Text("Start")
                  .font(.system(size: 18, weight: .heavy))
                  .foregroundStyle(.black)
              }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
              Color(red: 0.66, green: 0.92, blue: 0.2).opacity(cadenceJunora ? 1 : 0.45),
              in: RoundedRectangle(cornerRadius: 18)
            )
          }
          .padding(.horizontal, 44)
          .padding(.bottom, 16)
          .buttonStyle(.plain)
          .disabled(!cadenceJunora || cadenceIlyssan)
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
      .navigationDestination(for: cadenceJovelle.self) { route in
        kineticOrvessa(route: route)
      }
    }
  }
}

struct cadenceOphira: View {
  let message: String?

  var body: some View {
    ZStack(alignment: .bottom) {
      cadenceMyrial("Mely_entrybg")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      VStack(spacing: 26) {
        cadencePavelle(cadenceKirella: 116, cadenceLioren: 34)

        cadenceSylvian()
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

private struct cadencePavelle: View {
  let cadenceKirella: CGFloat
  let cadenceLioren: CGFloat

  var body: some View {
    VStack(spacing: 14) {
      cadenceMyrial("Mely_logo")
        .resizable()
        .scaledToFit()
        .frame(width: cadenceKirella, height: cadenceKirella)
        .shadow(color: .black.opacity(0.22), radius: 12, x: 0, y: 8)
        .clipShape(RoundedRectangle(cornerRadius: 26))

      Text("Mely")
        .font(.system(size: cadenceLioren, weight: .black))
        .foregroundStyle(.white)
        .lineLimit(1)
        .minimumScaleFactor(0.78)
    }
  }
}
