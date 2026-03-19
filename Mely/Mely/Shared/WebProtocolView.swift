//
//  WebProtocolView.swift
//  Mely
//
//  协议页面：顶部 TopBar + H5 WebView，根据 urlString 显示网页内容
//

import SwiftUI
import WebKit

struct WebProtocolView: View {
  let urlString: String
  var title: String = "User Agreement"

  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]  // 保留以兼容调用方传递 path

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        MelyTopBarView(title: title, onBack: { dismiss() })
          .padding(.top, 50)

        if let url = URL(string: urlString) {
          WebView(url: url)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
          VStack(spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
              .font(.system(size: 40))
              .foregroundColor(.orange)
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
      }
      .ignoresSafeArea()
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }
}

// MARK: - WebView
private struct WebView: UIViewRepresentable {
  let url: URL

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.load(URLRequest(url: url))
    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {}
}
