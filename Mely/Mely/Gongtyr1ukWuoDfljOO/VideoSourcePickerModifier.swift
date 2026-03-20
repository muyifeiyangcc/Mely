//
//  VideoSourcePickerModifier.swift
//  Mely
//
//

import SwiftUI

struct SourcePickerConfig {
  var dialogTitle: String
  var dialogMessage: String = "Choose from photo library or camera"
  var alertTitle: String = "Permission Required"
  var galleryButtonTitle: String = "Gallery"
  var cameraButtonTitle: String = "Camera"
  var cancelButtonTitle: String = "Cancel"
  var alertConfirmTitle: String
  var showSettingsButton: Bool = true
  var settingsButtonTitle: String = "Go to Settings"

  static let imageDefault = SourcePickerConfig(
    dialogTitle: "Select image source",
    alertConfirmTitle: "Cancel"
  )

  static let videoDefault = SourcePickerConfig(
    dialogTitle: "Select video source",
    alertConfirmTitle: "Confirm"
  )
}

struct VideoSourcePickerModifier: ViewModifier {
  @Binding var isSourceDialogPresented: Bool
  let onVideoPicked: (URL) -> Void
  var config: SourcePickerConfig = .videoDefault

  @State private var isVideoPickerPresented: Bool = false
  @State private var videoPickerSource: Vdo5G6MOturo9DTckpick.Source = .photoLibrary
  @State private var permissionDeniedMessage: String?
  @State private var isPermissionAlertPresented: Bool = false

  func body(content: Content) -> some View {
    content
      .confirmationDialog(
        config.dialogTitle, isPresented: $isSourceDialogPresented, titleVisibility: .visible
      ) {
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
      .sheet(isPresented: $isVideoPickerPresented) {
        Vdo5G6MOturo9DTckpick(source: videoPickerSource) { url in
          onVideoPicked(url)
          isVideoPickerPresented = false
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
        videoPickerSource = .photoLibrary
        isVideoPickerPresented = true
      } else {
        permissionDeniedMessage = message
        isPermissionAlertPresented = true
      }
    }
  }

  private func requestCameraAndPresent() {
    ImgpickvvA6HMEn3qSYCXy.reqcamRpn3Y6kgOef01Y { granted, message in
      if granted {
        videoPickerSource = .camera
        isVideoPickerPresented = true
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
  func videoSourcePicker(
    isPresented: Binding<Bool>,
    onVideoPicked: @escaping (URL) -> Void,
    config: SourcePickerConfig = .videoDefault
  ) -> some View {
    modifier(
      VideoSourcePickerModifier(
        isSourceDialogPresented: isPresented,
        onVideoPicked: onVideoPicked,
        config: config
      ))
  }
}
