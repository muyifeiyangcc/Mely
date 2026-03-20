import Combine
import Foundation

private enum AppDataStorage {
  private static let key = "Mely_AppData"

  static func load() -> AppData? {
    guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
    do {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      return try decoder.decode(AppData.self, from: data)
    } catch {
      print("Failed to decode AppData: \(error)")
      return nil
    }
  }

  static func save(_ appData: AppData) {
    do {
      let encoder = JSONEncoder()
      encoder.dateEncodingStrategy = .iso8601
      let data = try encoder.encode(appData)
      UserDefaults.standard.set(data, forKey: key)
    } catch {
      print("Failed to encode AppData: \(error)")
    }
  }
}

final class AppDataStore: ObservableObject {
  @Published private(set) var data: AppData
  /// 拉黑成功后展示 2 秒 toast
  @Published var showBlockSuccessToast: Bool = false

  init() {
    if let existing = AppDataStorage.load() {
      data = existing
      if data.adCh2Hx7Wn.isEmpty {
        data.adCh2Hx7Wn = Self.defaultChallenges()
        save()
      }
      if data.adCv5Jt8Lp.isEmpty && !data.adCh2Hx7Wn.isEmpty {
        data.adCv5Jt8Lp = Self.defaultVideosForChallenges(data.adCh2Hx7Wn)
        save()
      }
    } else {
      let sample = AppData.makeSample()
      data = sample
      AppDataStorage.save(sample)
    }
  }

  /// 本地持久化的默认挑战数据（首次安装或无挑战时使用）
  fileprivate static func defaultChallenges() -> [DanceChallenge] {
    return [
      DanceChallenge(
        "id1",
        "u2",
        "Home Beat Dance Workout",
        "q9V8ph41lXTH_tiao1",
        false,
        "Medium",
        12_500,
        "work on your muscles, it's important 🏋‍♀️"
      ),
      DanceChallenge(
        "id2",
        "u4",
        "uick Slim Dance Challenge",
        "q9V8ph41lXTH_tiao2",
        false,
        "Medium",
        12_500,
        "Let’s bring this dance back for 2026"
      ),
      // DanceChallenge(
      //   id: "id3",
      //   title: "uick Slim Dance Challenge",
      //   imageName: "I7SrplfHHwLH_feng3",
      //   isJoined: true,
      //   difficulty: "Easy",
      //   participantsCount: 8_900,
      //   description: "LET’S DANCE MONDAY Dance Mom’s Let’s Sing!! Respect "
      // ),
      // DanceChallenge(
      //   id: "id4",
      //   title: "uick Slim Dance Challenge",
      //   imageName: "I7SrplfHHwLH_feng4",
      //   isJoined: false,
      //   difficulty: "Hard",
      //   participantsCount: 15_300,
      //   description: "Your friend who hates the gym needs this. 🦋✨"
      // ),
    ]
  }

  /// 本地持久化的默认挑战视频数据（每个挑战 6 个视频，前 3 解锁，后 3 锁定 300 钻石）
  fileprivate static func defaultChallengeVideos() -> [ChallengeVideo] {
    defaultVideosForChallenges(defaultChallenges())
  }

  /// 为指定挑战列表创建默认视频（用于首次安装或迁移）
  fileprivate static func defaultVideosForChallenges(_ challenges: [DanceChallenge])
    -> [ChallengeVideo]
  {
    challenges.flatMap { _ in defaultVideosForChallenge() }
  }

  private func save() {
    AppDataStorage.save(data)
  }

  var currentUser: UserModel? {
    guard let id = data.adCu1Zp6Hm else { return nil }
    return data.adUr9Mz3Qc.first(where: { $0.id == id })
  }

  /// 当前用户的拉黑 id 列表，用于展示层过滤
  private var blockUids: Set<String> {
    Set(currentUser?.uBh9Ca1Zs ?? [])
  }

  /// 社区帖子（排除被拉黑用户）
  var filteredCommunityPosts: [CommunityPostModel] {
    data.adPs6Gk1Rv.filter { !blockUids.contains($0.pUp4Mx7Cs) }
  }

  /// 舞蹈挑战（排除被拉黑用户创建）
  var filteredChallenges: [DanceChallenge] {
    data.adCh2Hx7Wn.filter { !blockUids.contains($0.dUr4Mp7Ks) }
  }

  /// 挑战视频（排除被拉黑用户发布）
  var filteredChallengeVideos: [ChallengeVideo] {
    data.adCv5Jt8Lp.filter { !blockUids.contains($0.vUv6Fr1Qd) }
  }

  /// 社区评论（排除被拉黑用户）
  func filteredCommunityComments(postId: String) -> [CommunityCommentModel] {
    data.adCm3Bc9Nx
      .filter { $0.cmPo4Ne7Lk == postId && !blockUids.contains($0.cmUc6Fr1Qx) }
  }

  /// 会话列表（仅当前登录用户参与的会话，并排除与被拉黑用户的会话）
  var filteredConversations: [ConversationModel] {
    guard let currentId = data.adCu1Zp6Hm else { return [] }
    return data.adCo7Df2Qs.filter { conv in
      conv.cPu3Ks1Zx.contains(currentId)
        && !conv.cPu3Ks1Zx.contains { blockUids.contains($0) }
    }
  }

  /// 获取或创建与指定用户的私聊会话，返回 conversationId；若无则新建后返回
  func getOrCreateConversation(with otherUserId: String) -> String? {
    guard let currentId = data.adCu1Zp6Hm,
      currentId != otherUserId,
      data.adUr9Mz3Qc.contains(where: { $0.id == otherUserId })
    else { return nil }
    let ids = Set([currentId, otherUserId])
    if let existing = data.adCo7Df2Qs.first(where: {
      Set($0.cPu3Ks1Zx) == ids
    }) {
      return existing.id
    }
    let newConv = ConversationModel(
      UUID().uuidString,
      [currentId, otherUserId]
    )
    data.adCo7Df2Qs.insert(newConv, at: 0)
    save()
    return newConv.id
  }

  // MARK: - Auth Error
  enum AuthError: LocalizedError {
    case userNotFound
    case emailAlreadyExists
    case wrongPassword

    var errorDescription: String? {
      switch self {
      case .userNotFound:
        return "账号不存在，请先注册。"
      case .emailAlreadyExists:
        return "该邮箱已注册，请直接登录。"
      case .wrongPassword:
        return "密码错误，请重试。"
      }
    }
  }

  // MARK: - Auth & EULA

  /// 首次进入时同意 EULA
  func markEULAAccepted() {
    guard !data.adHa2Yt5Jb else { return }
    data.adHa2Yt5Jb = true
    save()
  }

  /// 快速登录：“I'm new” 按钮逻辑
  func quickLogin() {
    if let quickId = data.adQk4Nr9Vx,
      data.adUr9Mz3Qc.contains(where: { $0.id == quickId })
    {
      data.adCu1Zp6Hm = quickId
      save()
      return
    }

    let timestampFull = String(Int(Date().timeIntervalSince1970))
    let lastSixDigits = timestampFull.suffix(4)
    let newUser = UserModel(
      UUID().uuidString,
      "Quick\(lastSixDigits)",
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

    data.adUr9Mz3Qc.append(newUser)
    data.adCu1Zp6Hm = newUser.id
    data.adQk4Nr9Vx = newUser.id
    save()
  }

  /// 使用邮箱密码登录
  func login(email: String, password: String) throws {
    guard let user = data.adUr9Mz3Qc.first(where: { $0.uEs1Fw9Hb == email }) else {
      throw AuthError.userNotFound
    }
    guard user.uPk6Tr3Yv == password else {
      throw AuthError.wrongPassword
    }
    data.adCu1Zp6Hm = user.id
    save()
  }

  /// 使用邮箱注册新账号
  func signup(email: String, password: String) throws {
    if data.adUr9Mz3Qc.contains(where: { $0.uEs1Fw9Hb == email }) {
      throw AuthError.emailAlreadyExists
    }

    let name = email.split(separator: "@").first.map(String.init) ?? email
    let newUser = UserModel(
      UUID().uuidString,
      name,
      "mely_defava",
      email,
      password,
      false,
      0,
      [],
      [],
      [],
      [],
      []
    )

    data.adUr9Mz3Qc.append(newUser)
    data.adCu1Zp6Hm = newUser.id
    save()
  }

  /// 忘记密码：重置已有账号的密码
  func resetPassword(email: String, newPassword: String) throws {
    guard let index = data.adUr9Mz3Qc.firstIndex(where: { $0.uEs1Fw9Hb == email }) else {
      throw AuthError.userNotFound
    }

    data.adUr9Mz3Qc[index].uPk6Tr3Yv = newPassword
    save()
  }

  /// 退出当前登录用户，但保留快速登录用户记录
  func logout() {
    guard data.adCu1Zp6Hm != nil else { return }
    data.adCu1Zp6Hm = nil
    save()
  }

  /// 删除当前登录用户及其全部关联数据（视频、帖子、挑战、评论、消息、点赞、关注等），清空后回到登录选择页
  func deleteCurrentUser() {
    guard let currentId = data.adCu1Zp6Hm else { return }
    guard let userIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId }) else { return }

    let currentUser = data.adUr9Mz3Qc[userIndex]

    // 1. 更新点赞数：该用户点赞过的帖子/视频需减少 likeCount
    for contentId in currentUser.uLc5Vw2Kd {
      decrementLikeCount(contentId: contentId)
    }

    // 2. 该用户的帖子 ID（用于删除其帖子下的评论、以及帖子图片）
    let userPostIds = Set(data.adPs6Gk1Rv.filter { $0.pUp4Mx7Cs == currentId }.map(\.id))

    // 3. 删除该用户帖子下的评论，并更新其他帖子被该用户评论的 commentCount
    let commentsToRemove = data.adCm3Bc9Nx.filter {
      $0.cmUc6Fr1Qx == currentId || userPostIds.contains($0.cmPo4Ne7Lk)
    }
    for comment in commentsToRemove where !userPostIds.contains(comment.cmPo4Ne7Lk) {
      if let idx = data.adPs6Gk1Rv.firstIndex(where: { $0.id == comment.cmPo4Ne7Lk }) {
        data.adPs6Gk1Rv[idx].pCc8Jt4Vm = max(
          0,
          data.adPs6Gk1Rv[idx].pCc8Jt4Vm - 1
        )
      }
    }
    data.adCm3Bc9Nx.removeAll { $0.cmUc6Fr1Qx == currentId || userPostIds.contains($0.cmPo4Ne7Lk) }

    // 4. 该用户创建的挑战 ID（用于删除挑战及其视频）
    let userChallengeIds = Set(data.adCh2Hx7Wn.filter { $0.dUr4Mp7Ks == currentId }.map(\.id))

    // 5. 收集需删除的本地文件路径
    var filesToDelete: [String] = []

    for post in data.adPs6Gk1Rv where post.pUp4Mx7Cs == currentId {
      if post.pIn6Fw1Zd.contains("/") { filesToDelete.append(post.pIn6Fw1Zd) }
    }

    for challenge in data.adCh2Hx7Wn where challenge.dUr4Mp7Ks == currentId {
      if let name = challenge.dIn1Xy8Ck, name.contains("/") { filesToDelete.append(name) }
    }

    let userVideoIds = Set(
      data.adCv5Jt8Lp
        .filter { $0.vUv6Fr1Qd == currentId || userChallengeIds.contains($0.vCh4Ne7Lp) }
        .map(\.id)
    )
    for video in data.adCv5Jt8Lp where userVideoIds.contains(video.id) {
      if let name = video.vVn7Px5Lm, name.contains("/") { filesToDelete.append(name) }
      if let thumb = video.vTn3Hw8Zc, thumb.contains("/") { filesToDelete.append(thumb) }
    }

    for msg in data.adMs8Lw4Ty where msg.mUd6Ts3Kw == currentId {
      if let p = msg.mIm5Wr7Dz, p.contains("/") { filesToDelete.append(p) }
      if let p = msg.mAu3Nk6Ps, p.contains("/") { filesToDelete.append(p) }
    }

    if currentUser.uQd8Nv5tK.contains("/") {
      filesToDelete.append(currentUser.uQd8Nv5tK)
    }

    for path in filesToDelete {
      ImageStorageHelper.deleteFileIfExists(relativePath: path)
    }

    // 6. 删除数据
    data.adPs6Gk1Rv.removeAll { $0.pUp4Mx7Cs == currentId }
    data.adCh2Hx7Wn.removeAll { $0.dUr4Mp7Ks == currentId }
    data.adCv5Jt8Lp.removeAll { userVideoIds.contains($0.id) }
    data.adMs8Lw4Ty.removeAll { $0.mUd6Ts3Kw == currentId }
    data.adCo7Df2Qs.removeAll { $0.cPu3Ks1Zx.contains(currentId) }
    data.adUr9Mz3Qc.removeAll { $0.id == currentId }

    // 7. 其他用户中移除对该用户的关注/粉丝/拉黑引用
    for i in data.adUr9Mz3Qc.indices {
      data.adUr9Mz3Qc[i].uFm7Xr8Lp.removeAll { $0 == currentId }
      data.adUr9Mz3Qc[i].uFn3Te6Qb.removeAll { $0 == currentId }
      data.adUr9Mz3Qc[i].uBh9Ca1Zs.removeAll { $0 == currentId }
    }

    if data.adQk4Nr9Vx == currentId {
      data.adQk4Nr9Vx = nil
    }
    data.adCu1Zp6Hm = nil
    objectWillChange.send()
    save()
  }

  /// 更新当前用户的昵称和头像
  func updateCurrentUser(name: String? = nil, avatarSymbol: String? = nil) {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    if let name = name, !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      data.adUr9Mz3Qc[index].uZp7Lm2cR = name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    if let avatarSymbol = avatarSymbol {
      data.adUr9Mz3Qc[index].uQd8Nv5tK = avatarSymbol
    }
    save()
  }

  /// 为当前用户增加钻石
  func addDiamonds(_ amount: Int) {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    data.adUr9Mz3Qc[index].uDg2Jy5Wx += amount
    save()
  }

  /// 扣除当前用户钻石，余额不足时返回 false
  func deductDiamonds(_ amount: Int) -> Bool {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return false }
    guard data.adUr9Mz3Qc[index].uDg2Jy5Wx >= amount else { return false }
    data.adUr9Mz3Qc[index].uDg2Jy5Wx -= amount
    save()
    return true
  }

  /// 判断视频对当前用户而言是否仍为锁定状态（需付费解锁且用户尚未解锁）
  func isVideoEffectivelyLocked(_ video: ChallengeVideo) -> Bool {
    guard video.vIl8Ks4Bw else { return false }
    guard let currentId = data.adCu1Zp6Hm,
      let user = data.adUr9Mz3Qc.first(where: { $0.id == currentId })
    else { return true }
    return !user.uUv8Hp4Nj.contains(video.id)
  }

  /// 解锁指定视频：余额足够则扣除钻石并标记解锁，返回 true；不足返回 false
  func unlockVideo(videoId: String) -> Bool {
    guard let video = data.adCv5Jt8Lp.first(where: { $0.id == videoId }),
      video.vIl8Ks4Bw,
      let cost = video.vUd5Rp2Xy, cost > 0
    else { return false }
    guard let currentId = data.adCu1Zp6Hm,
      let userIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return false }
    guard !data.adUr9Mz3Qc[userIndex].uUv8Hp4Nj.contains(videoId) else { return true }
    guard deductDiamonds(cost) else { return false }
    objectWillChange.send()
    data.adUr9Mz3Qc[userIndex].uUv8Hp4Nj.append(videoId)
    save()
    return true
  }

  /// 将指定用户 id 加入当前登录用户的拉黑列表（展示层按 blockUids 过滤，不删除数据）
  func blockUser(uid: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    guard !data.adUr9Mz3Qc[index].uBh9Ca1Zs.contains(uid) else { return }
    objectWillChange.send()
    data.adUr9Mz3Qc[index].uBh9Ca1Zs.append(uid)
    save()
    showBlockSuccessToast = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      self?.showBlockSuccessToast = false
    }
  }

  /// 将指定用户从当前登录用户的拉黑列表中移除
  func unblockUser(uid: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    objectWillChange.send()
    data.adUr9Mz3Qc[index].uBh9Ca1Zs.removeAll { $0 == uid }
    save()
  }

  /// 当前用户关注指定用户
  func followUser(uid: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let currentIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId }),
      let targetIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == uid }),
      currentId != uid
    else { return }
    if !data.adUr9Mz3Qc[currentIndex].uFn3Te6Qb.contains(uid) {
      data.adUr9Mz3Qc[currentIndex].uFn3Te6Qb.append(uid)
      data.adUr9Mz3Qc[targetIndex].uFm7Xr8Lp.append(currentId)
      save()
    }
  }

  /// 当前用户取关指定用户
  func unfollowUser(uid: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let currentIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId }),
      let targetIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == uid })
    else { return }
    data.adUr9Mz3Qc[currentIndex].uFn3Te6Qb.removeAll { $0 == uid }
    data.adUr9Mz3Qc[targetIndex].uFm7Xr8Lp.removeAll { $0 == currentId }
    save()
  }

  /// 当前登录用户是否已关注指定用户
  func isFollowing(_ uid: String) -> Bool {
    guard let currentId = data.adCu1Zp6Hm,
      let currentUser = data.adUr9Mz3Qc.first(where: { $0.id == currentId })
    else { return false }
    return currentUser.uFn3Te6Qb.contains(uid)
  }

  /// 当前登录用户是否已点赞指定帖子/视频
  func isLiked(_ contentId: String) -> Bool {
    guard let currentId = data.adCu1Zp6Hm,
      let currentUser = data.adUr9Mz3Qc.first(where: { $0.id == currentId })
    else { return false }
    return currentUser.uLc5Vw2Kd.contains(contentId)
  }

  /// 点赞指定帖子或视频
  func likeContent(_ contentId: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let userIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    guard !data.adUr9Mz3Qc[userIndex].uLc5Vw2Kd.contains(contentId) else { return }

    data.adUr9Mz3Qc[userIndex].uLc5Vw2Kd.append(contentId)
    incrementLikeCount(contentId: contentId)
    save()
  }

  /// 取消点赞指定帖子或视频
  func unlikeContent(_ contentId: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let userIndex = data.adUr9Mz3Qc.firstIndex(where: { $0.id == currentId })
    else { return }
    guard data.adUr9Mz3Qc[userIndex].uLc5Vw2Kd.contains(contentId) else { return }

    data.adUr9Mz3Qc[userIndex].uLc5Vw2Kd.removeAll { $0 == contentId }
    decrementLikeCount(contentId: contentId)
    save()
  }

  // MARK: - 可点赞内容统一解析（帖子/视频单一路径）

  private enum LikableContent {
    case post(index: Int)
    case video(index: Int)
  }

  private func resolveLikableContent(_ contentId: String) -> LikableContent? {
    if let idx = data.adPs6Gk1Rv.firstIndex(where: { $0.id == contentId }) {
      return .post(index: idx)
    }
    if let idx = data.adCv5Jt8Lp.firstIndex(where: { $0.id == contentId }) {
      return .video(index: idx)
    }
    return nil
  }

  private func incrementLikeCount(contentId: String) {
    guard let content = resolveLikableContent(contentId) else { return }
    switch content {
    case .post(let index):
      data.adPs6Gk1Rv[index].pLc3Gy9Wk += 1
    case .video(let index):
      data.adCv5Jt8Lp[index].vLc1Gy9Ht += 1
    }
  }

  private func decrementLikeCount(contentId: String) {
    guard let content = resolveLikableContent(contentId) else { return }
    switch content {
    case .post(let index):
      data.adPs6Gk1Rv[index].pLc3Gy9Wk = max(0, data.adPs6Gk1Rv[index].pLc3Gy9Wk - 1)
    case .video(let index):
      data.adCv5Jt8Lp[index].vLc1Gy9Ht = max(0, data.adCv5Jt8Lp[index].vLc1Gy9Ht - 1)
    }
  }

  /// 添加社区图片帖子
  func addCommunityPost(imageName: String, tags: [String], description: String = "") {
    guard let currentUserId = data.adCu1Zp6Hm else { return }
    let newPost = CommunityPostModel(
      UUID().uuidString,
      currentUserId,
      imageName,
      description,
      tags,
      0,
      0,
      Date()
    )
    data.adPs6Gk1Rv.insert(newPost, at: 0)
    save()
  }

  /// 为指定帖子添加一条评论（支持 emoji）
  func addCommunityComment(text: String, to postId: String) {
    guard let currentUserId = data.adCu1Zp6Hm,
      !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    else { return }

    let comment = CommunityCommentModel(
      UUID().uuidString,
      postId,
      currentUserId,
      text,
      Date()
    )

    data.adCm3Bc9Nx.append(comment)

    if let index = data.adPs6Gk1Rv.firstIndex(where: { $0.id == postId }) {
      data.adPs6Gk1Rv[index].pCc8Jt4Vm += 1
    }

    save()
  }

  // MARK: - Challenges
  func addChallenge(title: String, rule: String, coverImageName: String?) {
    let creatorId = data.adCu1Zp6Hm ?? "u1"
    let challenge = DanceChallenge(
      UUID().uuidString,
      creatorId,
      title,
      coverImageName,
      false,
      "Medium",
      0,
      rule
    )
    data.adCh2Hx7Wn.insert(challenge, at: 0)
    let defaultVideos = Self.defaultVideosForChallenge()
    data.adCv5Jt8Lp.insert(contentsOf: defaultVideos, at: 0)
    save()
  }

  /// 添加挑战参与视频（用户上传）
  func addChallengeVideo(
    challengeId: String,
    videoRelativePath: String,
    thumbnailRelativePath: String,
    unlockCostDiamonds: Int?
  ) {
    guard let currentUserId = data.adCu1Zp6Hm else { return }
    let isLocked = (unlockCostDiamonds ?? 0) > 0
    let video = ChallengeVideo(
      UUID().uuidString,
      challengeId,
      currentUserId,
      thumbnailRelativePath,
      videoRelativePath,
      0,
      isLocked,
      isLocked ? unlockCostDiamonds : nil
    )
    data.adCv5Jt8Lp.insert(video, at: 0)
    save()
  }

  /// 为指定挑战创建默认视频（前 3 解锁，后 3 锁定 300 钻石）
  fileprivate static func defaultVideosForChallenge() -> [ChallengeVideo] {
    return [
      ChallengeVideo(
        "cv1", "id1", "u2",
        "I7SrplfHHwLH_feng1", "SKTyyB8jjAwN_pind1", 339,
        false,
        nil),
      ChallengeVideo(
        "cv2", "id1", "u3",
        "I7SrplfHHwLH_feng2", "SKTyyB8jjAwN_pind2", 124,
        true,
        300),
      ChallengeVideo(
        "cv3", "id2", "u4",
        "I7SrplfHHwLH_feng3", "SKTyyB8jjAwN_pind3", 56,
        false,
        nil),
      ChallengeVideo(
        "cv4", "id2", "u5",
        "I7SrplfHHwLH_feng4", "SKTyyB8jjAwN_pind4", 770,
        true,
        300),
    ]
  }

  /// 清除当前用户对指定会话的未读数（进入聊天详情时调用）
  func clearUnreadCount(for conversationId: String) {
    guard let currentId = data.adCu1Zp6Hm,
      let index = data.adCo7Df2Qs.firstIndex(where: { $0.id == conversationId })
    else { return }
    data.adCo7Df2Qs[index].cUc2Yp5Hd[currentId] = 0
    save()
  }

  func addMessage(
    text: String,
    type: MessageModel.MessageType = .text,
    imagePath: String? = nil,
    audioPath: String? = nil,
    audioDurationSeconds: Int? = nil,
    to conversationId: String
  ) {
    guard let currentUserId = data.adCu1Zp6Hm else { return }

    let message = MessageModel(
      UUID().uuidString,
      conversationId,
      currentUserId,
      text,
      type,
      imagePath,
      audioPath,
      audioDurationSeconds,
      Date()
    )

    data.adMs8Lw4Ty.append(message)

    if let index = data.adCo7Df2Qs.firstIndex(where: { $0.id == conversationId }) {
      data.adCo7Df2Qs[index].cLm6Er8Cv = message.id
      // 发送者不增加未读，仅给其他参与者增加未读
      for uid in data.adCo7Df2Qs[index].cPu3Ks1Zx where uid != currentUserId {
        let cur = data.adCo7Df2Qs[index].cUc2Yp5Hd[uid] ?? 0
        data.adCo7Df2Qs[index].cUc2Yp5Hd[uid] = cur + 1
      }
    }

    save()
  }
}

// MARK: - Sample Data

extension AppData {
  static func makeSample() -> AppData {
    let users: [UserModel] = [
      .init(
        "u1",
        "a4ll1e",
        "Ja1iuGwTBJ8T_ava1",
        "mely@gmail.com",
        "123456"
      ),
      .init(
        "u2",
        "ouslife0",
        "Ja1iuGwTBJ8T_ava2"
      ),
      .init("u3", "wendydavid", "Ja1iuGwTBJ8T_ava3"),
      .init("u4", "mcke", "Ja1iuGwTBJ8T_ava4"),
      .init("u5", "Karolina", "Ja1iuGwTBJ8T_ava5"),
      .init("u6", "Amily", "Ja1iuGwTBJ8T_ava6"),
      .init("u7", "Iago", "Ja1iuGwTBJ8T_ava7"),
      .init("u8", "Pulua", "Ja1iuGwTBJ8T_ava8"),
    ]

    // 首次启动：未登录、未同意 EULA
    let currentUserId: String? = nil

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let aug1 = formatter.date(from: "2025-08-01") ?? Date()
    let mar4 = formatter.date(from: "2025-03-04") ?? Date()
    let communityPosts: [CommunityPostModel] = [
      .init(
        "cp1", "u5", "jbTdcdQfTk5W_day11", "Leg day 🦵🏋️‍♀️",
        ["Daily"], 0, 1, aug1),
      .init(
        "cp2", "u6", "jbTdcdQfTk5W_day21",
        "Body transformation from fat loss to muscle gain in one year",
        ["Leisure"], 0, 1, aug1),
      .init(
        "cp3", "u7", "jbTdcdQfTk5W_day31",
        "What I did to get a V-Shape",
        ["Daily"], 12, 1, Date()),
      .init(
        "cp4", "u8", "jbTdcdQfTk5W_day41",
        "Late-night workout is my own medicine",
        ["other"], 8, 1, Date()),
    ]

    let communityComments: [CommunityCommentModel] = [
      .init(
        "cc1", "cp1", "u3",
        "The scenery along the way seems very beautiful.", mar4),
      .init("cc2", "cp2", "u4", "So beautiful ✨", mar4),
      .init(
        "cc3", "cp3", "u2", "Let's share our progress!", Date()
      ),
      .init(
        "cc4", "cp4", "u5", "You're in great shape today. 💪",
        Date()),
    ]

    let conversations: [ConversationModel] = [
      .init(
        "c1",
        ["u1", "u2"],
        nil,
        ["u1": 1]
      ),
      .init(
        "c2",
        ["u1", "u3"],
        nil,
        ["u1": 1]
      ),
    ]

    let messages: [MessageModel] = [
      .init(
        "m1",
        "c1",
        "u2",
        "What new gadgets are you working on lately?",
        .text,
        nil,
        nil,
        nil,
        Date()
      ),
      .init(
        "m2",
        "c2",
        "u3",
        "The content you shared is very interesting!",
        .text,
        nil,
        nil,
        nil,
        Date()
      ),
    ]

    var conversationsWithLast = conversations
    for (index, conv) in conversationsWithLast.enumerated() {
      let lastMessage = messages.last(where: { $0.mCv4Ne9Hr == conv.id })
      conversationsWithLast[index].cLm6Er8Cv = lastMessage?.id
    }

    let challenges: [DanceChallenge] = AppDataStore.defaultChallenges()
    let challengeVideos: [ChallengeVideo] = AppDataStore.defaultChallengeVideos()

    return AppData(
      users,
      challenges,
      challengeVideos,
      communityPosts,
      communityComments,
      conversationsWithLast,
      messages,
      currentUserId,
      nil,
      false
    )
  }
}
