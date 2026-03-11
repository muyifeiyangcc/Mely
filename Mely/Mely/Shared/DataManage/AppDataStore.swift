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
        title: "Home Beat Dance Workout",
        imageName: "q9V8ph41lXTH_tiao1",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 12_500,
        description: "work on your muscles, it's important 🏋‍♀️"
      ),
      DanceChallenge(
        id: "id2",
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

    let newUser = UserModel(
      id: UUID().uuidString,
      name: "Quick",
      avatarSymbol: "mely_defava",
      email: nil,
      password: nil,
      isQuickUser: true
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

  /// 删除当前登录用户，如果是快速登录用户则同时清空 quickLoginUserId
  func deleteCurrentUser() {
    guard let currentId = data.currentUserId else { return }

    data.users.removeAll { $0.id == currentId }
    data.communityPosts.removeAll { $0.userId == currentId }
    data.communityComments.removeAll { $0.userId == currentId }
    data.messages.removeAll { $0.userId == currentId }

    if data.quickLoginUserId == currentId {
      data.quickLoginUserId = nil
    }

    data.currentUserId = nil
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

  /// 将指定用户 id 加入当前登录用户的拉黑列表
  func blockUser(uid: String) {
    guard let currentId = data.currentUserId,
      let index = data.users.firstIndex(where: { $0.id == currentId })
    else { return }
    if !data.users[index].blockUids.contains(uid) {
      data.users[index].blockUids.append(uid)
      save()
    }
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
    let challenge = DanceChallenge(
      id: UUID().uuidString,
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
        thumbnailName: "I7SrplfHHwLH_feng1", videoName: "SKTyyB8jjAwN_pind1", likeCount: 140_000,
        isLocked: false,
        unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "cv2", challengeId: "id1", userId: "u3",
        thumbnailName: "I7SrplfHHwLH_feng2", videoName: "SKTyyB8jjAwN_pind2", likeCount: 140_000,
        isLocked: true,
        unlockCostDiamonds: 300),
      ChallengeVideo(
        id: "cv3", challengeId: "id2", userId: "u4",
        thumbnailName: "I7SrplfHHwLH_feng3", videoName: "SKTyyB8jjAwN_pind3", likeCount: 140_000,
        isLocked: false,
        unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "cv4", challengeId: "id2", userId: "u5",
        thumbnailName: "I7SrplfHHwLH_feng4", videoName: "SKTyyB8jjAwN_pind4", likeCount: 140_000,
        isLocked: true,
        unlockCostDiamonds: 300),
    ]
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
      .init(id: "c1", participantUserIds: ["u1", "u2"], lastMessageId: nil),
      .init(id: "c2", participantUserIds: ["u1", "u3"], lastMessageId: nil),
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
