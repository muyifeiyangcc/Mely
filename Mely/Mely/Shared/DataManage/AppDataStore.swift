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
      if data.challenges.isEmpty {
        data.challenges = Self.defaultChallenges()
        save()
      }
      if data.challengeVideos.isEmpty && !data.challenges.isEmpty {
        data.challengeVideos = Self.defaultVideosForChallenges(data.challenges)
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
        id: "id1",
        userId: "u2",
        title: "Home Beat Dance Workout",
        imageName: "q9V8ph41lXTH_tiao1",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 12_500,
        description: "work on your muscles, it's important 🏋‍♀️"
      ),
      DanceChallenge(
        id: "id2",
        userId: "u4",
        title: "uick Slim Dance Challenge",
        imageName: "q9V8ph41lXTH_tiao2",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 12_500,
        description: "Let’s bring this dance back for 2026"
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
    guard let id = data.currentUserId else { return nil }
    return data.users.first(where: { $0.id == id })
  }

  /// 当前用户的拉黑 id 列表，用于展示层过滤
  private var blockUids: Set<String> {
    Set(currentUser?.blockUids ?? [])
  }

  /// 社区帖子（排除被拉黑用户）
  var filteredCommunityPosts: [CommunityPostModel] {
    data.communityPosts.filter { !blockUids.contains($0.userId) }
  }

  /// 舞蹈挑战（排除被拉黑用户创建）
  var filteredChallenges: [DanceChallenge] {
    data.challenges.filter { !blockUids.contains($0.userId) }
  }

  /// 挑战视频（排除被拉黑用户发布）
  var filteredChallengeVideos: [ChallengeVideo] {
    data.challengeVideos.filter { !blockUids.contains($0.userId) }
  }

  /// 社区评论（排除被拉黑用户）
  func filteredCommunityComments(postId: String) -> [CommunityCommentModel] {
    data.communityComments
      .filter { $0.postId == postId && !blockUids.contains($0.userId) }
  }

  /// 会话列表（仅当前登录用户参与的会话，并排除与被拉黑用户的会话）
  var filteredConversations: [ConversationModel] {
    guard let currentId = data.currentUserId else { return [] }
    return data.conversations.filter { conv in
      conv.participantUserIds.contains(currentId)
        && !conv.participantUserIds.contains { blockUids.contains($0) }
    }
  }

  /// 获取或创建与指定用户的私聊会话，返回 conversationId；若无则新建后返回
  func getOrCreateConversation(with otherUserId: String) -> String? {
    guard let currentId = data.currentUserId,
      currentId != otherUserId,
      data.users.contains(where: { $0.id == otherUserId })
    else { return nil }
    let ids = Set([currentId, otherUserId])
    if let existing = data.conversations.first(where: {
      Set($0.participantUserIds) == ids
    }) {
      return existing.id
    }
    let newConv = ConversationModel(
      id: UUID().uuidString,
      participantUserIds: [currentId, otherUserId]
    )
    data.conversations.insert(newConv, at: 0)
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
    guard !data.hasAcceptedEULA else { return }
    data.hasAcceptedEULA = true
    save()
  }

  /// 快速登录：“I'm new” 按钮逻辑
  func quickLogin() {
    if let quickId = data.quickLoginUserId,
      data.users.contains(where: { $0.id == quickId })
    {
      data.currentUserId = quickId
      save()
      return
    }

    let timestampFull = String(Int(Date().timeIntervalSince1970))
    let lastSixDigits = timestampFull.suffix(4)
    let newUser = UserModel(
      id: UUID().uuidString,
      name: "Quick\(lastSixDigits)",
      avatarSymbol: "mely_defava",
      email: nil,
      password: nil,
      isQuickUser: true,
      diamonds: 0,
    )

    data.users.append(newUser)
    data.currentUserId = newUser.id
    data.quickLoginUserId = newUser.id
    save()
  }

  /// 使用邮箱密码登录
  func login(email: String, password: String) throws {
    guard let user = data.users.first(where: { $0.email == email }) else {
      throw AuthError.userNotFound
    }
    guard user.password == password else {
      throw AuthError.wrongPassword
    }
    data.currentUserId = user.id
    save()
  }

  /// 使用邮箱注册新账号
  func signup(email: String, password: String) throws {
    if data.users.contains(where: { $0.email == email }) {
      throw AuthError.emailAlreadyExists
    }

    let name = email.split(separator: "@").first.map(String.init) ?? email
    let newUser = UserModel(
      id: UUID().uuidString,
      name: name,
      avatarSymbol: "mely_defava",
      email: email,
      password: password,
      isQuickUser: false
    )

    data.users.append(newUser)
    data.currentUserId = newUser.id
    save()
  }

  /// 忘记密码：重置已有账号的密码
  func resetPassword(email: String, newPassword: String) throws {
    guard let index = data.users.firstIndex(where: { $0.email == email }) else {
      throw AuthError.userNotFound
    }

    data.users[index].password = newPassword
    save()
  }

  /// 退出当前登录用户，但保留快速登录用户记录
  func logout() {
    guard data.currentUserId != nil else { return }
    data.currentUserId = nil
    save()
  }

  /// 删除当前登录用户及其全部关联数据（视频、帖子、挑战、评论、消息、点赞、关注等），清空后回到登录选择页
  func deleteCurrentUser() {
    guard let currentId = data.currentUserId else { return }
    guard let userIndex = data.users.firstIndex(where: { $0.id == currentId }) else { return }

    let currentUser = data.users[userIndex]

    // 1. 更新点赞数：该用户点赞过的帖子/视频需减少 likeCount
    for contentId in currentUser.likeIds {
      if let idx = data.communityPosts.firstIndex(where: { $0.id == contentId }) {
        data.communityPosts[idx].likeCount = max(0, data.communityPosts[idx].likeCount - 1)
      } else if let idx = data.challengeVideos.firstIndex(where: { $0.id == contentId }) {
        data.challengeVideos[idx].likeCount = max(0, data.challengeVideos[idx].likeCount - 1)
      }
    }

    // 2. 该用户的帖子 ID（用于删除其帖子下的评论、以及帖子图片）
    let userPostIds = Set(data.communityPosts.filter { $0.userId == currentId }.map(\.id))

    // 3. 删除该用户帖子下的评论，并更新其他帖子被该用户评论的 commentCount
    let commentsToRemove = data.communityComments.filter {
      $0.userId == currentId || userPostIds.contains($0.postId)
    }
    for comment in commentsToRemove where !userPostIds.contains(comment.postId) {
      if let idx = data.communityPosts.firstIndex(where: { $0.id == comment.postId }) {
        data.communityPosts[idx].commentCount = max(
          0,
          data.communityPosts[idx].commentCount - 1
        )
      }
    }
    data.communityComments.removeAll { $0.userId == currentId || userPostIds.contains($0.postId) }

    // 4. 该用户创建的挑战 ID（用于删除挑战及其视频）
    let userChallengeIds = Set(data.challenges.filter { $0.userId == currentId }.map(\.id))

    // 5. 收集需删除的本地文件路径
    var filesToDelete: [String] = []

    for post in data.communityPosts where post.userId == currentId {
      if post.imageName.contains("/") { filesToDelete.append(post.imageName) }
    }

    for challenge in data.challenges where challenge.userId == currentId {
      if let name = challenge.imageName, name.contains("/") { filesToDelete.append(name) }
    }

    let userVideoIds = Set(
      data.challengeVideos
        .filter { $0.userId == currentId || userChallengeIds.contains($0.challengeId) }
        .map(\.id)
    )
    for video in data.challengeVideos where userVideoIds.contains(video.id) {
      if let name = video.videoName, name.contains("/") { filesToDelete.append(name) }
      if let thumb = video.thumbnailName, thumb.contains("/") { filesToDelete.append(thumb) }
    }

    for msg in data.messages where msg.userId == currentId {
      if let p = msg.imagePath, p.contains("/") { filesToDelete.append(p) }
      if let p = msg.audioPath, p.contains("/") { filesToDelete.append(p) }
    }

    if currentUser.avatarSymbol.contains("/") {
      filesToDelete.append(currentUser.avatarSymbol)
    }

    for path in filesToDelete {
      ImageStorageHelper.deleteFileIfExists(relativePath: path)
    }

    // 6. 删除数据
    data.communityPosts.removeAll { $0.userId == currentId }
    data.challenges.removeAll { $0.userId == currentId }
    data.challengeVideos.removeAll { userVideoIds.contains($0.id) }
    data.messages.removeAll { $0.userId == currentId }
    data.conversations.removeAll { $0.participantUserIds.contains(currentId) }
    data.users.removeAll { $0.id == currentId }

    // 7. 其他用户中移除对该用户的关注/粉丝/拉黑引用
    for i in data.users.indices {
      data.users[i].followIds.removeAll { $0 == currentId }
      data.users[i].followingIds.removeAll { $0 == currentId }
      data.users[i].blockUids.removeAll { $0 == currentId }
    }

    if data.quickLoginUserId == currentId {
      data.quickLoginUserId = nil
    }
    data.currentUserId = nil
    objectWillChange.send()
    save()
  }

  /// 更新当前用户的昵称和头像
  func updateCurrentUser(name: String? = nil, avatarSymbol: String? = nil) {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    if let name = name, !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
      data.users[index].name = name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    if let avatarSymbol = avatarSymbol {
      data.users[index].avatarSymbol = avatarSymbol
    }
    save()
  }

  /// 为当前用户增加钻石
  func addDiamonds(_ amount: Int) {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    data.users[index].diamonds += amount
    save()
  }

  /// 扣除当前用户钻石，余额不足时返回 false
  func deductDiamonds(_ amount: Int) -> Bool {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return false }
    guard data.users[index].diamonds >= amount else { return false }
    data.users[index].diamonds -= amount
    save()
    return true
  }

  /// 判断视频对当前用户而言是否仍为锁定状态（需付费解锁且用户尚未解锁）
  func isVideoEffectivelyLocked(_ video: ChallengeVideo) -> Bool {
    guard video.isLocked else { return false }
    guard let currentId = data.currentUserId,
      let user = data.users.first(where: { $0.id == currentId })
    else { return true }
    return !user.unlockedVideoIds.contains(video.id)
  }

  /// 解锁指定视频：余额足够则扣除钻石并标记解锁，返回 true；不足返回 false
  func unlockVideo(videoId: String) -> Bool {
    guard let video = data.challengeVideos.first(where: { $0.id == videoId }),
      video.isLocked,
      let cost = video.unlockCostDiamonds, cost > 0
    else { return false }
    guard let currentId = data.currentUserId,
      let userIndex = data.users.firstIndex(where: { $0.id == currentId })
    else { return false }
    guard !data.users[userIndex].unlockedVideoIds.contains(videoId) else { return true }
    guard deductDiamonds(cost) else { return false }
    objectWillChange.send()
    data.users[userIndex].unlockedVideoIds.append(videoId)
    save()
    return true
  }

  /// 将指定用户 id 加入当前登录用户的拉黑列表（展示层按 blockUids 过滤，不删除数据）
  func blockUser(uid: String) {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    guard !data.users[index].blockUids.contains(uid) else { return }
    objectWillChange.send()
    data.users[index].blockUids.append(uid)
    save()
    showBlockSuccessToast = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
      self?.showBlockSuccessToast = false
    }
  }

  /// 将指定用户从当前登录用户的拉黑列表中移除
  func unblockUser(uid: String) {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    objectWillChange.send()
    data.users[index].blockUids.removeAll { $0 == uid }
    save()
  }

  /// 当前用户关注指定用户
  func followUser(uid: String) {
    guard let currentId = data.currentUserId,
      let currentIndex = data.users.firstIndex(where: { $0.id == currentId }),
      let targetIndex = data.users.firstIndex(where: { $0.id == uid }),
      currentId != uid
    else { return }
    if !data.users[currentIndex].followingIds.contains(uid) {
      data.users[currentIndex].followingIds.append(uid)
      data.users[targetIndex].followIds.append(currentId)
      save()
    }
  }

  /// 当前用户取关指定用户
  func unfollowUser(uid: String) {
    guard let currentId = data.currentUserId,
      let currentIndex = data.users.firstIndex(where: { $0.id == currentId }),
      let targetIndex = data.users.firstIndex(where: { $0.id == uid })
    else { return }
    data.users[currentIndex].followingIds.removeAll { $0 == uid }
    data.users[targetIndex].followIds.removeAll { $0 == currentId }
    save()
  }

  /// 当前登录用户是否已关注指定用户
  func isFollowing(_ uid: String) -> Bool {
    guard let currentId = data.currentUserId,
      let currentUser = data.users.first(where: { $0.id == currentId })
    else { return false }
    return currentUser.followingIds.contains(uid)
  }

  /// 当前登录用户是否已点赞指定帖子/视频
  func isLiked(_ contentId: String) -> Bool {
    guard let currentId = data.currentUserId,
      let currentUser = data.users.first(where: { $0.id == currentId })
    else { return false }
    return currentUser.likeIds.contains(contentId)
  }

  /// 点赞指定帖子或视频
  func likeContent(_ contentId: String) {
    guard let currentId = data.currentUserId,
      let userIndex = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    guard !data.users[userIndex].likeIds.contains(contentId) else { return }

    data.users[userIndex].likeIds.append(contentId)

    if let postIndex = data.communityPosts.firstIndex(where: { $0.id == contentId }) {
      data.communityPosts[postIndex].likeCount += 1
    } else if let videoIndex = data.challengeVideos.firstIndex(where: { $0.id == contentId }) {
      data.challengeVideos[videoIndex].likeCount += 1
    }
    save()
  }

  /// 取消点赞指定帖子或视频
  func unlikeContent(_ contentId: String) {
    guard let currentId = data.currentUserId,
      let userIndex = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    guard data.users[userIndex].likeIds.contains(contentId) else { return }

    data.users[userIndex].likeIds.removeAll { $0 == contentId }

    if let postIndex = data.communityPosts.firstIndex(where: { $0.id == contentId }) {
      let newCount = max(0, data.communityPosts[postIndex].likeCount - 1)
      data.communityPosts[postIndex].likeCount = newCount
    } else if let videoIndex = data.challengeVideos.firstIndex(where: { $0.id == contentId }) {
      let newCount = max(0, data.challengeVideos[videoIndex].likeCount - 1)
      data.challengeVideos[videoIndex].likeCount = newCount
    }
    save()
  }

  /// 添加社区图片帖子
  func addCommunityPost(imageName: String, tags: [String], description: String = "") {
    guard let currentUserId = data.currentUserId else { return }
    let newPost = CommunityPostModel(
      id: UUID().uuidString,
      userId: currentUserId,
      imageName: imageName,
      description: description,
      tags: tags,
      likeCount: 0,
      commentCount: 0,
      createdAt: Date()
    )
    data.communityPosts.insert(newPost, at: 0)
    save()
  }

  /// 为指定帖子添加一条评论（支持 emoji）
  func addCommunityComment(text: String, to postId: String) {
    guard let currentUserId = data.currentUserId,
      !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    else { return }

    let comment = CommunityCommentModel(
      id: UUID().uuidString,
      postId: postId,
      userId: currentUserId,
      text: text,
      createdAt: Date()
    )

    data.communityComments.append(comment)

    if let index = data.communityPosts.firstIndex(where: { $0.id == postId }) {
      data.communityPosts[index].commentCount += 1
    }

    save()
  }

  // MARK: - Challenges
  func addChallenge(title: String, rule: String, coverImageName: String?) {
    let creatorId = data.currentUserId ?? "u1"
    let challenge = DanceChallenge(
      id: UUID().uuidString,
      userId: creatorId,
      title: title,
      imageName: coverImageName,
      isJoined: false,
      difficulty: "Medium",
      participantsCount: 0,
      description: rule
    )
    data.challenges.insert(challenge, at: 0)
    let defaultVideos = Self.defaultVideosForChallenge()
    data.challengeVideos.insert(contentsOf: defaultVideos, at: 0)
    save()
  }

  /// 添加挑战参与视频（用户上传）
  func addChallengeVideo(
    challengeId: String,
    videoRelativePath: String,
    thumbnailRelativePath: String,
    unlockCostDiamonds: Int?
  ) {
    guard let currentUserId = data.currentUserId else { return }
    let isLocked = (unlockCostDiamonds ?? 0) > 0
    let video = ChallengeVideo(
      id: UUID().uuidString,
      challengeId: challengeId,
      userId: currentUserId,
      thumbnailName: thumbnailRelativePath,
      videoName: videoRelativePath,
      likeCount: 0,
      isLocked: isLocked,
      unlockCostDiamonds: isLocked ? unlockCostDiamonds : nil
    )
    data.challengeVideos.insert(video, at: 0)
    save()
  }

  /// 为指定挑战创建默认视频（前 3 解锁，后 3 锁定 300 钻石）
  fileprivate static func defaultVideosForChallenge() -> [ChallengeVideo] {
    let videoName = "Videos/testVideo"  // Bundle 中的视频资源
    return [
      ChallengeVideo(
        id: "cv1", challengeId: "id1", userId: "u2",
        thumbnailName: "I7SrplfHHwLH_feng1", videoName: "SKTyyB8jjAwN_pind1", likeCount: 339,
        isLocked: false,
        unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "cv2", challengeId: "id1", userId: "u3",
        thumbnailName: "I7SrplfHHwLH_feng2", videoName: "SKTyyB8jjAwN_pind2", likeCount: 124,
        isLocked: true,
        unlockCostDiamonds: 300),
      ChallengeVideo(
        id: "cv3", challengeId: "id2", userId: "u4",
        thumbnailName: "I7SrplfHHwLH_feng3", videoName: "SKTyyB8jjAwN_pind3", likeCount: 56,
        isLocked: false,
        unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "cv4", challengeId: "id2", userId: "u5",
        thumbnailName: "I7SrplfHHwLH_feng4", videoName: "SKTyyB8jjAwN_pind4", likeCount: 770,
        isLocked: true,
        unlockCostDiamonds: 300),
    ]
  }

  /// 清除当前用户对指定会话的未读数（进入聊天详情时调用）
  func clearUnreadCount(for conversationId: String) {
    guard let currentId = data.currentUserId,
      let index = data.conversations.firstIndex(where: { $0.id == conversationId })
    else { return }
    data.conversations[index].unreadCountByUserId[currentId] = 0
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
    guard let currentUserId = data.currentUserId else { return }

    let message = MessageModel(
      id: UUID().uuidString,
      conversationId: conversationId,
      userId: currentUserId,
      text: text,
      type: type,
      imagePath: imagePath,
      audioPath: audioPath,
      audioDurationSeconds: audioDurationSeconds,
      createdAt: Date()
    )

    data.messages.append(message)

    if let index = data.conversations.firstIndex(where: { $0.id == conversationId }) {
      data.conversations[index].lastMessageId = message.id
      // 发送者不增加未读，仅给其他参与者增加未读
      for uid in data.conversations[index].participantUserIds where uid != currentUserId {
        let cur = data.conversations[index].unreadCountByUserId[uid] ?? 0
        data.conversations[index].unreadCountByUserId[uid] = cur + 1
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
        id: "u1", name: "a4ll1e", avatarSymbol: "Ja1iuGwTBJ8T_ava1",
        email: "mely@gmail.com", password: "123456"),
      .init(
        id: "u2", name: "ouslife0", avatarSymbol: "Ja1iuGwTBJ8T_ava2"),
      .init(id: "u3", name: "wendydavid", avatarSymbol: "Ja1iuGwTBJ8T_ava3"),
      .init(id: "u4", name: "mcke", avatarSymbol: "Ja1iuGwTBJ8T_ava4"),
      .init(id: "u5", name: "Karolina", avatarSymbol: "Ja1iuGwTBJ8T_ava5"),
      .init(id: "u6", name: "Amily", avatarSymbol: "Ja1iuGwTBJ8T_ava6"),
      .init(id: "u7", name: "Iago", avatarSymbol: "Ja1iuGwTBJ8T_ava7"),
      .init(id: "u8", name: "Pulua", avatarSymbol: "Ja1iuGwTBJ8T_ava8"),
    ]

    // 首次启动：未登录、未同意 EULA
    let currentUserId: String? = nil

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let aug1 = formatter.date(from: "2025-08-01") ?? Date()
    let mar4 = formatter.date(from: "2025-03-04") ?? Date()
    let communityPosts: [CommunityPostModel] = [
      .init(
        id: "cp1", userId: "u5", imageName: "jbTdcdQfTk5W_day11", description: "Leg day 🦵🏋️‍♀️",
        tags: ["Daily"], likeCount: 0, commentCount: 1, createdAt: aug1),
      .init(
        id: "cp2", userId: "u6", imageName: "jbTdcdQfTk5W_day21",
        description: "Body transformation from fat loss to muscle gain in one year",
        tags: ["Leisure"], likeCount: 0, commentCount: 1, createdAt: aug1),
      .init(
        id: "cp3", userId: "u7", imageName: "jbTdcdQfTk5W_day31",
        description: "What I did to get a V-Shape",
        tags: ["Daily"], likeCount: 12, commentCount: 1, createdAt: Date()),
      .init(
        id: "cp4", userId: "u8", imageName: "jbTdcdQfTk5W_day41",
        description: "Late-night workout is my own medicine",
        tags: ["other"], likeCount: 8, commentCount: 1, createdAt: Date()),
    ]

    let communityComments: [CommunityCommentModel] = [
      .init(
        id: "cc1", postId: "cp1", userId: "u3",
        text: "The scenery along the way seems very beautiful.", createdAt: mar4),
      .init(id: "cc2", postId: "cp2", userId: "u4", text: "So beautiful ✨", createdAt: mar4),
      .init(
        id: "cc3", postId: "cp3", userId: "u2", text: "Let's share our progress!", createdAt: Date()
      ),
      .init(
        id: "cc4", postId: "cp4", userId: "u5", text: "You're in great shape today. 💪",
        createdAt: Date()),
    ]

    let conversations: [ConversationModel] = [
      .init(
        id: "c1", participantUserIds: ["u1", "u2"], lastMessageId: nil,
        unreadCountByUserId: ["u1": 1]),
      .init(
        id: "c2", participantUserIds: ["u1", "u3"], lastMessageId: nil,
        unreadCountByUserId: ["u1": 1]),
    ]

    let messages: [MessageModel] = [
      .init(
        id: "m1",
        conversationId: "c1",
        userId: "u2",
        text: "What new gadgets are you working on lately?",
        type: .text,
        createdAt: Date()
      ),
      .init(
        id: "m2",
        conversationId: "c2",
        userId: "u3",
        text: "The content you shared is very interesting!",
        type: .text,
        createdAt: Date()
      ),
    ]

    var conversationsWithLast = conversations
    for (index, conv) in conversationsWithLast.enumerated() {
      let lastMessage = messages.last(where: { $0.conversationId == conv.id })
      conversationsWithLast[index].lastMessageId = lastMessage?.id
    }

    let challenges: [DanceChallenge] = AppDataStore.defaultChallenges()
    let challengeVideos: [ChallengeVideo] = AppDataStore.defaultChallengeVideos()

    return AppData(
      users: users,
      challenges: challenges,
      challengeVideos: challengeVideos,
      communityPosts: communityPosts,
      communityComments: communityComments,
      conversations: conversationsWithLast,
      messages: messages,
      currentUserId: currentUserId,
      quickLoginUserId: nil,
      hasAcceptedEULA: false
    )
  }
}
