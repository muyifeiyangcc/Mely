//
//  ImageSourcePickerModifier.swift
//  Mely
//
//  Image upload: source dialog → permission request → pick/capture
//

import SwiftUI
import UIKit

// MARK: - Config

struct ImageSourcePickerConfig {
  var dialogTitle: String = "Select image source"
  var dialogMessage: String = "Choose from photo library or camera"
  var alertTitle: String = "Permission Required"
  var galleryButtonTitle: String = "Gallery"
  var cameraButtonTitle: String = "Camera"
  var cancelButtonTitle: String = "Cancel"
  var alertConfirmTitle: String = "Cancel"
  var showSettingsButton: Bool = true
  var settingsButtonTitle: String = "Go to Settings"
}

// MARK: - ViewModifier

struct ImageSourcePickerModifier: ViewModifier {
  @Binding var isSourceDialogPresented: Bool
  let onImagePicked: (UIImage) -> Void
  var config: ImageSourcePickerConfig = .init()

  @State private var isImagePickerPresented: Bool = false
  @State private var imagePickerSource: ImagePickerView.Source = .photoLibrary
  @State private var permissionDeniedMessage: String?
  @State private var isPermissionAlertPresented: Bool = false

  func body(content: Content) -> some View {
    content
      .confirmationDialog(config.dialogTitle, isPresented: $isSourceDialogPresented, titleVisibility: .visible) {
        Button(config.galleryButtonTitle) {
          requestPhotoLibraryAndPresent()
        }
        Button(config.cameraButtonTitle) {
          requestCameraAndPresent()
        }
        Button(config.cancelButtonTitle, role: .cancel) {}
      } message: {
        Text(config.dialogMessage)
      }
      .sheet(isPresented: $isImagePickerPresented) {
        ImagePickerView(source: imagePickerSource) { image in
          onImagePicked(image)
          isImagePickerPresented = false
        }
      }
      .alert(config.alertTitle, isPresented: $isPermissionAlertPresented) {
        if config.showSettingsButton {
          Button(config.settingsButtonTitle) {
            openSettings()
          }
        }
        Button(config.alertConfirmTitle, role: .cancel) {}
      } message: {
        Text(permissionDeniedMessage ?? "")
      }
  }

  private func requestPhotoLibraryAndPresent() {
    ImagePickerView.requestPhotoLibraryAccess { granted, message in
      if granted {
        imagePickerSource = .photoLibrary
        isImagePickerPresented = true
      } else {
        permissionDeniedMessage = message
        isPermissionAlertPresented = true
      }
    }
  }

  private func requestCameraAndPresent() {
    ImagePickerView.requestCameraAccess { granted, message in
      if granted {
        imagePickerSource = .camera
        isImagePickerPresented = true
      } else {
        permissionDeniedMessage = message
        isPermissionAlertPresented = true
      }
    }
  }

  private func openSettings() {
    if let url = URL(string: UIApplication.openSettingsURLString) {
      UIApplication.shared.open(url)
    }
  }
}

// MARK: - View Extension

extension View {
  /// Image source picker: source dialog → permission → pick/capture
  func imageSourcePicker(
    isPresented: Binding<Bool>,
    onImagePicked: @escaping (UIImage) -> Void,
    config: ImageSourcePickerConfig = .init()
  ) -> some View {
    modifier(ImageSourcePickerModifier(
      isSourceDialogPresented: isPresented,
      onImagePicked: onImagePicked,
      config: config
    ))
  }
}
