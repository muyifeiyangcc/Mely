//
//  ImagePickerView.swift
//  Mely
//
//  一个可复用的图片选择组件，支持相册和相机。
//

import AVFoundation
import Photos
import SwiftUI
import UIKit

// MARK: - 相册 / 相机权限（公共方法，主线程回调）

extension ImagePickerView {
  /// 请求相册访问权限。completion 在主线程调用：granted 为 true 时可打开相册选择器；为 false 时 message 为弹窗提示文案。
  static func requestPhotoLibraryAccess(completion: @escaping (Bool, String?) -> Void) {
    let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    switch status {
    case .authorized, .limited:
      DispatchQueue.main.async { completion(true, nil) }
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization(for: .readWrite) { newStatus in
        DispatchQueue.main.async {
          if newStatus == .authorized || newStatus == .limited {
            completion(true, nil)
          } else {
            completion(
              false,
              "You need album access to select photos. Please allow access to the album in the settings."
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "You need album access to select photos. Please allow access to the album in the settings."
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "Unable to access the photo album. Please check permissions in settings.")
      }
    }
  }

  /// 请求相机访问权限。completion 在主线程调用：granted 为 true 时可打开相机；为 false 时 message 为弹窗提示文案。
  static func requestCameraAccess(completion: @escaping (Bool, String?) -> Void) {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    switch status {
    case .authorized:
      DispatchQueue.main.async { completion(true, nil) }
    case .notDetermined:
      AVCaptureDevice.requestAccess(for: .video) { granted in
        DispatchQueue.main.async {
          if granted {
            completion(true, nil)
          } else {
            completion(
              false,
              "You need camera access to take photos. Please allow access to the camera in the settings."
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "You need camera access to take photos. Please allow access to the camera in the settings."
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "Unable to access the camera. Please check permissions in settings.")
      }
    }
  }

  /// 请求麦克风权限。completion 在主线程调用：granted 为 true 时可开始录制；为 false 时 message 为弹窗提示文案。
  static func requestMicrophoneAccess(completion: @escaping (Bool, String?) -> Void) {
    let status = AVCaptureDevice.authorizationStatus(for: .audio)
    switch status {
    case .authorized:
      DispatchQueue.main.async { completion(true, nil) }
    case .notDetermined:
      AVCaptureDevice.requestAccess(for: .audio) { granted in
        DispatchQueue.main.async {
          if granted {
            completion(true, nil)
          } else {
            completion(
              false,
              "You need microphone access to record audio. Please allow access to the microphone in the settings."
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "You need microphone access to record audio. Please allow access to the microphone in the settings."
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "Unable to access the microphone. Please check permissions in settings.")
      }
    }
  }
}

struct ImagePickerView: UIViewControllerRepresentable {
  enum Source {
    case photoLibrary
    case camera

    var uiKitSourceType: UIImagePickerController.SourceType {
      switch self {
      case .photoLibrary:
        return .photoLibrary
      case .camera:
        return .camera
      }
    }
  }

  let source: Source
  let onImagePicked: (UIImage) -> Void

  @Environment(\.presentationMode) private var presentationMode

  func makeUIViewController(context: Context) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator

    if UIImagePickerController.isSourceTypeAvailable(source.uiKitSourceType) {
      picker.sourceType = source.uiKitSourceType
    } else {
      picker.sourceType = .photoLibrary
    }

    picker.allowsEditing = false
    return picker
  }

  func updateUIViewController(
    _ uiViewController: UIImagePickerController,
    context: Context
  ) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate
  {
    let parent: ImagePickerView

    init(parent: ImagePickerView) {
      self.parent = parent
    }

    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
      defer { parent.presentationMode.wrappedValue.dismiss() }

      if let image = info[.originalImage] as? UIImage {
        parent.onImagePicked(image)
      }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      parent.presentationMode.wrappedValue.dismiss()
    }
  }
}
