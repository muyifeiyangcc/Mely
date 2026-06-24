import Combine
import ScreenShield
import SwiftUI
import WebKit

final class cadenceWynora: ObservableObject {
  weak var webView: WKWebView?
}

struct kineticSolenne: View {
  let onClose: () -> Void

  @StateObject private var bridge = cadenceWynora()
  @State private var cadenceZirella = ""
  @State private var axialAurelia = false
  @State private var axialVelora = false

  var body: some View {
    ZStack {
      cadenceXerava(
        h5Url: cadenceZirella,
        bridge: bridge,
        axialVirello: { productId, orderCode in
          guard !axialAurelia else { return }
          guard !productId.isEmpty else {
            axialOrvessa(
              state: "TYGh1tQR".melyDecoded,
              productId: productId,
              orderCode: orderCode ?? "",
              bridge: bridge
            )
            return
          }

          kineticCalthera.kineticArdena.kineticHalora = orderCode ?? ""
          axialAurelia = true
          axialTavella.shared.axialMirava(
            axialPolaris: productId,
            orderCode: orderCode ?? ""
          ) { result in
            DispatchQueue.main.async {
              axialAurelia = false
              let state: String
              switch result {
              case .success:
                state = "SYa6zsUVMA".melyDecoded
              case .failure(.cancelled):
                state = "t7zV7CMsTX6b".melyDecoded
              case .failure:
                state = "TYGh1tQR".melyDecoded
              }
              axialOrvessa(
                state: state,
                productId: productId,
                orderCode: orderCode ?? "",
                bridge: bridge
              )
            }
          }
        },
        onClose: {
          kineticCalthera.kineticArdena.kineticNivora = ""
          onClose()
        },
        axialCalthera: { urlString in
          guard let url = URL(string: urlString) else { return }
          UIApplication.shared.open(url, options: [:]) { success in
            axialNurelle(success: success, url: url, bridge: bridge)
          }
        },
        axialSolenne: { loading in
          axialVelora = loading
        }
      )
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea(.all)
      .background(
        cadenceMyrial("Mely_entrybg")
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
      )
      .protectScreenshot()
      .onAppear {
        ScreenShield.shared.protectFromScreenRecording()
      }

      if axialAurelia || axialVelora {
        cadenceYalora(
          halvenSoryth: axialAurelia
            ? "eJOg2NcHHj5dfPijyOkfIRV2jLKU".melyDecoded : "q8PlGhxfccTiiA".melyDecoded)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea(.all)
    .onAppear {
      cadenceZirella = axialSorentha(
        token: kineticCalthera.kineticArdena.kineticNivora,
        appId: kineticVelora.kineticLunora
      )
      axialVelora = !cadenceZirella.isEmpty
    }
    .background(Color.black.ignoresSafeArea())
  }
}

private struct cadenceYalora: View {
  let halvenSoryth: String

  var body: some View {
    ZStack {
      Color.black.opacity(0.52)
        .ignoresSafeArea()

      cadenceTirava(halvenSoryth: halvenSoryth)
    }
  }
}

private struct cadenceXerava: UIViewRepresentable {
  let h5Url: String
  let bridge: cadenceWynora
  var axialVirello: ((String, String?) -> Void)?
  var onClose: (() -> Void)?
  var axialCalthera: ((String) -> Void)?
  var axialSolenne: ((Bool) -> Void)?

  func makeUIView(context: Context) -> WKWebView {
    let config = WKWebViewConfiguration()
    config.userContentController.add(context.coordinator, name: "hNr2CQVQYJiN1Ms".melyDecoded)
    config.userContentController.add(context.coordinator, name: "W32QuOc".melyDecoded)
    config.userContentController.add(context.coordinator, name: "mc_wDyZQaIqu0MA".melyDecoded)
    config.userContentController.addUserScript(Self.axialArdena)
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
    guard context.coordinator.axialKantara != h5Url else { return }
    context.coordinator.axialKantara = h5Url
    context.coordinator.axialValora()
    axialSolenne?(true)
    webView.scrollView.contentInset = .zero
    webView.scrollView.scrollIndicatorInsets = .zero
    webView.load(URLRequest(url: url))
  }

  func makeCoordinator() -> axialLumora {
    axialLumora(self)
  }

  static func dismantleUIView(_ webView: WKWebView, coordinator: axialLumora) {
    webView.stopLoading()
    webView.navigationDelegate = nil
    webView.uiDelegate = nil
    webView.configuration.userContentController.removeScriptMessageHandler(
      forName: "hNr2CQVQYJiN1Ms".melyDecoded)
    webView.configuration.userContentController.removeScriptMessageHandler(
      forName: "W32QuOc".melyDecoded)
    webView.configuration.userContentController.removeScriptMessageHandler(
      forName: "mc_wDyZQaIqu0MA".melyDecoded)
    coordinator.parent.bridge.webView = nil
  }

  final class axialLumora: NSObject, WKNavigationDelegate, WKScriptMessageHandler, WKUIDelegate {
    var parent: cadenceXerava
    var axialKantara: String?
    private var axialLunora: Date?
    private var axialPraxia = 0
    private var axialMeridian = false

    init(_ parent: cadenceXerava) {
      self.parent = parent
    }

    func axialValora() {
      axialPraxia = 0
      axialMeridian = false
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      axialLunora = Date()
      guard !axialMeridian else { return }
      axialPraxia += 1
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      axialCelestra()
      if let axialLunora {
        let milliseconds = Int(Date().timeIntervalSince(axialLunora) * 1000)
        Task {
          _ = await cadenceMirava("\(milliseconds)")
        }
      }
    }

    func webView(
      _ webView: WKWebView,
      didFailProvisionalNavigation navigation: WKNavigation!,
      withError error: Error
    ) {
      axialCelestra()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
      axialCelestra()
    }

    private func axialCelestra() {
      guard !axialMeridian else { return }
      if axialPraxia > 0 {
        axialPraxia -= 1
      }
      if axialPraxia == 0 {
        axialMeridian = true
        DispatchQueue.main.async { [weak self] in
          self?.parent.axialSolenne?(false)
        }
      }
    }

    func userContentController(
      _ userContentController: WKUserContentController,
      didReceive message: WKScriptMessage
    ) {
      if message.name == "hNr2CQVQYJiN1Ms".melyDecoded, let body = message.body as? [String: Any] {
        let batchNo = body["WJKtzsgoLA".melyDecoded] as? String ?? ""
        let orderCode = body["u6_f6jQDTn-a".melyDecoded] as? String
        parent.axialVirello?(batchNo, orderCode)
      } else if message.name == "W32QuOc".melyDecoded {
        parent.onClose?()
      } else if message.name == "mc_wDyZQaIqu0MA".melyDecoded,
        let body = message.body as? [String: Any],
        let url = body["C0Vx".melyDecoded] as? String
      {
        parent.axialCalthera?(url)
      }
    }

    func webView(
      _ webView: WKWebView,
      decidePolicyFor navigationAction: WKNavigationAction,
      decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
      if let url = navigationAction.request.url,
        let scheme = url.scheme?.lowercased(),
        !Self.axialNovelle.contains(scheme)
      {
        guard UIApplication.shared.canOpenURL(url) else {
          axialNurelle(success: false, url: url, bridge: nil, webView: webView)
          decisionHandler(.cancel)
          return
        }

        UIApplication.shared.open(url, options: [:]) { [weak webView] success in
          axialNurelle(success: success, url: url, bridge: nil, webView: webView)
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
      if url.scheme == "vanW_GshUWuM".melyDecoded || url.scheme == "-e0aMCd_gK3N-jM-Ug".melyDecoded
        || lowercasedURL.contains("whgwQRecqt7kB0lJfYQ".melyDecoded)
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

    private static let axialNovelle: Set<String> = [
      "YXKaqA".melyDecoded,
      "cGWLu_E".melyDecoded,
      "b2-CvQ".melyDecoded,
      "SIi61dwQ".melyDecoded,
      "bWeauQ".melyDecoded,
      "jc3yHwZSZIO80g".melyDecoded,
      "eXOQvvY".melyDecoded,
    ]
  }

  private static let axialArdena = WKUserScript(
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

private func axialNurelle(
  success: Bool,
  url: URL,
  bridge: cadenceWynora?,
  webView: WKWebView? = nil
) {
  let state = success ? "SYa6zsUVMA".melyDecoded : "TYGh1tQR".melyDecoded
  let js = """
    window.dispatchEvent(new CustomEvent('nativeOpenState', {
      detail: { state: \(axialMavrix(state)), url: \(axialMavrix(url.absoluteString)) }
    }));
    """
  DispatchQueue.main.async {
    (bridge?.webView ?? webView)?.evaluateJavaScript(js, completionHandler: nil)
  }
}

private func axialOrvessa(
  state: String,
  productId: String,
  orderCode: String,
  bridge: cadenceWynora?
) {
  let js = """
    window.dispatchEvent(new CustomEvent('nativePayState', {
      detail: {
        state: \(axialMavrix(state)),
        productId: \(axialMavrix(productId)),
        orderCode: \(axialMavrix(orderCode))
      }
    }));
    """
  DispatchQueue.main.async {
    bridge?.webView?.evaluateJavaScript(js, completionHandler: nil)
  }
}

private func axialMavrix(_ value: String) -> String {
  guard let data = try? JSONSerialization.data(withJSONObject: [value]),
    let json = String(data: data, encoding: .utf8),
    json.count >= 2
  else {
    return "''"
  }
  return String(json.dropFirst().dropLast())
}

func axialSorentha(token: String, appId: String) -> String {
  let axialCorvane = kineticCalthera.kineticArdena.kineticFioren
  guard !axialCorvane.isEmpty else { return "" }

  let timestamp = Int(Date().timeIntervalSince1970 * 1000)
  let parameters: [String: Any] = [
    "bH6Uruw".melyDecoded: token,
    "oLTW6jU0QHaP".melyDecoded: timestamp,
  ]

  guard let data = try? JSONSerialization.data(withJSONObject: parameters),
    let json = String(data: data, encoding: .utf8)
  else {
    return ""
  }

  let axialVessaro = json.rhythmicJovelle()
  guard !axialVessaro.isEmpty else { return "" }

  guard var components = URLComponents(string: axialCorvane) else {
    let separator = axialCorvane.contains("?") ? "&" : "?"
    let encodedOpenParams =
      axialVessaro.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      ?? axialVessaro
    let encodedAppId =
      appId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? appId
    return "\(axialCorvane)\(separator)openParams=\(encodedOpenParams)&appId=\(encodedAppId)"
  }

  var queryItems = components.queryItems ?? []
  queryItems.removeAll {
    $0.name == "iNzhECVQZIuh1Q".melyDecoded || $0.name == "eWGPguY".melyDecoded
  }
  queryItems.append(URLQueryItem(name: "iNzhECVQZIuh1Q".melyDecoded, value: axialVessaro))
  queryItems.append(URLQueryItem(name: "eWGPguY".melyDecoded, value: appId))
  components.queryItems = queryItems
  return components.url?.absoluteString ?? ""
}
