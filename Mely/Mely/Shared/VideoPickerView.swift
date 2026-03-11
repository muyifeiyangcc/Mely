//
//  VideoPickerView.swift
//  Mely
//
//  可复用的视频选择组件，支持相册和相机。
//

import AVFoundation
import Photos
import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct VideoPickerView: UIViewControllerRepresentable {
  enum Source {
    case photoLibrary
    case camera

    var uiKitSourceType: UIImagePickerController.SourceType {
      switch self {
      case .photoLibrary: return .photoLibrary
      case .camera: return .camera
      }
    }
  }

  let source: Source
  let onVideoPicked: (URL) -> Void

  @Environment(\.dismiss) private var dismiss

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator

    if UIImagePickerController.isSourceTypeAvailable(source.uiKitSourceType) {
      picker.sourceType = source.uiKitSourceType
    } else {
      picker.sourceType = .photoLibrary
    }

    picker.mediaTypes = [UTType.movie.identifier]
    picker.videoMaximumDuration = 60  // 最长 60 秒
    picker.allowsEditing = false
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: VideoPickerView

    init(parent: VideoPickerView) {
      self.parent = parent
    }

    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
      defer { parent.dismiss.callAsFunction() }

      if let url = info[.mediaURL] as? URL {
        parent.onVideoPicked(url)
      }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      parent.dismiss.callAsFunction()
    }
  }
}
