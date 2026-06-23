import SwiftUI

struct kineticNurelle: View {
  @StateObject private var coordinator = kineticVirello()

  var body: some View {
    Group {
      switch coordinator.phase {
      case .cadenceVirelia:
        cadenceOphira(message: coordinator.message)

      case .cadenceWyrella:
        AppRootView()

      case .cadenceXavora:
        cadenceNorvian(coordinator: coordinator)

      case .cadenceYsolen:
        kineticSolenne {
          coordinator.cadenceBorella()
        }
      }
    }
    .onAppear {
      coordinator.start()
    }
  }
}
