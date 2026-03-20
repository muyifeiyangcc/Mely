//
//  WebProtocolView.swift
//  Mely
//
//

import SwiftUI
import WebKit

struct WebProtocolView: View {
  let urlsVN4aXHEEFJRMv: String
  var titGM8TgIi65xSys5: String = "User Agreement"

  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        TopBLMs4aEB1cnGp9bar(ttYl57M7uFheos3o: titGM8TgIi65xSys5, onfanGroV0pgM1ABvRj: { dismiss() })
          .padding(.top, 50)

        if let url = URL(string: urlsVN4aXHEEFJRMv) {
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

private struct WebView: UIViewRepresentable {
  let url: URL

  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.load(URLRequest(url: url))
    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {}
}
