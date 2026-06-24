import Combine
import Foundation

private enum AppDataStorage {
  private static let key = "zOsKKURShLzu5TUp".melyDecoded

  static func load() -> AdatJc1Zwhy2Od8kjZ? {
    guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
    do {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      return try decoder.decode(AdatJc1Zwhy2Od8kjZ.self, from: data)
    } catch {
      print("Failed to decode AdatJc1Zwhy2Od8kjZ: \(error)")
      return nil
    }
  }

  static func save(_ appData: AdatJc1Zwhy2Od8kjZ) {
    do {
      let encoder = JSONEncoder()
      encoder.dateEncodingStrategy = .iso8601
      let data = try encoder.encode(appData)
      UserDefaults.standard.set(data, forKey: key)
    } catch {
      print("Failed to encode AdatJc1Zwhy2Od8kjZ: \(error)")
    }
  }
}

final class MelystoreWpvugHy89HDWLR: ObservableObject {
  @Published private(set) var izHqrtotvfHu1g: AdatJc1Zwhy2Od8kjZ
  @Published var S2E4yyK8CsIEumtoast: Bool = false

  init() {
    if let NPdkZTCy7oA6p1 = AppDataStorage.load() {
      izHqrtotvfHu1g = NPdkZTCy7oA6p1
      if izHqrtotvfHu1g.adCh2Hx7Wn.isEmpty {
        izHqrtotvfHu1g.adCh2Hx7Wn = Self.defchab6gAGvtllPIir7()
        save()
      }
      if izHqrtotvfHu1g.adCv5Jt8Lp.isEmpty && !izHqrtotvfHu1g.adCh2Hx7Wn.isEmpty {
        izHqrtotvfHu1g.adCv5Jt8Lp = Self.defvfrRJa2Lk1Xd695y2(izHqrtotvfHu1g.adCh2Hx7Wn)
        save()
      }
    } else {
      let sample = AdatJc1Zwhy2Od8kjZ.makeSample()
      izHqrtotvfHu1g = sample
      AppDataStorage.save(sample)
    }
  }

  fileprivate static func defchab6gAGvtllPIir7() -> [DancozZ6LtwXHtlqPu] {
    return [
      DancozZ6LtwXHtlqPu(
        "F1Ms".melyDecoded,
        "GhY".melyDecoded,
        "gqzE-HAUVmhl2brU5RE5Cg6P9pH3XhQ".melyDecoded,
        "q9V8ph41lXTH_tiao1",
        false,
        "ZoWs08QY".melyDecoded,
        12_500,
        "aHuOvb32EGJdYb68luAUIg971ML5xMQCUE80h4jR6QgoV12S_lUW9o_d2SQvZTWB16s".melyDecoded
      ),
      DancozZ6LtwXHtlqPu(
        "F1Mv".melyDecoded,
        "GhA".melyDecoded,
        "kcToFFZjfYKih9j2AzdbKPSmh7QSaGx4uQ".melyDecoded,
        "q9V8ph41lXTH_tiao2",
        false,
        "ZoWs08QY".melyDecoded,
        12_500,
        "h6XceNHMQRZyiJbc7VEpTTGQpZn4RgJHA4qh0dJdPEF6wtWaoF8".melyDecoded
      ),
    ]
  }

  fileprivate static func defcvde4Rl8crQZaI2PM() -> [Chalvdngt3SE6MdwaZYu] {
    defvfrRJa2Lk1Xd695y2(defchab6gAGvtllPIir7())
  }

  fileprivate static func defvfrRJa2Lk1Xd695y2(_ TZ0NRqWtj5lec8: [DancozZ6LtwXHtlqPu])
    -> [Chalvdngt3SE6MdwaZYu]
  {
    TZ0NRqWtj5lec8.flatMap { _ in defvdour78fT2fFvihde() }
  }

  private func save() {
    AppDataStorage.save(izHqrtotvfHu1g)
  }

  var curp11O3LYjA9ooct: UserteYT4uBeg4ObJP? {
    guard let id = izHqrtotvfHu1g.adCu1Zp6Hm else { return nil }
    return izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == id })
  }

  private var blouidsNa5VyRPgR0K5bc: Set<String> {
    Set(curp11O3LYjA9ooct?.uBh9Ca1Zs ?? [])
  }

  var filpostsyoSdYIQh87ZAr: [CPolpIKsl1mUtFVfy] {
    izHqrtotvfHu1g.adPs6Gk1Rv.filter { !blouidsNa5VyRPgR0K5bc.contains($0.pUp4Mx7Cs) }
  }

  var filchasD9OgZwYuwgrF4I: [DancozZ6LtwXHtlqPu] {
    izHqrtotvfHu1g.adCh2Hx7Wn.filter { !blouidsNa5VyRPgR0K5bc.contains($0.dUr4Mp7Ks) }
  }

  var filvdosMDzuiVrv1HceiS: [Chalvdngt3SE6MdwaZYu] {
    izHqrtotvfHu1g.adCv5Jt8Lp.filter { !blouidsNa5VyRPgR0K5bc.contains($0.vUv6Fr1Qd) }
  }

  func filcommsaK2Y3ya7K6GDsB(postId: String) -> [CommunityCommentModel] {
    izHqrtotvfHu1g.adCm3Bc9Nx
      .filter { $0.cmPo4Ne7Lk == postId && !blouidsNa5VyRPgR0K5bc.contains($0.cmUc6Fr1Qx) }
  }

  var filcvrsKNV3sVIZ1SzZc9: [Convs8RlUjf8GEZRmYA] {
    guard let LXLqLOWD2jfPUz = izHqrtotvfHu1g.adCu1Zp6Hm else { return [] }
    return izHqrtotvfHu1g.adCo7Df2Qs.filter { conv in
      conv.cPu3Ks1Zx.contains(LXLqLOWD2jfPUz)
        && !conv.cPu3Ks1Zx.contains { blouidsNa5VyRPgR0K5bc.contains($0) }
    }
  }

  func getOrCreateConversation(with G9QBLhkzBII6lO: String) -> String? {
    guard let LXLqLOWD2jfPUz = izHqrtotvfHu1g.adCu1Zp6Hm,
      LXLqLOWD2jfPUz != G9QBLhkzBII6lO,
      izHqrtotvfHu1g.adUr9Mz3Qc.contains(where: { $0.id == G9QBLhkzBII6lO })
    else { return nil }
    let ids = Set([LXLqLOWD2jfPUz, G9QBLhkzBII6lO])
    if let existing = izHqrtotvfHu1g.adCo7Df2Qs.first(where: {
      Set($0.cPu3Ks1Zx) == ids
    }) {
      return existing.id
    }
    let newConv = Convs8RlUjf8GEZRmYA(
      UUID().uuidString,
      [LXLqLOWD2jfPUz, G9QBLhkzBII6lO]
    )
    izHqrtotvfHu1g.adCo7Df2Qs.insert(newConv, at: 0)
    save()
    return newConv.id
  }

  enum AuErizHqrtotvfHu1g: LocalizedError {
    case unfFC85yaKDytarCR
    case eaeLFP7BXYUka0Wpm
    case wpWvt5azeUSWfZht

    var errorDescription: String? {
      switch self {
      case .unfFC85yaKDytarCR:
        return "S3yZ9vz6HS1RYL_u0uIEIkx53sX1gdUfBEg6zrXN4xsvUxOUu8LgCnBaK4mrlccdGwo".melyDecoded
      case .eaeLFP7BXYUka0Wpm:
        return "SH2KpL79FCJOY-Su0egUNRxlbtmlxcsbBlh6i5-A8x44Xl-TuNbrHCkeBsSrnMEKTElcYO6hx7MTNmZ6hqja-RE".melyDecoded
      case .wpWvt5azeUSWfZht:
        return "cZ-8xNAWOER3y5jC6hM1WzmWvsz6VSsyY3zXt_j1RT5ccrm1jw".melyDecoded
      }
    }
  }

  func markEULAAccepted() {
    guard !izHqrtotvfHu1g.adHa2Yt5Jb else { return }
    izHqrtotvfHu1g.adHa2Yt5Jb = true
    save()
  }

  func newB1HIkW9FtwqtKnlog() {
    if let RYXLo3UdNseu7c = izHqrtotvfHu1g.adQk4Nr9Vx,
      izHqrtotvfHu1g.adUr9Mz3Qc.contains(where: { $0.id == RYXLo3UdNseu7c })
    {
      izHqrtotvfHu1g.adCu1Zp6Hm = RYXLo3UdNseu7c
      save()
      return
    }

    let UqQJ7eQ5jcjmRq = String(Int(Date().timeIntervalSince1970))
    let Wr9WXfGeOsPqyl = UqQJ7eQ5jcjmRq.suffix(4)
    let O1kPPN3xS9caFS = UserteYT4uBeg4ObJP(
      UUID().uuidString,
      "SWSWqOk".melyDecoded + "\(Wr9WXfGeOsPqyl)",
      "mely_defava",
      nil,
      nil,
      true,
      0,
      [],
      [],
      [],
      [],
      []
    )

    izHqrtotvfHu1g.adUr9Mz3Qc.append(O1kPPN3xS9caFS)
    izHqrtotvfHu1g.adCu1Zp6Hm = O1kPPN3xS9caFS.id
    izHqrtotvfHu1g.adQk4Nr9Vx = O1kPPN3xS9caFS.id
    save()
  }

  func denloginF3jsApBVSAQGZU(FkjlDAvGK5B6KO: String, PQ60pPWNJ0DEn5: String) throws {
    guard
      let SasdCIDR6ZA6eV = izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.uEs1Fw9Hb == FkjlDAvGK5B6KO }
      )
    else {
      throw AuErizHqrtotvfHu1g.unfFC85yaKDytarCR
    }
    guard SasdCIDR6ZA6eV.uPk6Tr3Yv == PQ60pPWNJ0DEn5 else {
      throw AuErizHqrtotvfHu1g.wpWvt5azeUSWfZht
    }
    izHqrtotvfHu1g.adCu1Zp6Hm = SasdCIDR6ZA6eV.id
    save()
  }

  func signunSdjEjqbNc2QU7(K4VbtUDRr8jBB7: String, p4NifCezx0jbi95: String) throws {
    if izHqrtotvfHu1g.adUr9Mz3Qc.contains(where: { $0.uEs1Fw9Hb == K4VbtUDRr8jBB7 }) {
      throw AuErizHqrtotvfHu1g.eaeLFP7BXYUka0Wpm
    }

    let n42wFUteS2DX5p =
      K4VbtUDRr8jBB7.split(separator: "@").first.map(String.init) ?? K4VbtUDRr8jBB7
    let PhkWO01VseiknH = UserteYT4uBeg4ObJP(
      UUID().uuidString,
      n42wFUteS2DX5p,
      "mely_defava",
      K4VbtUDRr8jBB7,
      p4NifCezx0jbi95,
      false,
      0,
      [],
      [],
      [],
      [],
      []
    )

    izHqrtotvfHu1g.adUr9Mz3Qc.append(PhkWO01VseiknH)
    izHqrtotvfHu1g.adCu1Zp6Hm = PhkWO01VseiknH.id
    save()
  }

  func reFk5zPOYd1fAtqS(Yi8WCvaaatLQJt: String, r8SqGvRFSDz2WU: String) throws {
    guard
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.uEs1Fw9Hb == Yi8WCvaaatLQJt })
    else {
      throw AuErizHqrtotvfHu1g.unfFC85yaKDytarCR
    }

    izHqrtotvfHu1g.adUr9Mz3Qc[index].uPk6Tr3Yv = r8SqGvRFSDz2WU
    save()
  }

  func logout7R5GwJBX0TvWiE() {
    guard izHqrtotvfHu1g.adCu1Zp6Hm != nil else { return }
    izHqrtotvfHu1g.adCu1Zp6Hm = nil
    save()
  }

  func delOvJBGtG8mSWowf() {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm else { return }
    guard
      let uidx6RWHRKHg34OEc8 = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: {
        $0.id == cid0FehauhLAbcSi9
      })
    else {
      return
    }

    let curOEDC0wQiuVOV8t = izHqrtotvfHu1g.adUr9Mz3Qc[uidx6RWHRKHg34OEc8]

    for EdLevDRuhfgCd7 in curOEDC0wQiuVOV8t.uLc5Vw2Kd {
      decrementLikeCount(k9J0Ya7w5knCLj: EdLevDRuhfgCd7)
    }

    let userPostIds = Set(
      izHqrtotvfHu1g.adPs6Gk1Rv.filter { $0.pUp4Mx7Cs == cid0FehauhLAbcSi9 }.map(\.id))

    let commentsToRemove = izHqrtotvfHu1g.adCm3Bc9Nx.filter {
      $0.cmUc6Fr1Qx == cid0FehauhLAbcSi9 || userPostIds.contains($0.cmPo4Ne7Lk)
    }
    for qeIcWtG9SuEoBb in commentsToRemove where !userPostIds.contains(qeIcWtG9SuEoBb.cmPo4Ne7Lk) {
      if let idx = izHqrtotvfHu1g.adPs6Gk1Rv.firstIndex(where: {
        $0.id == qeIcWtG9SuEoBb.cmPo4Ne7Lk
      }) {
        izHqrtotvfHu1g.adPs6Gk1Rv[idx].pCc8Jt4Vm = max(
          0,
          izHqrtotvfHu1g.adPs6Gk1Rv[idx].pCc8Jt4Vm - 1
        )
      }
    }
    izHqrtotvfHu1g.adCm3Bc9Nx.removeAll {
      $0.cmUc6Fr1Qx == cid0FehauhLAbcSi9 || userPostIds.contains($0.cmPo4Ne7Lk)
    }

    let userChallengeIds = Set(
      izHqrtotvfHu1g.adCh2Hx7Wn.filter { $0.dUr4Mp7Ks == cid0FehauhLAbcSi9 }.map(\.id))

    var filesToDelete: [String] = []

    for QelXdeqmoNoX2z in izHqrtotvfHu1g.adPs6Gk1Rv
    where QelXdeqmoNoX2z.pUp4Mx7Cs == cid0FehauhLAbcSi9 {
      if QelXdeqmoNoX2z.pIn6Fw1Zd.contains("/") { filesToDelete.append(QelXdeqmoNoX2z.pIn6Fw1Zd) }
    }

    for BJv8YUY6AjV6XI in izHqrtotvfHu1g.adCh2Hx7Wn
    where BJv8YUY6AjV6XI.dUr4Mp7Ks == cid0FehauhLAbcSi9 {
      if let cSdT6d6Lsvh76y = BJv8YUY6AjV6XI.dIn1Xy8Ck, cSdT6d6Lsvh76y.contains("/") {
        filesToDelete.append(cSdT6d6Lsvh76y)
      }
    }

    let uvidEGz1MX5f1WSvqc = Set(
      izHqrtotvfHu1g.adCv5Jt8Lp
        .filter { $0.vUv6Fr1Qd == cid0FehauhLAbcSi9 || userChallengeIds.contains($0.vCh4Ne7Lp) }
        .map(\.id)
    )
    for q6LzpnJoUJYTYA in izHqrtotvfHu1g.adCv5Jt8Lp
    where uvidEGz1MX5f1WSvqc.contains(q6LzpnJoUJYTYA.id) {
      if let cSdT6d6Lsvh76y = q6LzpnJoUJYTYA.vVn7Px5Lm, cSdT6d6Lsvh76y.contains("/") {
        filesToDelete.append(cSdT6d6Lsvh76y)
      }
      if let thumb = q6LzpnJoUJYTYA.vTn3Hw8Zc, thumb.contains("/") { filesToDelete.append(thumb) }
    }

    for msg in izHqrtotvfHu1g.adMs8Lw4Ty where msg.mUd6Ts3Kw == cid0FehauhLAbcSi9 {
      if let p = msg.mIm5Wr7Dz, p.contains("/") { filesToDelete.append(p) }
      if let p = msg.mAu3Nk6Ps, p.contains("/") { filesToDelete.append(p) }
    }

    if curOEDC0wQiuVOV8t.uQd8Nv5tK.contains("/") {
      filesToDelete.append(curOEDC0wQiuVOV8t.uQd8Nv5tK)
    }

    for path in filesToDelete {
      ImgstorehR7h57Xdriq7hH.delfea2YWDujo83URtl(relativePath: path)
    }

    izHqrtotvfHu1g.adPs6Gk1Rv.removeAll { $0.pUp4Mx7Cs == cid0FehauhLAbcSi9 }
    izHqrtotvfHu1g.adCh2Hx7Wn.removeAll { $0.dUr4Mp7Ks == cid0FehauhLAbcSi9 }
    izHqrtotvfHu1g.adCv5Jt8Lp.removeAll { uvidEGz1MX5f1WSvqc.contains($0.id) }
    izHqrtotvfHu1g.adMs8Lw4Ty.removeAll { $0.mUd6Ts3Kw == cid0FehauhLAbcSi9 }
    izHqrtotvfHu1g.adCo7Df2Qs.removeAll { $0.cPu3Ks1Zx.contains(cid0FehauhLAbcSi9) }
    izHqrtotvfHu1g.adUr9Mz3Qc.removeAll { $0.id == cid0FehauhLAbcSi9 }

    for i in izHqrtotvfHu1g.adUr9Mz3Qc.indices {
      izHqrtotvfHu1g.adUr9Mz3Qc[i].uFm7Xr8Lp.removeAll { $0 == cid0FehauhLAbcSi9 }
      izHqrtotvfHu1g.adUr9Mz3Qc[i].uFn3Te6Qb.removeAll { $0 == cid0FehauhLAbcSi9 }
      izHqrtotvfHu1g.adUr9Mz3Qc[i].uBh9Ca1Zs.removeAll { $0 == cid0FehauhLAbcSi9 }
    }

    if izHqrtotvfHu1g.adQk4Nr9Vx == cid0FehauhLAbcSi9 {
      izHqrtotvfHu1g.adQk4Nr9Vx = nil
    }
    izHqrtotvfHu1g.adCu1Zp6Hm = nil
    objectWillChange.send()
    save()
  }

  func updcurN1qgl1w1c1h58n(name: String? = nil, avatarSymbol: String? = nil) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return }
    if let cSdT6d6Lsvh76y = name,
      !cSdT6d6Lsvh76y.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    {
      izHqrtotvfHu1g.adUr9Mz3Qc[index].uZp7Lm2cR = cSdT6d6Lsvh76y.trimmingCharacters(
        in: .whitespacesAndNewlines)
    }
    if let avatarSymbol = avatarSymbol {
      izHqrtotvfHu1g.adUr9Mz3Qc[index].uQd8Nv5tK = avatarSymbol
    }
    save()
  }

  func adddiaITm0FyiVkVf6j6(_ amount: Int) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return }
    izHqrtotvfHu1g.adUr9Mz3Qc[index].uDg2Jy5Wx += amount
    save()
  }

  func deductDiamonds(_ uswUmS3j8xxTFG: Int) -> Bool {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return false }
    guard izHqrtotvfHu1g.adUr9Mz3Qc[index].uDg2Jy5Wx >= uswUmS3j8xxTFG else { return false }
    izHqrtotvfHu1g.adUr9Mz3Qc[index].uDg2Jy5Wx -= uswUmS3j8xxTFG
    save()
    return true
  }

  func isvdoDkAmIFRsnF0ebX(_ vdo5yHDvn72Mra7Io: Chalvdngt3SE6MdwaZYu) -> Bool {
    guard vdo5yHDvn72Mra7Io.vIl8Ks4Bw else { return false }
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let txg3C7ja9EBLkz = izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return true }
    return !txg3C7ja9EBLkz.uUv8Hp4Nj.contains(vdo5yHDvn72Mra7Io.id)
  }

  func unlockVideo(videoId: String) -> Bool {
    guard let video = izHqrtotvfHu1g.adCv5Jt8Lp.first(where: { $0.id == videoId }),
      video.vIl8Ks4Bw,
      let cost = video.vUd5Rp2Xy, cost > 0
    else { return false }
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let userIndex = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return false }
    guard !izHqrtotvfHu1g.adUr9Mz3Qc[userIndex].uUv8Hp4Nj.contains(videoId) else { return true }
    guard deductDiamonds(cost) else { return false }
    objectWillChange.send()
    izHqrtotvfHu1g.adUr9Mz3Qc[userIndex].uUv8Hp4Nj.append(videoId)
    save()
    return true
  }

  func boQkspadWNHlX2WBuser(uid: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return }
    guard !izHqrtotvfHu1g.adUr9Mz3Qc[index].uBh9Ca1Zs.contains(uid) else { return }
    objectWillChange.send()
    izHqrtotvfHu1g.adUr9Mz3Qc[index].uBh9Ca1Zs.append(uid)
    save()
    S2E4yyK8CsIEumtoast = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      self?.S2E4yyK8CsIEumtoast = false
    }
  }

  func unbol09gWb9KvHD4JjV(uid: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return }
    objectWillChange.send()
    izHqrtotvfHu1g.adUr9Mz3Qc[index].uBh9Ca1Zs.removeAll { $0 == uid }
    save()
  }

  func fowus97mjk3D9vlxCqB(uid: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let cubw5oTnt4N7xNqe = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: {
        $0.id == cid0FehauhLAbcSi9
      }
      ),
      let t5XbyBRu7lnoaxR = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == uid }),
      cid0FehauhLAbcSi9 != uid
    else { return }
    if !izHqrtotvfHu1g.adUr9Mz3Qc[cubw5oTnt4N7xNqe].uFn3Te6Qb.contains(uid) {
      izHqrtotvfHu1g.adUr9Mz3Qc[cubw5oTnt4N7xNqe].uFn3Te6Qb.append(uid)
      izHqrtotvfHu1g.adUr9Mz3Qc[t5XbyBRu7lnoaxR].uFm7Xr8Lp.append(cid0FehauhLAbcSi9)
      save()
    }
  }

  func unfowtfG415dyvn173J(uid: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let cubw5oTnt4N7xNqe = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: {
        $0.id == cid0FehauhLAbcSi9
      }
      ),
      let t5XbyBRu7lnoaxR = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: { $0.id == uid })
    else { return }
    izHqrtotvfHu1g.adUr9Mz3Qc[cubw5oTnt4N7xNqe].uFn3Te6Qb.removeAll { $0 == uid }
    izHqrtotvfHu1g.adUr9Mz3Qc[t5XbyBRu7lnoaxR].uFm7Xr8Lp.removeAll { $0 == cid0FehauhLAbcSi9 }
    save()
  }

  func isfings9wxsR6YeqeKUh(_ uid: String) -> Bool {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let curOEDC0wQiuVOV8t = izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return false }
    return curOEDC0wQiuVOV8t.uFn3Te6Qb.contains(uid)
  }

  func isl2Mk3WADzckzIvN(_ k9J0Ya7w5knCLj: String) -> Bool {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let curOEDC0wQiuVOV8t = izHqrtotvfHu1g.adUr9Mz3Qc.first(where: { $0.id == cid0FehauhLAbcSi9 })
    else { return false }
    return curOEDC0wQiuVOV8t.uLc5Vw2Kd.contains(k9J0Ya7w5knCLj)
  }

  func liekctnfMHSlTReaFYI7V(_ k9J0Ya7w5knCLj: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let qqzUC4q244IW5o = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: {
        $0.id == cid0FehauhLAbcSi9
      })
    else { return }
    guard !izHqrtotvfHu1g.adUr9Mz3Qc[qqzUC4q244IW5o].uLc5Vw2Kd.contains(k9J0Ya7w5knCLj) else {
      return
    }

    izHqrtotvfHu1g.adUr9Mz3Qc[qqzUC4q244IW5o].uLc5Vw2Kd.append(k9J0Ya7w5knCLj)
    incre5ybc6vZi1Wkngj(k9J0Ya7w5knCLj: k9J0Ya7w5knCLj)
    save()
  }

  func unlctnafBiiyIvDuaBKR(_ k9J0Ya7w5knCLj: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let qqzUC4q244IW5o = izHqrtotvfHu1g.adUr9Mz3Qc.firstIndex(where: {
        $0.id == cid0FehauhLAbcSi9
      })
    else { return }
    guard izHqrtotvfHu1g.adUr9Mz3Qc[qqzUC4q244IW5o].uLc5Vw2Kd.contains(k9J0Ya7w5knCLj) else {
      return
    }

    izHqrtotvfHu1g.adUr9Mz3Qc[qqzUC4q244IW5o].uLc5Vw2Kd.removeAll { $0 == k9J0Ya7w5knCLj }
    decrementLikeCount(k9J0Ya7w5knCLj: k9J0Ya7w5knCLj)
    save()
  }

  private enum LikableContent {
    case kqcrIOUBWXg98I(index: Int)
    case video(index: Int)
  }

  private func resvzAzCF8VYaL1QLd(_ k9J0Ya7w5knCLj: String) -> LikableContent? {
    if let idx = izHqrtotvfHu1g.adPs6Gk1Rv.firstIndex(where: { $0.id == k9J0Ya7w5knCLj }) {
      return .kqcrIOUBWXg98I(index: idx)
    }
    if let idx = izHqrtotvfHu1g.adCv5Jt8Lp.firstIndex(where: { $0.id == k9J0Ya7w5knCLj }) {
      return .video(index: idx)
    }
    return nil
  }

  private func incre5ybc6vZi1Wkngj(k9J0Ya7w5knCLj: String) {
    guard let TXc9apAt7Ni3NH = resvzAzCF8VYaL1QLd(k9J0Ya7w5knCLj) else { return }
    switch TXc9apAt7Ni3NH {
    case .kqcrIOUBWXg98I(let index):
      izHqrtotvfHu1g.adPs6Gk1Rv[index].pLc3Gy9Wk += 1
    case .video(let index):
      izHqrtotvfHu1g.adCv5Jt8Lp[index].vLc1Gy9Ht += 1
    }
  }

  private func decrementLikeCount(k9J0Ya7w5knCLj: String) {
    guard let TXc9apAt7Ni3NH = resvzAzCF8VYaL1QLd(k9J0Ya7w5knCLj) else { return }
    switch TXc9apAt7Ni3NH {
    case .kqcrIOUBWXg98I(let index):
      izHqrtotvfHu1g.adPs6Gk1Rv[index].pLc3Gy9Wk = max(
        0, izHqrtotvfHu1g.adPs6Gk1Rv[index].pLc3Gy9Wk - 1)
    case .video(let index):
      izHqrtotvfHu1g.adCv5Jt8Lp[index].vLc1Gy9Ht = max(
        0, izHqrtotvfHu1g.adCv5Jt8Lp[index].vLc1Gy9Ht - 1)
    }
  }

  func addpovld91tRyZPL4dv(
    img77fPMguhLib7Qy: String, tags: [String], desipFMrUE7eWUztp: String = ""
  ) {
    guard let currentUserId = izHqrtotvfHu1g.adCu1Zp6Hm else { return }
    let KnMb1vBb3JaNjz = CPolpIKsl1mUtFVfy(
      UUID().uuidString,
      currentUserId,
      img77fPMguhLib7Qy,
      desipFMrUE7eWUztp,
      tags,
      0,
      0,
      Date()
    )
    izHqrtotvfHu1g.adPs6Gk1Rv.insert(KnMb1vBb3JaNjz, at: 0)
    save()
  }

  func adcomTrPX4Y7I4j3Xj0(txtBWCckiMBZeExKZ: String, to X7plePK6UNrFLH: String) {
    guard let Re43tslUHpvmho = izHqrtotvfHu1g.adCu1Zp6Hm,
      !txtBWCckiMBZeExKZ.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    else { return }

    let c50dGc6uY7nnWXQ = CommunityCommentModel(
      UUID().uuidString,
      X7plePK6UNrFLH,
      Re43tslUHpvmho,
      txtBWCckiMBZeExKZ,
      Date()
    )

    izHqrtotvfHu1g.adCm3Bc9Nx.append(c50dGc6uY7nnWXQ)

    if let index = izHqrtotvfHu1g.adPs6Gk1Rv.firstIndex(where: { $0.id == X7plePK6UNrFLH }) {
      izHqrtotvfHu1g.adPs6Gk1Rv[index].pCc8Jt4Vm += 1
    }

    save()
  }

  func adchaG3G6yAAgJ7cUJE(gzUGAsAiYTc7Dv: String, rule: String, covHMcwQvUcHm3NmI: String?) {
    let c2iD2yx0Zssl4h3 = izHqrtotvfHu1g.adCu1Zp6Hm ?? "GhU".melyDecoded
    let challenge = DancozZ6LtwXHtlqPu(
      UUID().uuidString,
      c2iD2yx0Zssl4h3,
      gzUGAsAiYTc7Dv,
      covHMcwQvUcHm3NmI,
      false,
      "ZoWs08QY".melyDecoded,
      0,
      rule
    )
    izHqrtotvfHu1g.adCh2Hx7Wn.insert(challenge, at: 0)
    let defaultVideos = Self.defvdour78fT2fFvihde()
    izHqrtotvfHu1g.adCv5Jt8Lp.insert(contentsOf: defaultVideos, at: 0)
    save()
  }

  func advdonqvuaQ5wP0xLwf(
    LuHT6IbHDcGq0N: String,
    RJQh7nvW6vkfpu: String,
    tum7xBLorz4Cj7VHZ: String,
    FSS8h4RGqA6OZ0: Int?
  ) {
    guard let fQJpNSvakv1tyE = izHqrtotvfHu1g.adCu1Zp6Hm else { return }
    let nVINh9RANCAwj8 = (FSS8h4RGqA6OZ0 ?? 0) > 0
    let dQeRuvcUY63yXa = Chalvdngt3SE6MdwaZYu(
      UUID().uuidString,
      LuHT6IbHDcGq0N,
      fQJpNSvakv1tyE,
      tum7xBLorz4Cj7VHZ,
      RJQh7nvW6vkfpu,
      0,
      nVINh9RANCAwj8,
      nVINh9RANCAwj8 ? FSS8h4RGqA6OZ0 : nil
    )
    izHqrtotvfHu1g.adCv5Jt8Lp.insert(dQeRuvcUY63yXa, at: 0)
    save()
  }

  fileprivate static func defvdour78fT2fFvihde() -> [Chalvdngt3SE6MdwaZYu] {
    return [
      Chalvdngt3SE6MdwaZYu(
        "HUEs".melyDecoded, "F1Ms".melyDecoded, "GhY".melyDecoded,
        "I7SrplfHHwLH_feng1", "LH9Ij4T7pggub1ygid3oH2gG".melyDecoded, 339,
        false,
        nil),
      Chalvdngt3SE6MdwaZYu(
        "HUEv".melyDecoded, "F1Ms".melyDecoded, "Ghc".melyDecoded,
        "I7SrplfHHwLH_feng2", "LH9Ij4T7pggub1ygid3oH2gF".melyDecoded, 124,
        true,
        300),
      Chalvdngt3SE6MdwaZYu(
        "HUEu".melyDecoded, "F1Mv".melyDecoded, "GhA".melyDecoded,
        "I7SrplfHHwLH_feng3", "LH9Ij4T7pggub1ygid3oH2gE".melyDecoded, 56,
        false,
        nil),
      Chalvdngt3SE6MdwaZYu(
        "HUEp".melyDecoded, "F1Mv".melyDecoded, "GhE".melyDecoded,
        "I7SrplfHHwLH_feng4", "LH9Ij4T7pggub1ygid3oH2gD".melyDecoded, 770,
        true,
        300),
    ]
  }

  func clearQMvJVGDzgFTU2L(for conversationId: String) {
    guard let cid0FehauhLAbcSi9 = izHqrtotvfHu1g.adCu1Zp6Hm,
      let index = izHqrtotvfHu1g.adCo7Df2Qs.firstIndex(where: { $0.id == conversationId })
    else { return }
    izHqrtotvfHu1g.adCo7Df2Qs[index].cUc2Yp5Hd[cid0FehauhLAbcSi9] = 0
    save()
  }

  func admsgcmdox9iZwe6S1f(
    ttyJnAURFG0loRE3: String,
    tyowLXhwa7xvGmX9: MSgOumAbwJ0MP1dZO.MessageType = .text,
    imgXlM2LjsURmUuuM: String? = nil,
    aud8kqhqVQyIuYzTv: String? = nil,
    aduraTtGnBLLkPYskli: Int? = nil,
    to conversationId: String
  ) {
    guard let sQ0TD39W5JNJZw = izHqrtotvfHu1g.adCu1Zp6Hm else { return }

    let message = MSgOumAbwJ0MP1dZO(
      UUID().uuidString,
      conversationId,
      sQ0TD39W5JNJZw,
      ttyJnAURFG0loRE3,
      tyowLXhwa7xvGmX9,
      imgXlM2LjsURmUuuM,
      aud8kqhqVQyIuYzTv,
      aduraTtGnBLLkPYskli,
      Date()
    )

    izHqrtotvfHu1g.adMs8Lw4Ty.append(message)

    if let index = izHqrtotvfHu1g.adCo7Df2Qs.firstIndex(where: { $0.id == conversationId }) {
      izHqrtotvfHu1g.adCo7Df2Qs[index].cLm6Er8Cv = message.id
      for LgL5Hga6qGnQ7o in izHqrtotvfHu1g.adCo7Df2Qs[index].cPu3Ks1Zx
      where LgL5Hga6qGnQ7o != sQ0TD39W5JNJZw {
        let cur = izHqrtotvfHu1g.adCo7Df2Qs[index].cUc2Yp5Hd[LgL5Hga6qGnQ7o] ?? 0
        izHqrtotvfHu1g.adCo7Df2Qs[index].cUc2Yp5Hd[LgL5Hga6qGnQ7o] = cur + 1
      }
    }

    save()
  }
}

extension AdatJc1Zwhy2Od8kjZ {
  static func makeSample() -> AdatJc1Zwhy2Od8kjZ {
    let lAe1qkyDtNkCsbusers: [UserteYT4uBeg4ObJP] = [
      .init(
        "GhU".melyDecoded,
        "StSk1oAQ".melyDecoded,
        "Ja1iuGwTBJ8T_ava1",
        "zg0sS3mat8_hDklJfYQ".melyDecoded,
        "GtL7joRD".melyDecoded
      ),
      .init(
        "GhY".melyDecoded,
        "qrfZ8D4xVTg".melyDecoded,
        "Ja1iuGwTBJ8T_ava2"
      ),
      .init("Ghc".melyDecoded, "kMnqGgxVd5ylwg".melyDecoded, "Ja1iuGwTBJ8T_ava3"),
      .init("GhA".melyDecoded, "ZGWFvQ".melyDecoded, "Ja1iuGwTBJ8T_ava4"),
      .init("GhE".melyDecoded, "jqPY8zs-Xmk".melyDecoded, "Ja1iuGwTBJ8T_ava5"),
      .init("GhI".melyDecoded, "WXyWp_s".melyDecoded, "Ja1iuGwTBJ8T_ava6"),
      .init("GhM".melyDecoded, "QGeJtw".melyDecoded, "Ja1iuGwTBJ8T_ava7"),
      .init("Ghw".melyDecoded, "SGSTvuM".melyDecoded, "Ja1iuGwTBJ8T_ava8"),
    ]

    let rYoDbpQbamNiKVcuid: String? = nil

    let ciee6dLFwqfsNJ = DateFormatter()
    ciee6dLFwqfsNJ.dateFormat = "ntX9B1h8W8eowg".melyDecoded
    let aug1 = ciee6dLFwqfsNJ.date(from: "1Zy2S1gBLsf8lw".melyDecoded) ?? Date()
    let mar4 = ciee6dLFwqfsNJ.date(from: "1Zy2S1gBJcf8kg".melyDecoded) ?? Date()
    let cmposh7bTdv5CsEubxZ: [CPolpIKsl1mUtFVfy] = [
      .init(
        "HUcs".melyDecoded, "GhE".melyDecoded, "jbTdcdQfTk5W_day11", "3fsRYG9infxKC_ft0JhkVA0ltOWj0zVRCWnW1w".melyDecoded,
        ["XHCWp_s".melyDecoded], 0, 1, aug1),
      .init(
        "HUcv".melyDecoded, "GhI".melyDecoded, "jbTdcdQfTk5W_day21",
        "8xEyWQuXtt30BxdXcoqqy6sSdUdlzJjFiQAvTBNng6fBvC0_CHKGtJnpRj9cN7auoecIcHR9kezT4SA6".melyDecoded,
        ["dpaw3tUUJg".melyDecoded], 0, 1, aug1),
      .init(
        "HUcu".melyDecoded, "GhM".melyDecoded, "jbTdcdQfTk5W_day31",
        "0ecEJTRb16nE4WI9IBZ_i-GMqRYKQneRn8f4".melyDecoded,
        ["XHCWp_s".melyDecoded], 12, 1, Date()),
      .init(
        "HUcp".melyDecoded, "Ghw".melyDecoded, "jbTdcdQfTk5W_day41",
        "dJCrzo8KNEBrn8jU9hIpWz6GsoX5GSMqMHaArarhADtScLm1xA".melyDecoded,
        ["d2WXrvA".melyDecoded], 8, 1, Date()),
    ]

    let cocmsWareYcGP10Xiqt: [CommunityCommentModel] = [
      .init(
        "HVQs".melyDecoded, "HUcs".melyDecoded, "Ghc".melyDecoded,
        "BjNUJbutzv8cI289grbb7EZ4CCqFs-_kM2NaeLW7wKnnHAxMK5C5y6wUbRxtx84".melyDecoded, mar4),
      .init("HVQv".melyDecoded, "HUcv".melyDecoded, "GhA".melyDecoded, "DiUCdrq-zfQPJnBg1Ck7Ow".melyDecoded, mar4),
      .init(
        "HVQu".melyDecoded, "HUcu".melyDecoded, "GhY".melyDecoded, "qMj_WAUQYoOu1fm3AiFMKMe8ib8MaHFs_Q".melyDecoded, Date()
      ),
      .init(
        "HVQp".melyDecoded, "HUcp".melyDecoded, "GhE".melyDecoded, "JVp20IzduQopD0OdsM3yUHxeDyCTpf74MDxCIeYwPgnV".melyDecoded,
        Date()),
    ]

    let covsXp52K6gTy4IKan: [Convs8RlUjf8GEZRmYA] = [
      .init(
        "DBU".melyDecoded,
        ["GhU".melyDecoded, "GhY".melyDecoded],
        nil,
        ["GhU".melyDecoded: 1]
      ),
      .init(
        "DBY".melyDecoded,
        ["GhU".melyDecoded, "Ghc".melyDecoded],
        nil,
        ["GhU".melyDecoded: 1]
      ),
    ]

    let mgsPa2genkxGj8zwq: [MSgOumAbwJ0MP1dZO] = [
      .init(
        "AhU".melyDecoded,
        "DBU".melyDecoded,
        "GhY".melyDecoded,
        "wfcUNSRsgqqd8jM9WGOcrcX9SmMMJru8rvACKwdDYZL10tRRK19kg_Hd_w".melyDecoded,
        .text,
        nil,
        nil,
        nil,
        Date()
      ),
      .init(
        "AhY".melyDecoded,
        "DBY".melyDecoded,
        "Ghc".melyDecoded,
        "wvcQYWdtianY-yZ5Rmmd_pb0WXRJO_Sg_acbPB5TL5y7yd8DIk1kj_PD4Q".melyDecoded,
        .text,
        nil,
        nil,
        nil,
        Date()
      ),
    ]

    var cwlsUdrAKgmk6SYsC3 = covsXp52K6gTy4IKan
    for (index, conv) in cwlsUdrAKgmk6SYsC3.enumerated() {
      let lastMessage = mgsPa2genkxGj8zwq.last(where: { $0.mCv4Ne9Hr == conv.id })
      cwlsUdrAKgmk6SYsC3[index].cLm6Er8Cv = lastMessage?.id
    }

    let chasPgalKbDKfTOWoU: [DancozZ6LtwXHtlqPu] = MelystoreWpvugHy89HDWLR.defchab6gAGvtllPIir7()
    let chvdosNMV7JNAyjOXGST: [Chalvdngt3SE6MdwaZYu] =
      MelystoreWpvugHy89HDWLR.defcvde4Rl8crQZaI2PM()

    return AdatJc1Zwhy2Od8kjZ(
      lAe1qkyDtNkCsbusers,
      chasPgalKbDKfTOWoU,
      chvdosNMV7JNAyjOXGST,
      cmposh7bTdv5CsEubxZ,
      cocmsWareYcGP10Xiqt,
      cwlsUdrAKgmk6SYsC3,
      mgsPa2genkxGj8zwq,
      rYoDbpQbamNiKVcuid,
      nil,
      false
    )
  }
}
