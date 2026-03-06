import Foundation

struct UserModel: Identifiable, Codable, Equatable {
  let id: String
  var name: String
  var avatarSymbol: String
  var bio: String
  /// 账号登录时使用的邮箱（快速登录用户为 nil）
  var email: String? = nil
  /// 账号密码登录使用的本地密码（示例项目中明文存储，真实项目请使用安全存储）
  var password: String? = nil
  /// 是否为快速登录创建的用户
  var isQuickUser: Bool = false
}

struct RecommendedItemModel: Identifiable, Codable, Equatable {
  let id: String
  let title: String
  let summary: String
  let userId: String
  let createdAt: Date
}

struct PostModel: Identifiable, Codable, Equatable {
  let id: String
  let title: String
  let content: String
  let userId: String
  let createdAt: Date
}

struct ConversationModel: Identifiable, Codable, Equatable {
  let id: String
  let title: String
  let participantUserIds: [String]
  var lastMessageId: String?
}

struct MessageModel: Identifiable, Codable, Equatable {
  let id: String
  let conversationId: String
  let userId: String
  let text: String
  let createdAt: Date
}

struct AppData: Codable, Equatable {
  var users: [UserModel]
  var recommendedItems: [RecommendedItemModel]
  var posts: [PostModel]
  var conversations: [ConversationModel]
  var messages: [MessageModel]
  /// 当前登录用户 id，nil 表示未登录
  var currentUserId: String?
  /// 最近一次快速登录用户 id，用于“我是新用户”再次登录同一账号
  var quickLoginUserId: String? = nil
  /// 是否已同意 EULA
  var hasAcceptedEULA: Bool = false
}
