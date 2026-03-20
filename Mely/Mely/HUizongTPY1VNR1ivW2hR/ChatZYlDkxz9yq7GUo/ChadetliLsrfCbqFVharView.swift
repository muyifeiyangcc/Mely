//
//  ChadetliLsrfCbqFVharView.swift
//  Mely
//
//  Created by yangyang on 2026/3/6.
//

import AVFoundation
import Combine
import SwiftUI

struct ChadetliLsrfCbqFVharView: View {
  @EnvironmentObject private var j8G57MljwM2a4l: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  let ihcqcoxwUEDEh7cid: String

  @State private var fL2hKmbMmjLJ7Z: String = ""
  @State private var isvoCweAuEOrDlhNEq: Bool = false
  @State private var isemoBAxzAmK8uXF9QN: Bool = false
  @State private var ynAqOXgZjoPwmg: [CitemCKH7bUTVNDmixw] = []
  @State private var HtEFZagbtmAjPj: [CitemCKH7bUTVNDmixw] = []
  @State private var LWlRg7fl3zFJi9ssp: Bool = false
  @State private var vpd4rsZK4TVDFPXbo: String?
  @State private var svpWFle0fef9L6Plo: Bool = false
  @State private var isVoiceRecording: Bool = false
  @State private var OjHUIngPkyZHC0: CGFloat = 0
  @State private var ItVGIMtNyS1Ndc: Bool = false
  @State private var sp4sUWLK2oolYDp4: Bool = false

  var body: some View {
    MelyYemianScaffold {
      GeometryReader { geo in
        VStack(spacing: 0) {
          TopBLMs4aEB1cnGp9bar(
            ttYl57M7uFheos3o: xbxUEw3vtJr82k,
            onfanGroV0pgM1ABvRj: { dismiss() },
            onLahBc6gaE9DtSKKGe: { ItVGIMtNyS1Ndc = true }
          )

          ScrollViewReader { proxy in
            ScrollView {
              LazyVStack(spacing: 0) {
                ForEach(Tqv1nv4GlyAYNJ) { IGhjzZfFlERBul in
                  VeaX3Ewrqii3HkCbu(
                    Go07bgQculuhN1: IGhjzZfFlERBul,
                    meavag7AUClncGhfLrr: meAvatarSymbol,
                    oadRNB5kQ6cqzQEq: otavdMS8zrAnrQ5uo1
                  )
                  .id(IGhjzZfFlERBul.id)
                  .padding(.bottom, 16)
                }
              }
              .padding(.horizontal, 16)
              .padding(.top, 18)
              .padding(.bottom, 16)
            }
            .onChange(of: PuiFVRsWROqmCV) { _, _ in
              sS12jTHiPRmmCvg(proxy: proxy)
            }
            .onAppear {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                sS12jTHiPRmmCvg(proxy: proxy)
              }
            }
          }

          ComfgobkQuxbadosUView(
            text: $fL2hKmbMmjLJ7Z,
            isvoCweAuEOrDlhNEq: $isvoCweAuEOrDlhNEq,
            isemoBAxzAmK8uXF9QN: $isemoBAxzAmK8uXF9QN,
            onphon6EtjoEsQGYArk: { LWlRg7fl3zFJi9ssp = true },
            onsendGefNFxOXdNg2qX: { stcIDVi99qlf5nFOO() },
            onemo3BY49A5iWViuGG: { emoji in
              ApMtjeTMmXQIjP(emoji)
            },
            onvoivAICgf5PhRtIG3: { path, duration in
              svmYEHR4z4z2hmq0p(audioPath: path, duration: duration)
            },
            onredOv5bQtQyqnQLFQ: { isVoiceRecording = $0 },
            onperMRW0hEihmWl1a5: { msg in
              vpd4rsZK4TVDFPXbo = msg
              svpWFle0fef9L6Plo = true
            }
          )

        }
        .frame(height: max(0, geo.size.height - OjHUIngPkyZHC0))
        .frame(maxHeight: .infinity, alignment: .top)
      }
    }
    .ignoresSafeArea(edges: .bottom)
    .onAppear {
      j8G57MljwM2a4l.clearQMvJVGDzgFTU2L(for: ihcqcoxwUEDEh7cid)
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification))
    { notification in
      guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
      else { return }
      withAnimation(.easeOut(duration: 0.25)) {
        OjHUIngPkyZHC0 = frame.height
      }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
    { _ in
      withAnimation(.easeOut(duration: 0.25)) {
        OjHUIngPkyZHC0 = 0
      }
    }
    .blorepEJWPcVqZsNi6EP(
      isbloCY4jaarVfF0wpY: $ItVGIMtNyS1Ndc,
      isrepppE4EmwOSEs9Cl: $sp4sUWLK2oolYDp4,
      onOXhiQzKCNvCvG4Block: {
        if let oBdl3eTYZ1Mp0H = oiddMjbBBLASUsbIH {
          j8G57MljwM2a4l.boQkspadWNHlX2WBuser(uid: oBdl3eTYZ1Mp0H)
          path.removeAll()
        }
        ItVGIMtNyS1Ndc = false
      },
      onReportSubmit: { _, _ in }
    )
    .toolbar(.hidden, for: .navigationBar)
    .imageSourcePicker(
      isPresented: $LWlRg7fl3zFJi9ssp, onImagePicked: { hpEgZ6jfUA7uLLXf($0) }
    )
    .alert("Permission Required", isPresented: $svpWFle0fef9L6Plo) {
      Button("Go to Settings") {
        if let url = URL(string: UIApplication.openSettingsURLString) {
          UIApplication.shared.open(url)
        }
      }
      Button("Cancel", role: .cancel) {}
    } message: {
      if let ZkcmClqkEDZOvn = vpd4rsZK4TVDFPXbo {
        Text(ZkcmClqkEDZOvn)
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var oiddMjbBBLASUsbIH: String? {
    guard
      let tHQNhKnLpiJJqd = j8G57MljwM2a4l.filcvrsKNV3sVIZ1SzZc9.first(where: {
        $0.id == ihcqcoxwUEDEh7cid
      }
      ),
      let CpMna9xqvMcInD = j8G57MljwM2a4l.izHqrtotvfHu1g.adCu1Zp6Hm
    else { return nil }
    return tHQNhKnLpiJJqd.cPu3Ks1Zx.first { $0 != CpMna9xqvMcInD }
  }

  private var xbxUEw3vtJr82k: String {
    guard let id06yBk4Xmp3bIrZ = oiddMjbBBLASUsbIH,
      let S6JKnZe3hBCwz9 = j8G57MljwM2a4l.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == id06yBk4Xmp3bIrZ }
      )
    else { return "Chat" }
    return S6JKnZe3hBCwz9.uZp7Lm2cR
  }

  private var meAvatarSymbol: String {
    j8G57MljwM2a4l.curp11O3LYjA9ooct?.uQd8Nv5tK ?? "mely_defava"
  }

  private var otavdMS8zrAnrQ5uo1: String {
    guard
      let tyrqNEuvlfGs8T = j8G57MljwM2a4l.filcvrsKNV3sVIZ1SzZc9.first(where: {
        $0.id == ihcqcoxwUEDEh7cid
      }
      ),
      let YidmbWC5fbKi98 = j8G57MljwM2a4l.izHqrtotvfHu1g.adCu1Zp6Hm
    else { return "mely_defava" }
    let b3moH3ZsoDKZpj = tyrqNEuvlfGs8T.cPu3Ks1Zx.first { $0 != YidmbWC5fbKi98 }
    guard let EMhW3YR8rNp9Uf = b3moH3ZsoDKZpj,
      let Dq4uvexi1fCiZn = j8G57MljwM2a4l.izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == EMhW3YR8rNp9Uf })
    else {
      return "mely_defava"
    }
    return Dq4uvexi1fCiZn.uQd8Nv5tK
  }

  private var AyoS9Zdrj7CKgw: [CitemCKH7bUTVNDmixw] {
    let items: [CitemCKH7bUTVNDmixw] =
      j8G57MljwM2a4l.izHqrtotvfHu1g.adMs8Lw4Ty
      .filter { $0.mCv4Ne9Hr == ihcqcoxwUEDEh7cid }
      .sorted(by: { $0.mCt7He4Jn < $1.mCt7He4Jn })
      .map { juElKfXMeLLDkO -> CitemCKH7bUTVNDmixw in
        let Q8HnyesNa2p31j: CitemCKH7bUTVNDmixw.Content

        switch juElKfXMeLLDkO.mTy9Gh1Qb {
        case .emoji:
          Q8HnyesNa2p31j = .emojiImage(name: juElKfXMeLLDkO.mTx2Fp8Vc)
        case .voice:
          let s0S3Mkm1hlQp1sd = juElKfXMeLLDkO.mAd8Ls2Vq ?? 0
          let xEuun1KKkjCo0A = juElKfXMeLLDkO.mAu3Nk6Ps ?? ""
          Q8HnyesNa2p31j = .audqCRba8tXDwE4kE(seconds: s0S3Mkm1hlQp1sd, path: xEuun1KKkjCo0A)
        case .image:
          Q8HnyesNa2p31j = .imgDZNx8Oh4Izihg0(
            path: juElKfXMeLLDkO.mIm5Wr7Dz ?? juElKfXMeLLDkO.mTx2Fp8Vc)
        case .text:
          if emjisAHQtz5uCuPbbIu.contains(juElKfXMeLLDkO.mTx2Fp8Vc) {
            Q8HnyesNa2p31j = .emojiImage(name: juElKfXMeLLDkO.mTx2Fp8Vc)
          } else {
            Q8HnyesNa2p31j = .textsqyyplGmDp1J5V(juElKfXMeLLDkO.mTx2Fp8Vc)
          }
        }

        return CitemCKH7bUTVNDmixw(
          id: juElKfXMeLLDkO.id,
          isMe: juElKfXMeLLDkO.mUd6Ts3Kw == j8G57MljwM2a4l.izHqrtotvfHu1g.adCu1Zp6Hm,
          content: Q8HnyesNa2p31j,
          timeText: xUyaofrpBB77vO(from: juElKfXMeLLDkO.mCt7He4Jn)
        )
      }
    return items
  }

  private var Tqv1nv4GlyAYNJ: [CitemCKH7bUTVNDmixw] {
    ynAqOXgZjoPwmg + AyoS9Zdrj7CKgw + HtEFZagbtmAjPj
  }

  private var PuiFVRsWROqmCV: Int {
    Tqv1nv4GlyAYNJ.count
  }

  private func xUyaofrpBB77vO(from pvD46UvH6CuVxz: Date) -> String {
    let f = DateFormatter()
    f.dateFormat = "h:mm a"
    return f.string(from: pvD46UvH6CuVxz)
  }

  private func sS12jTHiPRmmCvg(proxy: ScrollViewProxy) {
    guard let c80oq9ZVXlXvBP = Tqv1nv4GlyAYNJ.last?.id else { return }
    withAnimation(.easeOut(duration: 0.25)) {
      proxy.scrollTo(c80oq9ZVXlXvBP, anchor: .bottom)
    }
  }

  private func stcIDVi99qlf5nFOO() {
    let BKdid5cJKOTzFi = fL2hKmbMmjLJ7Z.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !BKdid5cJKOTzFi.isEmpty else { return }
    j8G57MljwM2a4l.admsgcmdox9iZwe6S1f(ttyJnAURFG0loRE3: BKdid5cJKOTzFi, tyowLXhwa7xvGmX9: .text, to: ihcqcoxwUEDEh7cid)
    fL2hKmbMmjLJ7Z = ""
    UIApplication.shared.sendAction(
      #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }

  private func ApMtjeTMmXQIjP(_ emoji: String) {
    j8G57MljwM2a4l.admsgcmdox9iZwe6S1f(ttyJnAURFG0loRE3: emoji, tyowLXhwa7xvGmX9: .emoji, to: ihcqcoxwUEDEh7cid)
  }

  private func svmYEHR4z4z2hmq0p(audioPath: String, duration: Int) {
    j8G57MljwM2a4l.admsgcmdox9iZwe6S1f(
      ttyJnAURFG0loRE3: "",
      tyowLXhwa7xvGmX9: .voice,
      aud8kqhqVQyIuYzTv: audioPath,
      aduraTtGnBLLkPYskli: duration,
      to: ihcqcoxwUEDEh7cid
    )
  }

  private func hpEgZ6jfUA7uLLXf(_ E6j33FwVwK28lH: UIImage) {
    guard let path = ImgstorehR7h57Xdriq7hH.savcfq5cmlzAagRNzO(E6j33FwVwK28lH) else { return }
    j8G57MljwM2a4l.admsgcmdox9iZwe6S1f(ttyJnAURFG0loRE3: "", tyowLXhwa7xvGmX9: .image, imgXlM2LjsURmUuuM: path, to: ihcqcoxwUEDEh7cid)
  }
}

private struct ComfgobkQuxbadosUView: View {
  @Binding var text: String
  @Binding var isvoCweAuEOrDlhNEq: Bool
  @Binding var isemoBAxzAmK8uXF9QN: Bool

  let onphon6EtjoEsQGYArk: () -> Void
  let onsendGefNFxOXdNg2qX: () -> Void
  let onemo3BY49A5iWViuGG: (String) -> Void
  let onvoivAICgf5PhRtIG3: (String, Int) -> Void
  let onredOv5bQtQyqnQLFQ: (Bool) -> Void
  let onperMRW0hEihmWl1a5: (String) -> Void

  var body: some View {
    VStack(spacing: 0) {
      if isemoBAxzAmK8uXF9QN {
        EmojiPanelView { emoji in
          onemo3BY49A5iWViuGG(emoji)
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
      }

      ZStack(alignment: .bottom) {
        HStack(spacing: 10) {
          Button {
            withAnimation(.easeInOut(duration: 0.22)) {
              isvoCweAuEOrDlhNEq.toggle()
              if isvoCweAuEOrDlhNEq { isemoBAxzAmK8uXF9QN = false }
            }
          } label: {
            Image(systemName: isvoCweAuEOrDlhNEq ? "keyboard" : "mic.fill")
              .font(.system(size: 22, weight: .semibold))
              .foregroundColor(.white)
          }

          Group {
            TextField(
              "",
              text: $text,
              prompt: Text("Add content")
                .foregroundColor(Color(white: 0.65))
            )
            .textFieldStyle(.plain)
            .foregroundColor(.white)
            .tint(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(Color(red: 24 / 255, green: 32 / 255, blue: 55 / 255))
            .clipShape(Capsule(style: .continuous))
            .submitLabel(.done)
          }

          Button {
            withAnimation(.easeInOut(duration: 0.22)) {
              isemoBAxzAmK8uXF9QN.toggle()
              if isemoBAxzAmK8uXF9QN { isvoCweAuEOrDlhNEq = false }
            }
          } label: {
            Image(systemName: "face.smiling")
              .font(.system(size: 28))
              .foregroundColor(.white)
          }

          Button {
            if canSendText {
              onsendGefNFxOXdNg2qX()
            } else {
              onphon6EtjoEsQGYArk()
            }
          } label: {
            Image(systemName: canSendText ? "paperplane.fill" : "photo")
              .font(.system(size: 26))
              .foregroundColor(.white)
          }
          .disabled(isvoCweAuEOrDlhNEq && canSendText)
        }
        .padding(.horizontal, 16)
        .padding(.top, isemoBAxzAmK8uXF9QN ? 0 : 12)
      }

      if isvoCweAuEOrDlhNEq {
        BigfX60ILmqqamWTB(
          onvoivAICgf5PhRtIG3: onvoivAICgf5PhRtIG3,
          onredOv5bQtQyqnQLFQ: onredOv5bQtQyqnQLFQ,
          onperMRW0hEihmWl1a5: onperMRW0hEihmWl1a5
        )
        .padding(.top, 24)
        .transition(.scale.combined(with: .opacity))
      }
    }
    .padding(.bottom, 36)
    .background(.black)
    .clipShape(
      UnevenRoundedRectangle(
        topLeadingRadius: 24,
        bottomLeadingRadius: 0,
        bottomTrailingRadius: 0,
        topTrailingRadius: 24,
        style: .continuous
      )
    )
  }

  private var canSendText: Bool {
    !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}

private struct EmojiPanelView: View {
  let onSelect: (String) -> Void

  var body: some View {
    HStack(spacing: 14) {
      ForEach(emjisAHQtz5uCuPbbIu, id: \.self) { emojiHYrPtnrtgAV1MS in
        Button {
          onSelect(emojiHYrPtnrtgAV1MS)
        } label: {
          Image(emojiHYrPtnrtgAV1MS)
            .resizable()
            .frame(width: 36, height: 36)
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .buttonStyle(.plain)
      }
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
  }
}

private struct BigfX60ILmqqamWTB: View {
  let onvoivAICgf5PhRtIG3: (String, Int) -> Void
  let onredOv5bQtQyqnQLFQ: (Bool) -> Void
  let onperMRW0hEihmWl1a5: (String) -> Void

  @State private var REScOZ2Jng6h2S: AVAudioRecorder?
  @State private var isPressing: Bool = false
  @State private var XBoqXQXfAxMLB0: Bool = false
  @State private var bt8dPCqLea2dQll9: Timer?

  private var ir8JcKWaKOzs4xsP: Bool { REScOZ2Jng6h2S != nil }

  var body: some View {
    ZStack {
      Circle()
        .fill(.white.opacity(ir8JcKWaKOzs4xsP ? (XBoqXQXfAxMLB0 ? 0.5 : 0.15) : 0.2))
        .frame(width: 86, height: 86)

      Circle()
        .fill(.white.opacity(ir8JcKWaKOzs4xsP ? (XBoqXQXfAxMLB0 ? 0.6 : 0.25) : 0.3))
        .frame(width: 64, height: 64)

      Circle()
        .fill(.white.opacity(ir8JcKWaKOzs4xsP ? (XBoqXQXfAxMLB0 ? 0.7 : 0.4) : 0.4))
        .frame(width: 42, height: 42)

      Image(systemName: "mic.fill")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
    }
    .animation(.easeInOut(duration: 0.35), value: XBoqXQXfAxMLB0)
    .contentShape(Circle())
    .gesture(
      DragGesture(minimumDistance: 0)
        .onChanged { _ in
          if !isPressing {
            isPressing = true
            FW1HmfAdtFBLn3()
          }
        }
        .onEnded { _ in
          isPressing = false
          stopP750Ul7ddT9D11()
          zblDCbkv5qfMex()
        }
    )
  }

  private func statT23Qrei5LYyzAM() {
    stopP750Ul7ddT9D11()
    XBoqXQXfAxMLB0 = true
    bt8dPCqLea2dQll9 = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
      XBoqXQXfAxMLB0.toggle()
    }
    RunLoop.main.add(bt8dPCqLea2dQll9!, forMode: .common)
  }

  private func stopP750Ul7ddT9D11() {
    bt8dPCqLea2dQll9?.invalidate()
    bt8dPCqLea2dQll9 = nil
    XBoqXQXfAxMLB0 = false
  }

  private func FW1HmfAdtFBLn3() {
    ImgpickvvA6HMEn3qSYCXy.reqmicCSxHG2Wow4ALZv { granted, message in
      if granted {
        if let r = VdrecTuKbvUcZqrdjCk.startRecording() {
          REScOZ2Jng6h2S = r
          statT23Qrei5LYyzAM()
          onredOv5bQtQyqnQLFQ(true)
        }
      } else if let tGkgvxiwA2VJwQ = message {
        onperMRW0hEihmWl1a5(tGkgvxiwA2VJwQ)
      }
    }
  }

  private func zblDCbkv5qfMex() {
    guard let r = REScOZ2Jng6h2S else { return }
    onredOv5bQtQyqnQLFQ(false)
    REScOZ2Jng6h2S = nil
    stopP750Ul7ddT9D11()
    if let result = VdrecTuKbvUcZqrdjCk.stop5uCknnib4HBFha(r) {
      onvoivAICgf5PhRtIG3(result.path, result.duration)
    }
  }
}

private class VAetVx4ePF6MzkVp: ObservableObject {
  @Published var HBAp4fbnhEy2Z8: Bool = false
  private var player: AVAudioPlayer?
  private var delegate: Ad6wlJsDeCurBQq9?

  func toggle(url: URL) {
    if HBAp4fbnhEy2Z8 {
      stop()
      return
    }
    do {
      let p = try AVAudioPlayer(contentsOf: url)
      let d = Ad6wlJsDeCurBQq9 { [weak self] in
        DispatchQueue.main.async { self?.stop() }
      }
      delegate = d
      p.delegate = d
      player = p
      p.play()
      HBAp4fbnhEy2Z8 = true
    } catch {
      print("VAetVx4ePF6MzkVp play failed: \(error)")
    }
  }

  func stop() {
    player?.stop()
    player = nil
    delegate = nil
    HBAp4fbnhEy2Z8 = false
  }
}

private class Ad6wlJsDeCurBQq9: NSObject, AVAudioPlayerDelegate {
  let onFinish: () -> Void
  init(onFinish: @escaping () -> Void) { self.onFinish = onFinish }
  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) { onFinish() }
}

private struct VbuVNgXh5SaakivIP: View {
  let s3eezLGy9ksungu: Int
  let ph9xca0pgqMHIkqc: String
  let isWyY8MbQNatzIjnMe: Bool

  @StateObject private var playback = VAetVx4ePF6MzkVp()

  private var NaSuf3ZBukxrG3: Color {
    isWyY8MbQNatzIjnMe
      ? Color(red: 0.72, green: 0.86, blue: 0.24) : Color(red: 0.96, green: 0.23, blue: 0.64)
  }

  var body: some View {
    Button {
      let rs2IZOBLYd7pomvi = VdrecTuKbvUcZqrdjCk.resolbFm2BaYWuWQGlG(ph9xca0pgqMHIkqc)
      guard !rs2IZOBLYd7pomvi.isEmpty, FileManager.default.fileExists(atPath: rs2IZOBLYd7pomvi)
      else {
        return
      }
      playback.toggle(url: URL(fileURLWithPath: rs2IZOBLYd7pomvi))
    } label: {
      HStack(spacing: 10) {
        Image(systemName: playback.HBAp4fbnhEy2Z8 ? "stop.fill" : "play.fill")
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(isWyY8MbQNatzIjnMe ? .black.opacity(0.8) : .white.opacity(0.9))
          .frame(width: 18, height: 18)
        Text("\(s3eezLGy9ksungu)S")
          .font(.system(size: 16))
          .foregroundColor(isWyY8MbQNatzIjnMe ? .black.opacity(0.85) : .white.opacity(0.9))
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 12)
      .background(NaSuf3ZBukxrG3)
      .clipShape(
        UnevenRoundedRectangle(
          topLeadingRadius: 12,
          bottomLeadingRadius: isWyY8MbQNatzIjnMe ? 12 : 0,
          bottomTrailingRadius: isWyY8MbQNatzIjnMe ? 0 : 12,
          topTrailingRadius: 12,
          style: .continuous
        )
      )
    }
    .buttonStyle(.plain)
    .onDisappear { playback.stop() }
  }
}

private struct VeaX3Ewrqii3HkCbu: View {
  let Go07bgQculuhN1: CitemCKH7bUTVNDmixw
  let meavag7AUClncGhfLrr: String
  let oadRNB5kQ6cqzQEq: String

  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      if Go07bgQculuhN1.isMe {
        Spacer(minLength: 36)
      } else {
        avatar(symbol: oadRNB5kQ6cqzQEq)
      }

      VStack(alignment: Go07bgQculuhN1.isMe ? .trailing : .leading, spacing: 6) {
        d3QaGW3w0t52xzBBmd

        Text(Go07bgQculuhN1.timeText)
          .font(.system(size: 12))
          .foregroundColor(.white.opacity(0.55))
      }
      .frame(
        maxWidth: UIScreen.main.bounds.width * 0.72,
        alignment: Go07bgQculuhN1.isMe ? .trailing : .leading)

      if Go07bgQculuhN1.isMe {
        avatar(symbol: meavag7AUClncGhfLrr)
      } else {
        Spacer(minLength: 36)
      }
    }
  }

  @ViewBuilder
  private var d3QaGW3w0t52xzBBmd: some View {
    switch Go07bgQculuhN1.content {
    case .textsqyyplGmDp1J5V(let k7a4qDNkdfTiwB):
      Text(k7a4qDNkdfTiwB)
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(Go07bgQculuhN1.isMe ? .black : .white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          Go07bgQculuhN1.isMe
            ? Color(red: 0.72, green: 0.86, blue: 0.24) : Color(red: 0.96, green: 0.23, blue: 0.64)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: Go07bgQculuhN1.isMe ? 12 : 0,
            bottomTrailingRadius: Go07bgQculuhN1.isMe ? 0 : 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )

    case .emojiImage(let Jt6bfrURgwcGIV):
      Image(Jt6bfrURgwcGIV)
        .resizable()
        .frame(width: 60, height: 60)
        .padding(8)
        .background(
          RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(
              Go07bgQculuhN1.isMe
                ? Color(red: 0.72, green: 0.86, blue: 0.24)
                : Color(red: 0.96, green: 0.23, blue: 0.64)
            )
        )

    case .imgDZNx8Oh4Izihg0(let path):
      let NaSuf3ZBukxrG3 =
        Go07bgQculuhN1.isMe
        ? Color(red: 0.72, green: 0.86, blue: 0.24)
        : Color(red: 0.96, green: 0.23, blue: 0.64)
      ZStack {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(NaSuf3ZBukxrG3)
        ImageLJIzgD4rpc6J6v(
          resource: .filemgaldkOrT8a2cb(path: path),
          placeholder: Image(systemName: "photo"),
          contentMode: .fill
        )
        .foregroundStyle(.white.opacity(0.9))
      }
      .frame(width: 160, height: 160)
      .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

    case .imagePlaceholder:
      ZStack {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(
            Go07bgQculuhN1.isMe
              ? Color(red: 0.72, green: 0.86, blue: 0.24)
              : Color(red: 0.96, green: 0.23, blue: 0.64))

        Image(systemName: "photo")
          .font(.system(size: 38, weight: .semibold))
          .foregroundColor(.white.opacity(0.9))
      }
      .frame(width: 120, height: 120)
      .overlay(
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .stroke(.white.opacity(0.18), lineWidth: 2)
      )

    case .audqCRba8tXDwE4kE(let seconds, let path):
      VbuVNgXh5SaakivIP(
        s3eezLGy9ksungu: seconds, ph9xca0pgqMHIkqc: path, isWyY8MbQNatzIjnMe: Go07bgQculuhN1.isMe)
    }
  }

  private func avatar(symbol: String) -> some View {
    UAvatHpoJa1igYGVKS7(avatarSymbol: symbol, size: 38)
  }
}

private struct CitemCKH7bUTVNDmixw: Identifiable, Equatable {
  enum Content: Equatable {
    case textsqyyplGmDp1J5V(String)
    case emojiImage(name: String)
    case imgDZNx8Oh4Izihg0(path: String)
    case imagePlaceholder
    case audqCRba8tXDwE4kE(seconds: Int, path: String)
  }

  let id: String
  let isMe: Bool
  let content: Content
  let timeText: String
}
