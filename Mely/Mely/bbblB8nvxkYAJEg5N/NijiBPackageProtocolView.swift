import SwiftUI
import WebKit

enum NijiBPackageProtocolRoute: Hashable {
  case userAgreement
  case privacyPolicy

  var title: String {
    switch self {
    case .userAgreement:
      return "User Agreement"
    case .privacyPolicy:
      return "Privacy Policy"
    }
  }

  var urlString: String {
    switch self {
    case .userAgreement:
      return YsiEKXme5hwjDT.kNijiBUserAgreementURL
    case .privacyPolicy:
      return YsiEKXme5hwjDT.kNijiBPrivacyPolicyURL
    }
  }
}

struct NijiBPackageProtocolView: View {
  let route: NijiBPackageProtocolRoute
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ZStack {
      naventhFittinglog("Mely_entrybg")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .font(.system(size: 18, weight: .semibold))
              .foregroundStyle(.white)
              .frame(width: 44, height: 44)
          }
          .buttonStyle(.plain)

          Spacer()

          Text(route.title)
            .font(.system(size: 18, weight: .bold))
            .foregroundStyle(.white)

          Spacer()

          Color.clear
            .frame(width: 44, height: 44)
        }
        .padding(.horizontal, 10)
        .padding(.top, 10)

        if let url = URL(string: route.urlString) {
          NijiBProtocolWebView(url: url)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .padding(.horizontal, 14)
            .padding(.bottom, 14)
        } else {
          Spacer()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

private struct NijiBProtocolWebView: UIViewRepresentable {
  let url: URL

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.isOpaque = false
    webView.backgroundColor = .clear
    webView.load(URLRequest(url: url))
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {}
}
