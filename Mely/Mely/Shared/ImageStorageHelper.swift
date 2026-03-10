//
//  ImageStorageHelper.swift
//  Mely
//
//  统一图片持久化存储：保存到 Application Support 子目录，返回相对路径，
//  重启 App 后通过 SmartImageView 解析相对路径为完整路径正确显示。
//

import UIKit

enum ImageStorageHelper {
  /// 聊天图片子目录
  static let chatSubfolder = "ChatImages"
  /// 挑战封面子目录
  static let challengeCoverSubfolder = "ChallengeCovers"
  /// 社区图片子目录（预留）
  static let communitySubfolder = "CommunityImages"

  /// 将图片保存到 Application Support 指定子目录，返回相对路径（如 ChallengeCovers/xxx.jpg）
  /// - Parameters:
  ///   - image: 要保存的图片
  ///   - subfolder: 子目录名
  ///   - filePrefix: 文件名前缀
  ///   - compressionQuality: JPEG 压缩质量 (0–1)
  /// - Returns: 相对路径，失败返回 nil
  static func saveImage(
    _ image: UIImage,
    subfolder: String,
    filePrefix: String = "img",
    compressionQuality: CGFloat = 0.85
  ) -> String? {
    guard let data = image.jpegData(compressionQuality: compressionQuality) else { return nil }

    let fileManager = FileManager.default
    guard
      let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        .first
    else { return nil }

    let folderURL = appSupport.appendingPathComponent(subfolder, isDirectory: true)
    if !fileManager.fileExists(atPath: folderURL.path) {
      try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
    }

    let fileName = "\(filePrefix)_\(UUID().uuidString).jpg"
    let fileURL = folderURL.appendingPathComponent(fileName)
    do {
      try data.write(to: fileURL, options: [.atomic])
      return "\(subfolder)/\(fileName)"
    } catch {
      return nil
    }
  }

  /// 保存聊天图片，返回 ChatImages/xxx.jpg
  static func saveChatImage(_ image: UIImage) -> String? {
    saveImage(image, subfolder: chatSubfolder, filePrefix: "img", compressionQuality: 0.85)
  }

  /// 保存挑战封面，返回 ChallengeCovers/xxx.jpg
  static func saveChallengeCover(_ image: UIImage) -> String? {
    saveImage(image, subfolder: challengeCoverSubfolder, filePrefix: "challenge_cover", compressionQuality: 0.8)
  }

  /// 保存社区图片，返回 CommunityImages/xxx.jpg（预留）
  static func saveCommunityImage(_ image: UIImage) -> String? {
    saveImage(image, subfolder: communitySubfolder, filePrefix: "community", compressionQuality: 0.85)
  }
}
