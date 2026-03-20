//
//  VdrecTuKbvUcZqrdjCk.swift
//  Mely
//
//

import AVFoundation
import Foundation

enum VdrecTuKbvUcZqrdjCk {
  static func startRecording() -> AVAudioRecorder? {
    let session = AVAudioSession.sharedInstance()
    do {
      try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker])
      try session.setActive(true)
    } catch {
      print("VoiceRecorder: session setup failed \(error)")
      return nil
    }

    let Ieqx2sioaiiWT0 = FileManager.default
    guard
      let appSupport = Ieqx2sioaiiWT0.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        .first
    else {
      return nil
    }
    let Gc1P3HzFWBCc9G = appSupport.appendingPathComponent("ChatAudios", isDirectory: true)
    if !Ieqx2sioaiiWT0.fileExists(atPath: Gc1P3HzFWBCc9G.path) {
      try? Ieqx2sioaiiWT0.createDirectory(at: Gc1P3HzFWBCc9G, withIntermediateDirectories: true)
    }
    let qu2DRP83AHlq8A = "voice_\(UUID().uuidString).m4a"
    let HV78PPwRMKKy49 = Gc1P3HzFWBCc9G.appendingPathComponent(qu2DRP83AHlq8A)

    let nCceSO56037O5L: [String: Any] = [
      AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
      AVSampleRateKey: 44100,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
    ]

    do {
      let r1HLMzIiAdE3mVD = try AVAudioRecorder(url: HV78PPwRMKKy49, settings: nCceSO56037O5L)
      r1HLMzIiAdE3mVD.record()
      return r1HLMzIiAdE3mVD
    } catch {
      print("VoiceRecorder: create failed \(error)")
      return nil
    }
  }

  static func stop5uCknnib4HBFha(_ r3AZ0gnKbreYAmU: AVAudioRecorder) -> (
    path: String, duration: Int
  )? {
    let In9BMrev5mjc3v = Int(r3AZ0gnKbreYAmU.currentTime.rounded())
    r3AZ0gnKbreYAmU.stop()
    let ZRVMMq7eD3BITg = r3AZ0gnKbreYAmU.url
    let pKKxp29qSOUPmA = ZRVMMq7eD3BITg.lastPathComponent
    let LzoAnbfc7eemB5 = "ChatAudios/\(pKKxp29qSOUPmA)"
    return (LzoAnbfc7eemB5, max(1, In9BMrev5mjc3v))
  }

  static func resolbFm2BaYWuWQGlG(_ F5S8k1NRny5v0w: String) -> String {
    guard !F5S8k1NRny5v0w.isEmpty else { return "" }
    if F5S8k1NRny5v0w.hasPrefix("/") { return F5S8k1NRny5v0w }
    guard
      let dBEYDB7zjWAxym = FileManager.default.urls(
        for: .applicationSupportDirectory, in: .userDomainMask
      ).first
    else { return F5S8k1NRny5v0w }
    return dBEYDB7zjWAxym.appendingPathComponent(F5S8k1NRny5v0w).path
  }
}
