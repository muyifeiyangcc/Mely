import Foundation

struct UserModel: Identifiable, Codable, Equatable {
  let id: String
  var name: String
  var avatarSymbol: String
  var email: String? = nil
  var password: String? = nil
  var isQuickUser: Bool = false
  var diamonds: Int = 0
  var blockUids: [String] = []
  var followIds: [String] = []
  var followingIds: [String] = []
  var likeIds: [String] = []
  var unlockedVideoIds: [String] = []

  enum CodingKeys: String, CodingKey {
    case id, name, avatarSymbol, email, password, isQuickUser, diamonds, blockUids, followIds,
      followingIds, likeIds, unlockedVideoIds
  }

  init(
    id: String, name: String, avatarSymbol: String,
    email: String? = nil, password: String? = nil, isQuickUser: Bool = false, diamonds: Int = 0,
    blockUids: [String] = [], followIds: [String] = [], followingIds: [String] = [],
    likeIds: [String] = [],
    unlockedVideoIds: [String] = []
  ) {
    self.id = id
    self.name = name
    self.avatarSymbol = avatarSymbol
    self.email = email
    self.password = password
    self.isQuickUser = isQuickUser
    self.diamonds = diamonds
    self.blockUids = blockUids
    self.followIds = followIds
    self.followingIds = followingIds
    self.likeIds = likeIds
    self.unlockedVideoIds = unlockedVideoIds
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .id)
    name = try c.decode(String.self, forKey: .name)
    avatarSymbol = try c.decode(String.self, forKey: .avatarSymbol)
    email = try c.decodeIfPresent(String.self, forKey: .email)
    password = try c.decodeIfPresent(String.self, forKey: .password)
    isQuickUser = try c.decodeIfPresent(Bool.self, forKey: .isQuickUser) ?? false
    diamonds = try c.decodeIfPresent(Int.self, forKey: .diamonds) ?? 0
    blockUids = try c.decodeIfPresent([String].self, forKey: .blockUids) ?? []
    followIds = try c.decodeIfPresent([String].self, forKey: .followIds) ?? []
    followingIds = try c.decodeIfPresent([String].self, forKey: .followingIds) ?? []
    likeIds = try c.decodeIfPresent([String].self, forKey: .likeIds) ?? []
    unlockedVideoIds = try c.decodeIfPresent([String].self, forKey: .unlockedVideoIds) ?? []
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .id)
    try c.encode(name, forKey: .name)
    try c.encode(avatarSymbol, forKey: .avatarSymbol)
    try c.encodeIfPresent(email, forKey: .email)
    try c.encodeIfPresent(password, forKey: .password)
    try c.encode(isQuickUser, forKey: .isQuickUser)
    try c.encode(diamonds, forKey: .diamonds)
    try c.encode(blockUids, forKey: .blockUids)
    try c.encode(followIds, forKey: .followIds)
    try c.encode(followingIds, forKey: .followingIds)
    try c.encode(likeIds, forKey: .likeIds)
    try c.encode(unlockedVideoIds, forKey: .unlockedVideoIds)
  }
}

struct ConversationModel: Identifiable, Codable, Equatable {
  let id: String
  let participantUserIds: [String]
  var lastMessageId: String?
  var unreadCountByUserId: [String: Int]

  init(
    id: String, participantUserIds: [String], lastMessageId: String? = nil,
    unreadCountByUserId: [String: Int] = [:]
  ) {
    self.id = id
    self.participantUserIds = participantUserIds
    self.lastMessageId = lastMessageId
    self.unreadCountByUserId = unreadCountByUserId
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .id)
    participantUserIds = try c.decode([String].self, forKey: .participantUserIds)
    lastMessageId = try c.decodeIfPresent(String.self, forKey: .lastMessageId)
    unreadCountByUserId =
      try c.decodeIfPresent([String: Int].self, forKey: .unreadCountByUserId) ?? [:]
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .id)
    try c.encode(participantUserIds, forKey: .participantUserIds)
    try c.encodeIfPresent(lastMessageId, forKey: .lastMessageId)
    try c.encode(unreadCountByUserId, forKey: .unreadCountByUserId)
  }

  enum CodingKeys: String, CodingKey {
    case id, participantUserIds, lastMessageId, unreadCountByUserId
  }
}

struct MessageModel: Identifiable, Codable, Equatable {
  enum MessageType: String, Codable, Equatable {
    case text
    case emoji
    case voice
    case image
  }

  let id: String
  let conversationId: String
  let userId: String
  let text: String
  let type: MessageType
  var imagePath: String?
  var audioPath: String?
  var audioDurationSeconds: Int?
  let createdAt: Date

  init(
    id: String,
    conversationId: String,
    userId: String,
    text: String,
    type: MessageType = .text,
    imagePath: String? = nil,
    audioPath: String? = nil,
    audioDurationSeconds: Int? = nil,
    createdAt: Date
  ) {
    self.id = id
    self.conversationId = conversationId
    self.userId = userId
    self.text = text
    self.type = type
    self.imagePath = imagePath
    self.audioPath = audioPath
    self.audioDurationSeconds = audioDurationSeconds
    self.createdAt = createdAt
  }

  var isText: Bool { type == .text }
  var isEmoji: Bool { type == .emoji }
  var isVoice: Bool { type == .voice }
  var isImage: Bool { type == .image }
}

struct DanceChallenge: Identifiable, Codable, Equatable {
  let id: String
  let userId: String
  let title: String
  let imageName: String?
  var isJoined: Bool
  let difficulty: String
  let participantsCount: Int
  let description: String

  init(
    id: String,
    userId: String,
    title: String,
    imageName: String?,
    isJoined: Bool,
    difficulty: String,
    participantsCount: Int,
    description: String
  ) {
    self.id = id
    self.userId = userId
    self.title = title
    self.imageName = imageName
    self.isJoined = isJoined
    self.difficulty = difficulty
    self.participantsCount = participantsCount
    self.description = description
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .id)
    userId = try c.decodeIfPresent(String.self, forKey: .userId) ?? "u1"
    title = try c.decode(String.self, forKey: .title)
    imageName = try c.decodeIfPresent(String.self, forKey: .imageName)
    isJoined = try c.decode(Bool.self, forKey: .isJoined)
    difficulty = try c.decode(String.self, forKey: .difficulty)
    participantsCount = try c.decode(Int.self, forKey: .participantsCount)
    description = try c.decode(String.self, forKey: .description)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .id)
    try c.encode(userId, forKey: .userId)
    try c.encode(title, forKey: .title)
    try c.encodeIfPresent(imageName, forKey: .imageName)
    try c.encode(isJoined, forKey: .isJoined)
    try c.encode(difficulty, forKey: .difficulty)
    try c.encode(participantsCount, forKey: .participantsCount)
    try c.encode(description, forKey: .description)
  }

  enum CodingKeys: String, CodingKey {
    case id, userId, title, imageName, isJoined, difficulty, participantsCount, description
  }
}

struct ChallengeVideo: Identifiable, Codable, Equatable {
  let id: String
  let challengeId: String
  let userId: String
  let thumbnailName: String?
  let videoName: String?
  var likeCount: Int
  let isLocked: Bool
  let unlockCostDiamonds: Int?

  enum CodingKeys: String, CodingKey {
    case id, challengeId, userId, thumbnailName, videoName, likeCount, isLocked, unlockCostDiamonds
  }

  init(
    id: String,
    challengeId: String,
    userId: String,
    thumbnailName: String?,
    videoName: String? = nil,
    likeCount: Int,
    isLocked: Bool,
    unlockCostDiamonds: Int?
  ) {
    self.id = id
    self.challengeId = challengeId
    self.userId = userId
    self.thumbnailName = thumbnailName
    self.videoName = videoName
    self.likeCount = likeCount
    self.isLocked = isLocked
    self.unlockCostDiamonds = unlockCostDiamonds
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .id)
    challengeId = try c.decode(String.self, forKey: .challengeId)
    userId = try c.decodeIfPresent(String.self, forKey: .userId) ?? "u6"
    thumbnailName = try c.decodeIfPresent(String.self, forKey: .thumbnailName)
    videoName = try c.decodeIfPresent(String.self, forKey: .videoName)
    likeCount = try c.decode(Int.self, forKey: .likeCount)
    isLocked = try c.decode(Bool.self, forKey: .isLocked)
    unlockCostDiamonds = try c.decodeIfPresent(Int.self, forKey: .unlockCostDiamonds)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .id)
    try c.encode(challengeId, forKey: .challengeId)
    try c.encode(userId, forKey: .userId)
    try c.encodeIfPresent(thumbnailName, forKey: .thumbnailName)
    try c.encodeIfPresent(videoName, forKey: .videoName)
    try c.encode(likeCount, forKey: .likeCount)
    try c.encode(isLocked, forKey: .isLocked)
    try c.encodeIfPresent(unlockCostDiamonds, forKey: .unlockCostDiamonds)
  }

  var likeCountFormatted: String {
    if likeCount >= 10_000 {
      let w = Double(likeCount) / 10_000
      return String(format: "%.1fW", w)
    }
    return "\(likeCount)"
  }

}

struct CommunityPostModel: Identifiable, Codable, Equatable {
  let id: String
  let userId: String
  let imageName: String
  var description: String
  var tags: [String]
  var likeCount: Int
  var commentCount: Int
  let createdAt: Date

  var dateString: String {
    let f = DateFormatter()
    f.dateFormat = "MM-dd"
    return f.string(from: createdAt)
  }
}

struct CommunityCommentModel: Identifiable, Codable, Equatable {
  let id: String
  let postId: String
  let userId: String
  let text: String
  let createdAt: Date

  var dateString: String {
    let f = DateFormatter()
    f.dateFormat = "MM-dd"
    return f.string(from: createdAt)
  }
}

struct AppData: Codable, Equatable {
  var users: [UserModel]
  var challenges: [DanceChallenge]
  var challengeVideos: [ChallengeVideo]
  var communityPosts: [CommunityPostModel]
  var communityComments: [CommunityCommentModel]
  var conversations: [ConversationModel]
  var messages: [MessageModel]
  var currentUserId: String?
  var quickLoginUserId: String? = nil
  var hasAcceptedEULA: Bool = false

  enum CodingKeys: String, CodingKey {
    case users, recommendedItems, posts, challenges, challengeVideos, communityPosts,
      communityComments, conversations, messages
    case currentUserId, quickLoginUserId, hasAcceptedEULA
  }

  init(
    users: [UserModel],
    challenges: [DanceChallenge], challengeVideos: [ChallengeVideo],
    communityPosts: [CommunityPostModel], communityComments: [CommunityCommentModel],
    conversations: [ConversationModel], messages: [MessageModel],
    currentUserId: String?, quickLoginUserId: String? = nil, hasAcceptedEULA: Bool = false
  ) {
    self.users = users
    self.challenges = challenges
    self.challengeVideos = challengeVideos
    self.communityPosts = communityPosts
    self.communityComments = communityComments
    self.conversations = conversations
    self.messages = messages
    self.currentUserId = currentUserId
    self.quickLoginUserId = quickLoginUserId
    self.hasAcceptedEULA = hasAcceptedEULA
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    users = try c.decode([UserModel].self, forKey: .users)
    challenges = try c.decodeIfPresent([DanceChallenge].self, forKey: .challenges) ?? []
    challengeVideos = try c.decodeIfPresent([ChallengeVideo].self, forKey: .challengeVideos) ?? []
    communityPosts = try c.decodeIfPresent([CommunityPostModel].self, forKey: .communityPosts) ?? []
    communityComments =
      try c.decodeIfPresent([CommunityCommentModel].self, forKey: .communityComments) ?? []
    conversations = try c.decode([ConversationModel].self, forKey: .conversations)
    messages = try c.decode([MessageModel].self, forKey: .messages)
    currentUserId = try c.decodeIfPresent(String.self, forKey: .currentUserId)
    quickLoginUserId = try c.decodeIfPresent(String.self, forKey: .quickLoginUserId)
    hasAcceptedEULA = try c.decodeIfPresent(Bool.self, forKey: .hasAcceptedEULA) ?? false
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(users, forKey: .users)
    try c.encode(challenges, forKey: .challenges)
    try c.encode(challengeVideos, forKey: .challengeVideos)
    try c.encode(communityPosts, forKey: .communityPosts)
    try c.encode(communityComments, forKey: .communityComments)
    try c.encode(conversations, forKey: .conversations)
    try c.encode(messages, forKey: .messages)
    try c.encodeIfPresent(currentUserId, forKey: .currentUserId)
    try c.encodeIfPresent(quickLoginUserId, forKey: .quickLoginUserId)
    try c.encode(hasAcceptedEULA, forKey: .hasAcceptedEULA)
  }
}
