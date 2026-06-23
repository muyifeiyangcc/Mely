import SwiftUI

struct NijiABRootView: View {
  @StateObject private var coordinator = NijiBPackageCoordinator()

  var body: some View {
    Group {
      switch coordinator.phase {
      case .checking:
        NijiBPackageBootstrapView(message: coordinator.message)

      case .aPackage:
        AppRootView()

      case .bLogin:
        NijiBPackageGateView(coordinator: coordinator)

      case .bWeb:
        NijiBPackageH5Screen {
          coordinator.closeBWeb()
        }
      }
    }
    .onAppear {
      coordinator.start()
    }
  }
}
