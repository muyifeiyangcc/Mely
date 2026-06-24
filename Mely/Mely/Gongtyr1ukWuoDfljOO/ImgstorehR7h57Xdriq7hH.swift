//
//  ImgstorehR7h57Xdriq7hH.swift
//  Mely
//
//

import AVFoundation
import UIKit

enum ImgstorehR7h57Xdriq7hH {
  static let oQ3fsAfxkDIWTp = "pMTlCjxcd42p1Q".melyDecoded
  static let mb3B5y1BeDC3eJ = "8RMwSUSLpdb8MhlLZoin".melyDecoded
  static let syHYqDcBFtHrKF = "8RQ8SF2AosXgOBtcZJ-n".melyDecoded
  static let eFd6vtNuvYmneB = "wPgHJHphvaHL4yQ7".melyDecoded

  static func savimgbne4fXigVmSRtp(
    _ image: UIImage,
    subfolder: String,
    filePrefix: String = "F1p6".melyDecoded,
    compressionQuality: CGFloat = 0.85
  ) -> String? {
    guard let d5oUtnVEy8er8Yt = image.jpegData(compressionQuality: compressionQuality) else {
      return nil
    }

    let LMEE2Y0iMpKHQE = FileManager.default
    guard
      let LEcsgrZHZZ9jM5 = LMEE2Y0iMpKHQE.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      )
      .first
    else { return nil }

    let w1wgEzkmbOgEnG = LEcsgrZHZZ9jM5.appendingPathComponent(subfolder, isDirectory: true)
    if !LMEE2Y0iMpKHQE.fileExists(atPath: w1wgEzkmbOgEnG.path) {
      try? LMEE2Y0iMpKHQE.createDirectory(at: w1wgEzkmbOgEnG, withIntermediateDirectories: true)
    }

    let bulnZCWMerYOUr = "\(filePrefix)" + "Aw".melyDecoded + "\(UUID().uuidString)" + "J2yevw".melyDecoded
    let P9FHUYPQ39gJo6 = w1wgEzkmbOgEnG.appendingPathComponent(bulnZCWMerYOUr)
    do {
      try d5oUtnVEy8er8Yt.write(to: P9FHUYPQ39gJo6, options: [.atomic])
      return "\(subfolder)/\(bulnZCWMerYOUr)"
    } catch {
      return nil
    }
  }

  static func savcfq5cmlzAagRNzO(_ image: UIImage) -> String? {
    savimgbne4fXigVmSRtp(
      image, subfolder: oQ3fsAfxkDIWTp, filePrefix: "F1p6".melyDecoded, compressionQuality: 0.85)
  }

  static func sachalb07MaCxHrhsdB(_ image: UIImage) -> String? {
    savimgbne4fXigVmSRtp(
      image, subfolder: mb3B5y1BeDC3eJ, filePrefix: "0RMwSUSLpdb8LhVSdZ-m".melyDecoded,
      compressionQuality: 0.8)
  }

  static func sacomel7R9zQDzdjyGY(_ image: UIImage) -> String? {
    savimgbne4fXigVmSRtp(
      image, subfolder: syHYqDcBFtHrKF, filePrefix: "t7LW4jMuSG-G".melyDecoded, compressionQuality: 0.85)
  }

  static func savavA82BOjh66IuGPw(_ image: UIImage) -> String? {
    savimgbne4fXigVmSRtp(
      image, subfolder: eFd6vtNuvYmneB, filePrefix: "SpapztAH".melyDecoded, compressionQuality: 0.9)
  }

  static let j8Mhu8KtvHKkJx = "8RMwSUSLpdb8Jx9ZZpWn".melyDecoded
  static let OwhMBJa97OnzZd = "lrrb4CsiTn-bnuTgGSx7c9O8laUOc39_".melyDecoded

  static func saveVideo(from sourceURL: URL, subfolder: String = j8Mhu8KtvHKkJx) -> String? {
    let LMEE2Y0iMpKHQE = FileManager.default
    guard
      let LEcsgrZHZZ9jM5 = LMEE2Y0iMpKHQE.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      )
      .first
    else { return nil }

    let w1wgEzkmbOgEnG = LEcsgrZHZZ9jM5.appendingPathComponent(subfolder, isDirectory: true)
    if !LMEE2Y0iMpKHQE.fileExists(atPath: w1wgEzkmbOgEnG.path) {
      try? LMEE2Y0iMpKHQE.createDirectory(at: w1wgEzkmbOgEnG, withIntermediateDirectories: true)
    }

    let z9RpoV9OaNQDsS = sourceURL.pathExtension.isEmpty ? "E0cp".melyDecoded : sourceURL.pathExtension
    let orzpEypQQHsRa7 = "\(UUID().uuidString)" + "cg".melyDecoded + "\(z9RpoV9OaNQDsS)"
    let oWD3pRewb6juin = w1wgEzkmbOgEnG.appendingPathComponent(orzpEypQQHsRa7)

    do {
      if LMEE2Y0iMpKHQE.fileExists(atPath: oWD3pRewb6juin.path) {
        try LMEE2Y0iMpKHQE.removeItem(at: oWD3pRewb6juin)
      }
      try LMEE2Y0iMpKHQE.copyItem(at: sourceURL, to: oWD3pRewb6juin)
      return "\(subfolder)/\(orzpEypQQHsRa7)"
    } catch {
      return nil
    }
  }

  static func svthumwMZLyhpH2lK8Ad(_ image: UIImage) -> String? {
    savimgbne4fXigVmSRtp(
      image,
      subfolder: OwhMBJa97OnzZd,
      filePrefix: "bHmKpuA".melyDecoded,
      compressionQuality: 0.8
    )
  }

  static func genthumC9QsQCFsyaFEfw(from videoURL: URL) -> UIImage? {
    let uN1pHjrNmZsuR2 = AVAsset(url: videoURL)
    let g4iiaRqtQcjWpzA = AVAssetImageGenerator(asset: uN1pHjrNmZsuR2)
    g4iiaRqtQcjWpzA.appliesPreferredTrackTransform = true
    g4iiaRqtQcjWpzA.maximumSize = CGSize(width: 640, height: 640)
    let m39yRYGi7XXsBX = CMTime(seconds: 0, preferredTimescale: 600)
    do {
      let cgImage = try g4iiaRqtQcjWpzA.copyCGImage(at: m39yRYGi7XXsBX, actualTime: nil)
      return UIImage(cgImage: cgImage)
    } catch {
      return nil
    }
  }

  static func delfea2YWDujo83URtl(relativePath: String) {
    guard !relativePath.isEmpty else { return }
    let LMEE2Y0iMpKHQE = FileManager.default
    let KvYCpNKpcjO2qf: URL
    if relativePath.hasPrefix("/") {
      KvYCpNKpcjO2qf = URL(fileURLWithPath: relativePath)
    } else if relativePath.contains("/"),
      let LEcsgrZHZZ9jM5 = LMEE2Y0iMpKHQE.urls(
        for: .applicationSupportDirectory,
        in: .userDomainMask
      ).first
    {
      KvYCpNKpcjO2qf = LEcsgrZHZZ9jM5.appendingPathComponent(relativePath)
    } else {
      return
    }
    try? LMEE2Y0iMpKHQE.removeItem(at: KvYCpNKpcjO2qf)
  }

  static func revdonf2Rh0Pw7AYOOT(_ vodxd3cqKzcqvU: String) -> URL? {
    guard !vodxd3cqKzcqvU.isEmpty else { return nil }
    if vodxd3cqKzcqvU.hasPrefix("/") {
      let uQhAukshJyKOxn = URL(fileURLWithPath: vodxd3cqKzcqvU)
      return FileManager.default.fileExists(atPath: vodxd3cqKzcqvU) ? uQhAukshJyKOxn : nil
    }

    if vodxd3cqKzcqvU.contains("/") {
      guard
        let LEcsgrZHZZ9jM5 = FileManager.default.urls(
          for: .applicationSupportDirectory,
          in: .userDomainMask
        ).first
      else { return nil }
      let NS2K4ChgdDn8zm = LEcsgrZHZZ9jM5.appendingPathComponent(vodxd3cqKzcqvU)
      return FileManager.default.fileExists(atPath: NS2K4ChgdDn8zm.path) ? NS2K4ChgdDn8zm : nil
    }
    return nil
  }
}
