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
            completion(false, "需要相册权限才能选择照片，请在设置中允许访问相册。")
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(false, "需要相册权限才能选择照片，请在设置中允许访问相册。")
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "无法访问相册，请在设置中检查权限。")
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
            completion(false, "需要相机权限才能拍照，请在设置中允许访问相机。")
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(false, "需要相机权限才能拍照，请在设置中允许访问相机。")
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "无法访问相机，请在设置中检查权限。")
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
            completion(false, "需要麦克风权限才能录制语音，请在设置中允许访问麦克风。")
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(false, "需要麦克风权限才能录制语音，请在设置中允许访问麦克风。")
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "无法访问麦克风，请在设置中检查权限。")
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
