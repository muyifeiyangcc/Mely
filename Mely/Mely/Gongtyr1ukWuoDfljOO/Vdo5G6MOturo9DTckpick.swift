//
//  Vdo5G6MOturo9DTckpick.swift
//  Mely
//
//

import AVFoundation
import Photos
import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct Vdo5G6MOturo9DTckpick: UIViewControllerRepresentable {
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
    let jbZUyv2CIVDkXc = UIImagePickerController()
    jbZUyv2CIVDkXc.delegate = context.coordinator

    if UIImagePickerController.isSourceTypeAvailable(source.uiKitSourceType) {
      jbZUyv2CIVDkXc.sourceType = source.uiKitSourceType
    } else {
      jbZUyv2CIVDkXc.sourceType = .photoLibrary
    }

    jbZUyv2CIVDkXc.mediaTypes = [UTType.movie.identifier]
    jbZUyv2CIVDkXc.videoMaximumDuration = 60
    jbZUyv2CIVDkXc.allowsEditing = false
    return jbZUyv2CIVDkXc
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: Vdo5G6MOturo9DTckpick

    init(parent: Vdo5G6MOturo9DTckpick) {
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
