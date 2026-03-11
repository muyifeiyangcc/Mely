//
//  VideoSourcePickerModifier.swift
//  Mely
//
//  视频上传：资源选择弹窗 → 权限请求 → 相册/相机选择视频
//

import SwiftUI

struct VideoSourcePickerConfig {
  var dialogTitle: String = "选择视频来源"
  var dialogMessage: String = "从相册选择或使用相机录制"
  var alertTitle: String = "需要权限"
  var galleryButtonTitle: String = "相册"
  var cameraButtonTitle: String = "相机"
  var cancelButtonTitle: String = "取消"
  var alertConfirmTitle: String = "确定"
  var showSettingsButton: Bool = true
  var settingsButtonTitle: String = "前往设置"
}

struct VideoSourcePickerModifier: ViewModifier {
  @Binding var isSourceDialogPresented: Bool
  let onVideoPicked: (URL) -> Void
  var config: VideoSourcePickerConfig = .init()

  @State private var isVideoPickerPresented: Bool = false
  @State private var videoPickerSource: VideoPickerView.Source = .photoLibrary
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
      .sheet(isPresented: $isVideoPickerPresented) {
        VideoPickerView(source: videoPickerSource) { url in
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
    ImagePickerView.requestPhotoLibraryAccess { granted, message in
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
    ImagePickerView.requestCameraAccess { granted, message in
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
  /// 视频来源选择：弹窗 → 权限 → 相册/相机选择视频
  func videoSourcePicker(
    isPresented: Binding<Bool>,
    onVideoPicked: @escaping (URL) -> Void,
    config: VideoSourcePickerConfig = .init()
  ) -> some View {
    modifier(VideoSourcePickerModifier(
      isSourceDialogPresented: isPresented,
      onVideoPicked: onVideoPicked,
      config: config
    ))
  }
}
