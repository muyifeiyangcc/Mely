//
//  ImageStorageHelper.swift
//  Mely
//
//  统一图片持久化存储：保存到 Application Support 子目录，返回相对路径，
//  重启 App 后通过 SmartImageView 解析相对路径为完整路径正确显示。
//

import AVFoundation
import UIKit

enum ImageStorageHelper {
  /// 聊天图片子目录
  static let chatSubfolder = "ChatImages"
  /// 挑战封面子目录
  static let challengeCoverSubfolder = "ChallengeCovers"
  /// 社区图片子目录（预留）
  static let communitySubfolder = "CommunityImages"
  /// 用户头像子目录
  static let avatarSubfolder = "AvatarImages"

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
    saveImage(
      image, subfolder: challengeCoverSubfolder, filePrefix: "challenge_cover",
      compressionQuality: 0.8)
  }

  /// 保存社区图片，返回 CommunityImages/xxx.jpg（预留）
  static func saveCommunityImage(_ image: UIImage) -> String? {
    saveImage(
      image, subfolder: communitySubfolder, filePrefix: "community", compressionQuality: 0.85)
  }

  /// 保存用户头像，返回 AvatarImages/xxx.jpg
  static func saveAvatarImage(_ image: UIImage) -> String? {
    saveImage(image, subfolder: avatarSubfolder, filePrefix: "avatar", compressionQuality: 0.9)
  }

  // MARK: - 挑战视频存储

  /// 挑战视频文件子目录
  static let challengeVideoSubfolder = "ChallengeVideos"
  /// 挑战视频封面子目录
  static let challengeVideoThumbSubfolder = "ChallengeVideoThumbnails"

  /// 将视频文件复制到 Application Support 指定子目录，返回相对路径（如 ChallengeVideos/xxx.mp4）
  static func saveVideo(from sourceURL: URL, subfolder: String = challengeVideoSubfolder) -> String?
  {
    let fileManager = FileManager.default
    guard
      let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        .first
    else { return nil }

    let folderURL = appSupport.appendingPathComponent(subfolder, isDirectory: true)
    if !fileManager.fileExists(atPath: folderURL.path) {
      try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
    }

    let ext = sourceURL.pathExtension.isEmpty ? "mp4" : sourceURL.pathExtension
    let fileName = "\(UUID().uuidString).\(ext)"
    let destURL = folderURL.appendingPathComponent(fileName)

    do {
      if fileManager.fileExists(atPath: destURL.path) { try fileManager.removeItem(at: destURL) }
      try fileManager.copyItem(at: sourceURL, to: destURL)
      return "\(subfolder)/\(fileName)"
    } catch {
      return nil
    }
  }

  /// 保存挑战视频封面，返回 ChallengeVideoThumbnails/xxx.jpg
  static func saveChallengeVideoThumbnail(_ image: UIImage) -> String? {
    saveImage(
      image,
      subfolder: challengeVideoThumbSubfolder,
      filePrefix: "thumb",
      compressionQuality: 0.8
    )
  }

  /// 从视频 URL 生成封面图（取第一帧）
  static func generateThumbnail(from videoURL: URL) -> UIImage? {
    let asset = AVAsset(url: videoURL)
    let generator = AVAssetImageGenerator(asset: asset)
    generator.appliesPreferredTrackTransform = true
    generator.maximumSize = CGSize(width: 640, height: 640)
    let time = CMTime(seconds: 0, preferredTimescale: 600)
    do {
      let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
      return UIImage(cgImage: cgImage)
    } catch {
      return nil
    }
  }

  /// 删除 Application Support 下的文件（相对路径如 ChatImages/xxx.jpg、ChallengeVideos/xxx.mp4）
  /// 绝对路径或以 / 开头的路径会直接尝试删除
  static func deleteFileIfExists(relativePath: String) {
    guard !relativePath.isEmpty else { return }
    let fileManager = FileManager.default
    let fileURL: URL
    if relativePath.hasPrefix("/") {
      fileURL = URL(fileURLWithPath: relativePath)
    } else if relativePath.contains("/"),
      let appSupport = fileManager.urls(
        for: .applicationSupportDirectory,
        in: .userDomainMask
      ).first
    {
      fileURL = appSupport.appendingPathComponent(relativePath)
    } else {
      return  // Bundle 资源名，不删除
    }
    try? fileManager.removeItem(at: fileURL)
  }

  /// 根据相对路径解析为视频完整 URL（支持 Bundle 和 Application Support）
  static func resolveVideoURL(_ pathOrName: String) -> URL? {
    guard !pathOrName.isEmpty else { return nil }
    // 绝对路径
    if pathOrName.hasPrefix("/") {
      let url = URL(fileURLWithPath: pathOrName)
      return FileManager.default.fileExists(atPath: pathOrName) ? url : nil
    }
    // Application Support 相对路径（如 ChallengeVideos/xxx.mp4）
    if pathOrName.contains("/") {
      guard
        let appSupport = FileManager.default.urls(
          for: .applicationSupportDirectory,
          in: .userDomainMask
        ).first
      else { return nil }
      let fullURL = appSupport.appendingPathComponent(pathOrName)
      return FileManager.default.fileExists(atPath: fullURL.path) ? fullURL : nil
    }
    return nil
  }
}
