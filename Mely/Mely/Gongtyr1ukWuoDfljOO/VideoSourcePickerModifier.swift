//
//  VideoSourcePickerModifier.swift
//  Mely
//
//

import SwiftUI

struct SourcePickerConfig {
  var dialogTitle: String
  var dialogMessage: String = "XX-Spu__XyNXYqfhx-YPIgI03Oe2lc0DDx96k8TB5hA4R1M".melyDecoded
  var alertTitle: String = "XmKftIXZ_Bw6Uxqjos_lD29BJA".melyDecoded
  var galleryButtonTitle: String = "fZK1wcUUOg".melyDecoded
  var cameraButtonTitle: String = "aIGl38MU".melyDecoded
  var cancelButtonTitle: String = "aIGm2dQZ".melyDecoded
  var alertConfirmTitle: String
  var showSettingsButton: Bool = true
  var settingsButtonTitle: String = "5AdgRlbdicv8Fg5EdZo".melyDecoded

  static let imageDefault = SourcePickerConfig(
    dialogTitle: "XWKBvI_erxw4XF2U583_E29HJQ".melyDecoded,
    alertConfirmTitle: "aIGm2dQZ".melyDecoded
  )

  static let videoDefault = SourcePickerConfig(
    dialogTitle: "XWKBvI_erwM8WV-e583_E29HJQ".melyDecoded,
    alertConfirmTitle: "eZy3y8kULg".melyDecoded
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
