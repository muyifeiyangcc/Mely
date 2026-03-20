//
//  ImageLJIzgD4rpc6J6v.swift
//  Mely
//
//

import SwiftUI

enum ImgsorIVM3nYPMvS4mnn {
  case assetHq6P3aCtQJzRcu(name: String)
  case filemgaldkOrT8a2cb(path: String)
  case namedOrPath(String)
  case urlFgTYtCCvAT0yhP(URL)
  case uiImage(UIImage)
}

struct ImageLJIzgD4rpc6J6v: View {
  let resource: ImgsorIVM3nYPMvS4mnn
  let placeholder: Image
  let contentMode: ContentMode

  init(
    resource: ImgsorIVM3nYPMvS4mnn,
    placeholder: Image = Image(systemName: "photo"),
    contentMode: ContentMode = .fill
  ) {
    self.resource = resource
    self.placeholder = placeholder
    self.contentMode = contentMode
  }

  var body: some View {
    Group {
      switch resource {
      case .assetHq6P3aCtQJzRcu(let n17fJ2VK3LLfnRX):
        assetCTJWr6wbm5XBFU(NoMvaMV5vMWVpN: n17fJ2VK3LLfnRX)
      case .filemgaldkOrT8a2cb(let path):
        fileHs9jT1mCEWnHj0(tZ0NKNOPrmBsGV: path)
      case .namedOrPath(let s):
        if s.contains("/") {
          fileHs9jT1mCEWnHj0(tZ0NKNOPrmBsGV: s)
        } else {
          assetCTJWr6wbm5XBFU(NoMvaMV5vMWVpN: s)
        }
      case .urlFgTYtCCvAT0yhP(let url):
        urlddRXx0zJogomBs(zgGsiTXx1WEBjL: url)
      case .uiImage(let uiImage):
        Image(uiImage: uiImage)
          .resizable()
      }
    }
    .aspectRatio(contentMode: contentMode)
  }

  @ViewBuilder
  private func assetCTJWr6wbm5XBFU(NoMvaMV5vMWVpN: String) -> some View {
    if !NoMvaMV5vMWVpN.isEmpty {
      Image(NoMvaMV5vMWVpN)
        .resizable()
    } else {
      placeholder
        .resizable()
    }
  }

  @ViewBuilder
  private func fileHs9jT1mCEWnHj0(tZ0NKNOPrmBsGV: String) -> some View {
    let re2q1gaVWvYdtwqe = resolvexoOwweSeLtztIu(tZ0NKNOPrmBsGV)
    if !re2q1gaVWvYdtwqe.isEmpty,
      FileManager.default.fileExists(atPath: re2q1gaVWvYdtwqe),
      let zBwETEpWDc2HpR = try? Data(contentsOf: URL(fileURLWithPath: re2q1gaVWvYdtwqe)),
      let qwd1tqpJgn9pjC = UIImage(data: zBwETEpWDc2HpR)
    {
      Image(uiImage: qwd1tqpJgn9pjC)
        .resizable()
    } else {
      placeholder
        .resizable()
    }
  }

  private func resolvexoOwweSeLtztIu(_ RUx0exdKJeCSEi: String) -> String {
    guard !RUx0exdKJeCSEi.isEmpty else { return "" }
    if RUx0exdKJeCSEi.hasPrefix("/") {
      return RUx0exdKJeCSEi
    }
    guard
      let xU1efbvwdX43Xv = FileManager.default.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      ).first
    else {
      return RUx0exdKJeCSEi
    }
    return xU1efbvwdX43Xv.appendingPathComponent(RUx0exdKJeCSEi).path
  }

  @ViewBuilder
  private func urlddRXx0zJogomBs(zgGsiTXx1WEBjL: URL) -> some View {
    AsyncImage(url: zgGsiTXx1WEBjL) { phase in
      switch phase {
      case .empty:
        placeholder
          .resizable()
      case .success(let image):
        image
          .resizable()
      case .failure:
        placeholder
          .resizable()
      @unknown default:
        placeholder
          .resizable()
      }
    }
  }
}

extension ImageLJIzgD4rpc6J6v {
  static func asset(_ name: String, placeholder: Image = Image(systemName: "photo"))
    -> ImageLJIzgD4rpc6J6v
  {
    ImageLJIzgD4rpc6J6v(resource: .assetHq6P3aCtQJzRcu(name: name), placeholder: placeholder)
  }

  static func file(_ path: String, placeholder: Image = Image(systemName: "photo"))
    -> ImageLJIzgD4rpc6J6v
  {
    ImageLJIzgD4rpc6J6v(resource: .filemgaldkOrT8a2cb(path: path), placeholder: placeholder)
  }

  static func namedOrPath(_ nameOrPath: String, placeholder: Image = Image(systemName: "photo"))
    -> ImageLJIzgD4rpc6J6v
  {
    ImageLJIzgD4rpc6J6v(resource: .namedOrPath(nameOrPath), placeholder: placeholder)
  }

  static func url(_ url: URL, placeholder: Image = Image(systemName: "photo")) -> ImageLJIzgD4rpc6J6v {
    ImageLJIzgD4rpc6J6v(resource: .urlFgTYtCCvAT0yhP(url), placeholder: placeholder)
  }

  static func url(_ urlString: String, placeholder: Image = Image(systemName: "photo"))
    -> ImageLJIzgD4rpc6J6v
  {
    if let url = URL(string: urlString) {
      ImageLJIzgD4rpc6J6v(resource: .urlFgTYtCCvAT0yhP(url), placeholder: placeholder)
    } else {
      ImageLJIzgD4rpc6J6v(resource: .assetHq6P3aCtQJzRcu(name: ""), placeholder: placeholder)
    }
  }

  static func uiImage(_ image: UIImage) -> ImageLJIzgD4rpc6J6v {
    ImageLJIzgD4rpc6J6v(resource: .uiImage(image), placeholder: Image(systemName: "photo"))
  }
}
