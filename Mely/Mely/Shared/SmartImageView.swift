//
//  SmartImageView.swift
//  Mely
//
//  公共智能图片展示组件，根据资源类型自动选择加载方式并正确显示。
//

import SwiftUI

// MARK: - 图片资源类型

enum ImageResource {
  /// 本地 Asset 资源名
  case asset(name: String)
  /// 本地文件路径（如聊天图片持久化路径）
  case file(path: String)
  /// 远程网络 URL
  case url(URL)
  /// 已加载的 UIImage
  case uiImage(UIImage)
}

// MARK: - 智能图片视图

struct SmartImageView: View {
  let resource: ImageResource
  let placeholder: Image
  let contentMode: ContentMode

  init(
    resource: ImageResource,
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
      case .asset(let name):
        assetImage(name: name)
      case .file(let path):
        fileImage(path: path)
      case .url(let url):
        urlImage(url: url)
      case .uiImage(let uiImage):
        Image(uiImage: uiImage)
          .resizable()
      }
    }
    .aspectRatio(contentMode: contentMode)
  }

  @ViewBuilder
  private func assetImage(name: String) -> some View {
    if !name.isEmpty {
      Image(name)
        .resizable()
    } else {
      placeholder
        .resizable()
    }
  }

  @ViewBuilder
  private func fileImage(path: String) -> some View {
    let resolvedPath = resolveImagePath(path)
    if !resolvedPath.isEmpty,
      FileManager.default.fileExists(atPath: resolvedPath),
      let data = try? Data(contentsOf: URL(fileURLWithPath: resolvedPath)),
      let uiImage = UIImage(data: data)
    {
      Image(uiImage: uiImage)
        .resizable()
    } else {
      placeholder
        .resizable()
    }
  }

  /// 解析图片路径：绝对路径直接使用；相对路径（如 ChatImages/xxx.jpg）解析为 Application Support 下的完整路径（兼容旧数据中的绝对路径）
  private func resolveImagePath(_ path: String) -> String {
    guard !path.isEmpty else { return "" }
    if path.hasPrefix("/") {
      return path
    }
    guard
      let appSupport = FileManager.default.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      ).first
    else {
      return path
    }
    return appSupport.appendingPathComponent(path).path
  }

  @ViewBuilder
  private func urlImage(url: URL) -> some View {
    AsyncImage(url: url) { phase in
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

// MARK: - 便捷构造

extension SmartImageView {
  /// Asset 资源
  static func asset(_ name: String, placeholder: Image = Image(systemName: "photo"))
    -> SmartImageView
  {
    SmartImageView(resource: .asset(name: name), placeholder: placeholder)
  }

  /// 本地文件路径
  static func file(_ path: String, placeholder: Image = Image(systemName: "photo"))
    -> SmartImageView
  {
    SmartImageView(resource: .file(path: path), placeholder: placeholder)
  }

  /// 远程 URL
  static func url(_ url: URL, placeholder: Image = Image(systemName: "photo")) -> SmartImageView {
    SmartImageView(resource: .url(url), placeholder: placeholder)
  }

  /// 远程 URL 字符串
  static func url(_ urlString: String, placeholder: Image = Image(systemName: "photo"))
    -> SmartImageView
  {
    if let url = URL(string: urlString) {
      SmartImageView(resource: .url(url), placeholder: placeholder)
    } else {
      SmartImageView(resource: .asset(name: ""), placeholder: placeholder)
    }
  }

  /// UIImage
  static func uiImage(_ image: UIImage) -> SmartImageView {
    SmartImageView(resource: .uiImage(image), placeholder: Image(systemName: "photo"))
  }
}
