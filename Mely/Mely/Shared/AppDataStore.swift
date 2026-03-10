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
        title: "Dance Together",
        imageName: "test",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 12_500,
        description: "与好友共舞，享受当下。"
      ),
      DanceChallenge(
        id: "id2",
        title: "Speed Challenge",
        imageName: "test",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 12_500,
        description: "提升你的速度和敏捷性！每周完成指定速度舞蹈挑战，赢得奖励。"
      ),
      DanceChallenge(
        id: "id3",
        title: "Flexibility Flow",
        imageName: "test",
        isJoined: true,
        difficulty: "Easy",
        participantsCount: 8_900,
        description: "通过一系列柔韧性练习，提升你的身体柔韧度，让舞姿更优美。"
      ),
      DanceChallenge(
        id: "id4",
        title: "Cardio Blast",
        imageName: "test",
        isJoined: false,
        difficulty: "Hard",
        participantsCount: 15_300,
        description: "高强度有氧舞蹈挑战，燃烧卡路里，提升心肺功能。"
      ),
      DanceChallenge(
        id: "id5",
        title: "Balance Master",
        imageName: "test",
        isJoined: false,
        difficulty: "Medium",
        participantsCount: 9_800,
        description: "专注于核心力量和平衡训练，挑战你的身体控制力。"
      ),
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
    challenges.flatMap { defaultVideosForChallenge($0.id) }
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
      avatarSymbol: "person.crop.circle.fill",
      bio: "通过快速登录创建的账号。",
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
      avatarSymbol: "envelope.fill",
      bio: "通过邮箱登录创建的账号。",
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
    data.posts.removeAll { $0.userId == currentId }
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

  // MARK: - 内容变更

  func addPost(title: String, content: String) {
    guard let currentUserId = data.currentUserId else { return }
    let newPost = PostModel(
      id: UUID().uuidString,
      title: title,
      content: content,
      userId: currentUserId,
      createdAt: Date()
    )
    data.posts.insert(newPost, at: 0)
    save()
  }

  /// 添加社区图片帖子
  func addCommunityPost(imageName: String, tags: [String]) {
    guard let currentUserId = data.currentUserId else { return }
    let newPost = CommunityPostModel(
      id: UUID().uuidString,
      userId: currentUserId,
      imageName: imageName,
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
    let defaultVideos = Self.defaultVideosForChallenge(challenge.id)
    data.challengeVideos.insert(contentsOf: defaultVideos, at: 0)
    save()
  }

  /// 为新挑战创建 6 个默认视频（前 3 解锁，后 3 锁定 300 钻石）
  fileprivate static func defaultVideosForChallenge(_ challengeId: String) -> [ChallengeVideo] {
    return [
      ChallengeVideo(
        id: "\(challengeId)-cv1", challengeId: challengeId, userId: "u1",
        thumbnailName: "test", likeCount: 140_000, isLocked: false, unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "\(challengeId)-cv2", challengeId: challengeId, userId: "u2",
        thumbnailName: "test", likeCount: 140_000, isLocked: false, unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "\(challengeId)-cv3", challengeId: challengeId, userId: "u3",
        thumbnailName: "test", likeCount: 140_000, isLocked: false, unlockCostDiamonds: nil),
      ChallengeVideo(
        id: "\(challengeId)-cv4", challengeId: challengeId, userId: "u4",
        thumbnailName: "test", likeCount: 140_000, isLocked: true, unlockCostDiamonds: 300),
      ChallengeVideo(
        id: "\(challengeId)-cv5", challengeId: challengeId, userId: "u5",
        thumbnailName: "test", likeCount: 140_000, isLocked: true, unlockCostDiamonds: 300),
      ChallengeVideo(
        id: "\(challengeId)-cv6", challengeId: challengeId, userId: "u6",
        thumbnailName: "test", likeCount: 140_000, isLocked: true, unlockCostDiamonds: 300),
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
        id: "u1", name: "Mely", avatarSymbol: "sparkles", bio: "热爱创造的小小产品人。",
        email: "mely@gmail.com", password: "123456"),
      .init(id: "u2", name: "阿木", avatarSymbol: "leaf.fill", bio: "喜欢 SwiftUI 和 Indie Dev。"),
      .init(id: "u3", name: "小白", avatarSymbol: "hare.fill", bio: "正在学习 iOS。"),
      .init(id: "u4", name: "旅人", avatarSymbol: "airplane", bio: "记录一路上的见闻。"),
      .init(id: "u5", name: "深夜码农", avatarSymbol: "moon.stars.fill", bio: "晚上写代码，白天改 bug。"),
      .init(id: "u6", name: "Wei Riley", avatarSymbol: "person.crop.circle.fill", bio: "分享运动与生活。"),
    ]

    // 首次启动：未登录、未同意 EULA
    let currentUserId: String? = nil

    let recommendedItems: [RecommendedItemModel] = [
      .init(
        id: "r1", title: "今天开始用 SwiftUI 写点什么", summary: "从一个小组件开始，让想法慢慢长大。", userId: "u1",
        createdAt: Date()),
      .init(
        id: "r2", title: "打造属于自己的 Indie App", summary: "不追热门，只解决自己在乎的问题。", userId: "u2",
        createdAt: Date()),
      .init(
        id: "r3", title: "碎片时间也能迭代产品", summary: "利用通勤和碎片时间，把待办拆到足够小。", userId: "u5",
        createdAt: Date()),
      .init(
        id: "r4", title: "把想法写下来再评估", summary: "先记录，再筛选，比一开始就纠结要不要做轻松很多。", userId: "u3",
        createdAt: Date()),
      .init(
        id: "r5", title: "给自己留一点不联网的时间", summary: "离开信息流，你的想法会更清晰。", userId: "u4", createdAt: Date()
      ),
    ]

    let posts: [PostModel] = [
      .init(
        id: "p1", title: "刚上线第一个 TestFlight 版本", content: "紧张又兴奋，欢迎大家帮忙试用。", userId: "u2",
        createdAt: Date()),
      .init(
        id: "p2", title: "今天把首页 UI 重构了一遍", content: "尝试了更干净的布局，加载速度也快了。", userId: "u1",
        createdAt: Date()),
      .init(
        id: "p3", title: "问一个关于本地持久化的小问题", content: "大家更喜欢 UserDefaults 还是直接上数据库？", userId: "u3",
        createdAt: Date()),
      .init(
        id: "p4", title: "一个人做产品时如何保持动力", content: "分享几条自己在坚持的小习惯。", userId: "u5", createdAt: Date()
      ),
      .init(
        id: "p5", title: "记录一次 App 被拒的经历", content: "总结了一些审核时容易踩坑的点。", userId: "u4",
        createdAt: Date()),
    ]

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let aug1 = formatter.date(from: "2025-08-01") ?? Date()
    let mar4 = formatter.date(from: "2025-03-04") ?? Date()
    let communityPosts: [CommunityPostModel] = [
      .init(
        id: "cp1", userId: "u6", imageName: "test", tags: ["Daily", "Baby"], likeCount: 0,
        commentCount: 2, createdAt: aug1),
      .init(
        id: "cp2", userId: "u6", imageName: "test", tags: ["Daily", "Fitness"], likeCount: 0,
        commentCount: 0, createdAt: aug1),
      .init(
        id: "cp3", userId: "u1", imageName: "test", tags: ["分享"], likeCount: 12, commentCount: 1,
        createdAt: Date()),
      .init(
        id: "cp4", userId: "u2", imageName: "test", tags: ["日常"], likeCount: 8, commentCount: 1,
        createdAt: Date()),
    ]

    let communityComments: [CommunityCommentModel] = [
      .init(
        id: "cc1", postId: "cp1", userId: "u3",
        text: "The scenery along the way seems very beautiful.", createdAt: mar4),
      .init(id: "cc2", postId: "cp1", userId: "u4", text: "真好看 ✨", createdAt: mar4),
      .init(id: "cc3", postId: "cp3", userId: "u2", text: "一起分享进度吧～", createdAt: Date()),
      .init(id: "cc4", postId: "cp4", userId: "u1", text: "今天状态很好 💪", createdAt: Date()),
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
      recommendedItems: recommendedItems,
      posts: posts,
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
