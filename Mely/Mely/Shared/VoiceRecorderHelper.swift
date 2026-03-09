//
//  VoiceRecorderHelper.swift
//  Mely
//
//  语音录制辅助，将录音保存到 Application Support/ChatAudios，返回相对路径。
//

import AVFoundation
import Foundation

enum VoiceRecorderHelper {
  /// 开始录制，返回录制器；失败返回 nil
  static func startRecording() -> AVAudioRecorder? {
    let session = AVAudioSession.sharedInstance()
    do {
      try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
      try session.setActive(true)
    } catch {
      print("VoiceRecorder: session setup failed \(error)")
      return nil
    }

    let fileManager = FileManager.default
    guard
      let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        .first
    else {
      return nil
    }
    let folderURL = appSupport.appendingPathComponent("ChatAudios", isDirectory: true)
    if !fileManager.fileExists(atPath: folderURL.path) {
      try? fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
    }
    let fileName = "voice_\(UUID().uuidString).m4a"
    let fileURL = folderURL.appendingPathComponent(fileName)

    let settings: [String: Any] = [
      AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
      AVSampleRateKey: 44100,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
    ]

    do {
      let recorder = try AVAudioRecorder(url: fileURL, settings: settings)
      recorder.record()
      return recorder
    } catch {
      print("VoiceRecorder: create failed \(error)")
      return nil
    }
  }

  /// 停止录制，返回 (相对路径, 时长秒数)；失败返回 nil
  static func stopRecording(_ recorder: AVAudioRecorder) -> (path: String, duration: Int)? {
    // 必须在 stop() 之前读取 currentTime，stop 后 currentTime 可能被重置
    let duration = Int(recorder.currentTime.rounded())
    recorder.stop()
    let url = recorder.url
    // 相对路径：ChatAudios/voice_xxx.m4a
    let lastPath = url.lastPathComponent
    let relativePath = "ChatAudios/\(lastPath)"
    return (relativePath, max(1, duration))
  }

  /// 将相对路径解析为完整路径（与 SmartImageView 逻辑一致）
  static func resolveAudioPath(_ path: String) -> String {
    guard !path.isEmpty else { return "" }
    if path.hasPrefix("/") { return path }
    guard
      let appSupport = FileManager.default.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      ).first
    else { return path }
    return appSupport.appendingPathComponent(path).path
  }
}
