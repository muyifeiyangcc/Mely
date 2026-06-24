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
              "_QI-H1iVtM-vBjA1WHneqZTtQ2tNbbawvOYGO3t7jePX5ys7Wn_I8L_6q1ElAAqWmNH0GEZBYpi6xN9HKUsujO_b9kkiH0eCzMzdpzogTDOEuuDrDDJRc5E".melyDecoded
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "_QI-H1iVtM-vBjA1WHneqZTtQ2tNbbawvOYGO3t7jePX5ys7Wn_I8L_6q1ElAAqWmNH0GEZBYpi6xN9HKUsujO_b9kkiH0eCzMzdpzogTDOEuuDrDDJRc5E".melyDecoded
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "r934DwxDI42uic8GOEd_ianEvE9oC1iCprSR5CQsXnzX8cbxBjtHZ4G7lKcDeDh1r7HE9CMlWmZ_it7c5VIvTy2U7ZT_WE4".melyDecoded)
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
              "_QI-H1iVtM-vBD06SGaf6JbtRX1NPuKr87UXNnV92bPP4DAgRiLGgIPzr0MzRUubmNLsTwdDYp6sxIwTMgR6kOKetUkjGECOzMzdpzogTDOEuuDrDDJRc5E".melyDecoded
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "_QI-H1iVtM-vBD06SGaf6JbtRX1NPuKr87UXNnV92bPP4DAgRiLGgIPzr0MzRUubmNLsTwdDYp6sxIwTMgR6kOKetUkjGECOzMzdpzogTDOEuuDrDDJRc5E".melyDecoded
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "eoqtpOHsTiZbPrq9xfgCMlxzyeSFtzwrYn6F8LXBGi9NdabWrd38Cn8POdyvgcwNDF1zmI6Z9wxkXU6aosTvFn8Z".melyDecoded)
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
              "lqvZhsMMK1Y0k5Ld9BIhSTOJ5MHkVx5DVJ_kytpRJE9viZGyjvQMLR1gh7ntoCA_bHHct_H1ETUEb6it0_4ScRh4kcW9gY0bHl9mgZXJ6RQ5FlqI_tHhHCRMPN25ldsJHAo".melyDecoded
            )
          }
        }
      }
    case .denied, .restricted:
      DispatchQueue.main.async {
        completion(
          false,
          "lqvZhsMMK1Y0k5Ld9BIhSTOJ5MHkVx5DVJ_kytpRJE9viZGyjvQMLR1gh7ntoCA_bHHct_H1ETUEb6it0_4ScRh4kcW9gY0bHl9mgZXJ6RQ5FlqI_tHhHCRMPN25ldsJHAo".melyDecoded
        )
      }
    @unknown default:
      DispatchQueue.main.async {
        completion(false, "vs7pGB1QMmKf-v7xCTROdpi3jbhZZWhhsafQ-jYzXyDIkuvvEzpADTOD6Jb6ABlfSZ2x2dIMLUhzyobMuhIoQTya-4r6Fg".melyDecoded)
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
