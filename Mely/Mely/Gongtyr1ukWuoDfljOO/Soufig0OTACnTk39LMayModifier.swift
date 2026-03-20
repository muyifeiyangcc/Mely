//
//  Soufig0OTACnTk39LMayModifier.swift
//  Mely
//
//

import SwiftUI
import UIKit

struct Soufig0OTACnTk39LMayModifier: ViewModifier {
  @Binding var isSourceDialogPresented: Bool
  let onImagePicked: (UIImage) -> Void
  var config: SourcePickerConfig = .imageDefault

  @State private var isImagePickerPresented: Bool = false
  @State private var imagePickerSource: ImgpickvvA6HMEn3qSYCXy.Source = .photoLibrary
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
        ImgpickvvA6HMEn3qSYCXy(source: imagePickerSource) { image in
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
    ImgpickvvA6HMEn3qSYCXy.reqphoVZ70cG70wkRouR { granted, message in
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
    ImgpickvvA6HMEn3qSYCXy.reqcamRpn3Y6kgOef01Y { granted, message in
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

extension View {
  func imageSourcePicker(
    isPresented: Binding<Bool>,
    onImagePicked: @escaping (UIImage) -> Void,
    config: SourcePickerConfig = .imageDefault
  ) -> some View {
    modifier(Soufig0OTACnTk39LMayModifier(
      isSourceDialogPresented: isPresented,
      onImagePicked: onImagePicked,
      config: config
    ))
  }
}
