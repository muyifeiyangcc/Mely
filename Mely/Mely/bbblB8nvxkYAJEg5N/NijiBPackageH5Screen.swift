import Combine
import ScreenShield
import SwiftUI
import WebKit

final class NijiBWebViewBridge: ObservableObject {
  weak var webView: WKWebView?
}

struct NijiBPackageH5Screen: View {
  let onClose: () -> Void

  @StateObject private var bridge = NijiBWebViewBridge()
  @State private var stableBPackageH5Url = ""
  @State private var isPaying = false
  @State private var isLoading = false

  var body: some View {
    ZStack {
      NijiBPackageWebView(
        h5Url: stableBPackageH5Url,
        bridge: bridge,
        onRecharge: { productId, orderCode in
          guard !isPaying else { return }
          guard !productId.isEmpty else {
            dispatchNativePayState(
              state: "failed",
              productId: productId,
              orderCode: orderCode ?? "",
              bridge: bridge
            )
            return
          }

          Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.JV3d43Ycl3Wgtc = orderCode ?? ""
          isPaying = true
          qrenthavoliaMuxiron.shared.bPackagePurchase(
            lavqoraThreadfray: productId,
            orderCode: orderCode ?? ""
          ) { result in
            DispatchQueue.main.async {
              isPaying = false
              let state: String
              switch result {
              case .success:
                state = "success"
              case .failure(.cancelled):
                state = "cancelled"
              case .failure:
                state = "failed"
              }
              dispatchNativePayState(
                state: state,
                productId: productId,
                orderCode: orderCode ?? "",
                bridge: bridge
              )
            }
          }
        },
        onClose: {
          Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2 = ""
          onClose()
        },
        onOpenBrowser: { urlString in
          guard let url = URL(string: urlString) else { return }
          UIApplication.shared.open(url, options: [:]) { success in
            dispatchNativeOpenState(success: success, url: url, bridge: bridge)
          }
        },
        onInitialPageLoadingChange: { loading in
          isLoading = loading
        }
      )
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea(.all)
      .background(
        naventhFittinglog("Mely_entrybg")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
      )
      .protectScreenshot()
      .onAppear {
        ScreenShield.shared.protectFromScreenRecording()
      }

      if isPaying || isLoading {
        NijiBPackageH5LoadingOverlay(message: isPaying ? "Processing payment..." : "Loading...")
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea(.all)
    .onAppear {
      stableBPackageH5Url = makeWpymRM0gTasmCqUrl(
        token: Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.b6SDEUq4VuocYY2,
        appId: YsiEKXme5hwjDT.K3REgIlXHz6uy0
      )
      isLoading = !stableBPackageH5Url.isEmpty
    }
    .background(Color.black.ignoresSafeArea())
  }
}

private struct NijiBPackageH5LoadingOverlay: View {
  let message: String

  var body: some View {
    ZStack {
      Color.black.opacity(0.52)
        .ignoresSafeArea()

      NijiBPackageLoadingPanel(message: message)
    }
  }
}

private struct NijiBPackageWebView: UIViewRepresentable {
  let h5Url: String
  let bridge: NijiBWebViewBridge
  var onRecharge: ((String, String?) -> Void)?
  var onClose: (() -> Void)?
  var onOpenBrowser: ((String) -> Void)?
  var onInitialPageLoadingChange: ((Bool) -> Void)?

  func makeUIView(context: Context) -> WKWebView {
    let config = WKWebViewConfiguration()
    config.userContentController.add(context.coordinator, name: "rechargePay")
    config.userContentController.add(context.coordinator, name: "Close")
    config.userContentController.add(context.coordinator, name: "openBrowser")
    config.userContentController.addUserScript(Self.viewportFitScript)
    config.mediaTypesRequiringUserActionForPlayback = []
    config.allowsInlineMediaPlayback = true

    let webView = WKWebView(frame: .zero, configuration: config)
    webView.navigationDelegate = context.coordinator
    webView.uiDelegate = context.coordinator
    webView.isOpaque = false
    webView.backgroundColor = .clear
    webView.scrollView.backgroundColor = .clear
    webView.scrollView.contentInsetAdjustmentBehavior = .never
    webView.scrollView.contentInset = .zero
    webView.scrollView.scrollIndicatorInsets = .zero
    webView.scrollView.automaticallyAdjustsScrollIndicatorInsets = false
    webView.allowsBackForwardNavigationGestures = true
    bridge.webView = webView
    return webView
  }

  func updateUIView(_ webView: WKWebView, context: Context) {
    context.coordinator.parent = self
    guard !h5Url.isEmpty, let url = URL(string: h5Url) else { return }
    guard context.coordinator.lastLoadedH5UrlString != h5Url else { return }
    context.coordinator.lastLoadedH5UrlString = h5Url
    context.coordinator.resetInitialDocumentLoadTracking()
    onInitialPageLoadingChange?(true)
    webView.scrollView.contentInset = .zero
    webView.scrollView.scrollIndicatorInsets = .zero
    webView.load(URLRequest(url: url))
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  static func dismantleUIView(_ webView: WKWebView, coordinator: Coordinator) {
    webView.stopLoading()
    webView.navigationDelegate = nil
    webView.uiDelegate = nil
    webView.configuration.userContentController.removeScriptMessageHandler(forName: "rechargePay")
    webView.configuration.userContentController.removeScriptMessageHandler(forName: "Close")
    webView.configuration.userContentController.removeScriptMessageHandler(forName: "openBrowser")
    coordinator.parent.bridge.webView = nil
  }

  final class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {
    var parent: NijiBPackageWebView
    var lastLoadedH5UrlString: String?
    private var loadingStartTime: Date?
    private var initialDocNavPendingCount = 0
    private var initialDocumentLoadFinished = false

    init(_ parent: NijiBPackageWebView) {
      self.parent = parent
    }

    func resetInitialDocumentLoadTracking() {
      initialDocNavPendingCount = 0
      initialDocumentLoadFinished = false
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      loadingStartTime = Date()
      guard !initialDocumentLoadFinished else { return }
      initialDocNavPendingCount += 1
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      finishInitialDocumentLoadIfNeeded()
      if let loadingStartTime {
        let milliseconds = Int(Date().timeIntervalSince(loadingStartTime) * 1000)
        Task {
          _ = await D1T6cyxmX4SeSx("\(milliseconds)")
        }
      }
    }

    func webView(
      _ webView: WKWebView,
      didFailProvisionalNavigation navigation: WKNavigation!,
      withError error: Error
    ) {
      finishInitialDocumentLoadIfNeeded()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      finishInitialDocumentLoadIfNeeded()
    }

    private func finishInitialDocumentLoadIfNeeded() {
      guard !initialDocumentLoadFinished else { return }
      if initialDocNavPendingCount > 0 {
        initialDocNavPendingCount -= 1
      }
      if initialDocNavPendingCount == 0 {
        initialDocumentLoadFinished = true
        DispatchQueue.main.async { [weak self] in
          self?.parent.onInitialPageLoadingChange?(false)
        }
      }
    }

    func userContentController(
      _ userContentController: WKUserContentController,
      didReceive message: WKScriptMessage
    ) {
      if message.name == "rechargePay", let body = message.body as? [String: Any] {
        let batchNo = body["batchNo"] as? String ?? ""
        let orderCode = body["orderCode"] as? String
        parent.onRecharge?(batchNo, orderCode)
      } else if message.name == "Close" {
        parent.onClose?()
      } else if message.name == "openBrowser",
        let body = message.body as? [String: Any],
        let url = body["url"] as? String
      {
        parent.onOpenBrowser?(url)
      }
    }

    func webView(
      _ webView: WKWebView,
      decidePolicyFor navigationAction: WKNavigationAction,
      decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
      if let url = navigationAction.request.url,
        let scheme = url.scheme?.lowercased(),
        !Self.allowedWebSchemes.contains(scheme)
      {
        guard UIApplication.shared.canOpenURL(url) else {
          dispatchNativeOpenState(success: false, url: url, bridge: nil, webView: webView)
          decisionHandler(.cancel)
          return
        }

        UIApplication.shared.open(url, options: [:]) { [weak webView] success in
          dispatchNativeOpenState(success: success, url: url, bridge: nil, webView: webView)
        }

        decisionHandler(.cancel)
        return
      }

      decisionHandler(.allow)
    }

    func webView(
      _ webView: WKWebView,
      createWebViewWith configuration: WKWebViewConfiguration,
      for navigationAction: WKNavigationAction,
      windowFeatures: WKWindowFeatures
    ) -> WKWebView? {
      guard let url = navigationAction.request.url else { return nil }
      let lowercasedURL = url.absoluteString.lowercased()
      if url.scheme == "itms-apps" || url.scheme == "itms-services"
        || lowercasedURL.contains("apps.apple.com")
      {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        return nil
      }
      webView.load(URLRequest(url: url))
      return nil
    }

    func webView(
      _ webView: WKWebView,
      requestMediaCapturePermissionFor origin: WKSecurityOrigin,
      initiatedByFrame frame: WKFrameInfo,
      type: WKMediaCaptureType,
      decisionHandler: @escaping (WKPermissionDecision) -> Void
    ) {
      decisionHandler(.grant)
    }

    private static let allowedWebSchemes: Set<String> = [
      "http",
      "https",
      "file",
      "chrome",
      "data",
      "javascript",
      "about",
    ]
  }

  private static let viewportFitScript = WKUserScript(
    source: """
      (function() {
        var viewport = document.querySelector('meta[name="viewport"]');
        if (!viewport) {
          viewport = document.createElement('meta');
          viewport.name = 'viewport';
          document.head.appendChild(viewport);
        }
        var content = viewport.getAttribute('content') || 'width=device-width,initial-scale=1.0';
        if (content.indexOf('viewport-fit=cover') === -1) {
          viewport.setAttribute('content', content + ',viewport-fit=cover');
        }
      })();
      """,
    injectionTime: .atDocumentEnd,
    forMainFrameOnly: true
  )
}

private func dispatchNativeOpenState(
  success: Bool,
  url: URL,
  bridge: NijiBWebViewBridge?,
  webView: WKWebView? = nil
) {
  let state = success ? "success" : "failed"
  let js = """
    window.dispatchEvent(new CustomEvent('nativeOpenState', {
      detail: { state: \(jsStringLiteral(state)), url: \(jsStringLiteral(url.absoluteString)) }
    }));
    """
  DispatchQueue.main.async {
    (bridge?.webView ?? webView)?.evaluateJavaScript(js, completionHandler: nil)
  }
}

private func dispatchNativePayState(
  state: String,
  productId: String,
  orderCode: String,
  bridge: NijiBWebViewBridge?
) {
  let js = """
    window.dispatchEvent(new CustomEvent('nativePayState', {
      detail: {
        state: \(jsStringLiteral(state)),
        productId: \(jsStringLiteral(productId)),
        orderCode: \(jsStringLiteral(orderCode))
      }
    }));
    """
  DispatchQueue.main.async {
    bridge?.webView?.evaluateJavaScript(js, completionHandler: nil)
  }
}

private func jsStringLiteral(_ value: String) -> String {
  guard let data = try? JSONSerialization.data(withJSONObject: [value]),
    let json = String(data: data, encoding: .utf8),
    json.count >= 2
  else {
    return "''"
  }
  return String(json.dropFirst().dropLast())
}

func makeWpymRM0gTasmCqUrl(token: String, appId: String) -> String {
  let baseURL = Wh3c0ZV6FTFqvB.aNT8kOCU1Maq6i.CAqfqQU9UDXl5X
  guard !baseURL.isEmpty else { return "" }

  let timestamp = Int(Date().timeIntervalSince1970 * 1000)
  let parameters: [String: Any] = [
    "token": token,
    "timestamp": timestamp,
  ]

  guard let data = try? JSONSerialization.data(withJSONObject: parameters),
    let json = String(data: data, encoding: .utf8)
  else {
    return ""
  }

  let encryptedOpenParams = json.WWGIHbPmnwRheh()
  guard !encryptedOpenParams.isEmpty else { return "" }

  guard var components = URLComponents(string: baseURL) else {
    let separator = baseURL.contains("?") ? "&" : "?"
    let encodedOpenParams =
      encryptedOpenParams.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      ?? encryptedOpenParams
    let encodedAppId =
      appId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? appId
    return "\(baseURL)\(separator)openParams=\(encodedOpenParams)&appId=\(encodedAppId)"
  }

  var queryItems = components.queryItems ?? []
  queryItems.removeAll { $0.name == "openParams" || $0.name == "appId" }
  queryItems.append(URLQueryItem(name: "openParams", value: encryptedOpenParams))
  queryItems.append(URLQueryItem(name: "appId", value: appId))
  components.queryItems = queryItems
  return components.url?.absoluteString ?? ""
}
