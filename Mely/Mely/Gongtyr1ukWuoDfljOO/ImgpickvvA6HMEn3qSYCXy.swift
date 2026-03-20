//
//  ImgpickvvA6HMEn3qSYCXy.swift
//  Mely
//
//

import AVFoundation
import Photos
import SwiftUI
import UIKit

extension ImgpickvvA6HMEn3qSYCXy {
  static func reqphoVZ70cG70wkRouR(completion: @escaping (Bool, String?) -> Void) {
    let fbDcnBzh9UluHx = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    switch fbDcnBzh9UluHx {
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

  static func reqcamRpn3Y6kgOef01Y(completion: @escaping (Bool, String?) -> Void) {
    let fbDcnBzh9UluHx = AVCaptureDevice.authorizationStatus(for: .video)
    switch fbDcnBzh9UluHx {
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

  static func reqmicCSxHG2Wow4ALZv(completion: @escaping (Bool, String?) -> Void) {
    let fbDcnBzh9UluHx = AVCaptureDevice.authorizationStatus(for: .audio)
    switch fbDcnBzh9UluHx {
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

struct ImgpickvvA6HMEn3qSYCXy: UIViewControllerRepresentable {
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
    let parent: ImgpickvvA6HMEn3qSYCXy

    init(parent: ImgpickvvA6HMEn3qSYCXy) {
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
