//
//  UserAvatarView.swift
//  Mely
//
//  用户头像展示，支持 Asset 资源名与持久化文件路径
//

import SwiftUI

struct UserAvatarView: View {
  let avatarSymbol: String
  var placeholder: Image = Image("mely_defava")
  var size: CGFloat = 80

  var body: some View {
    SmartImageView.namedOrPath(avatarSymbol, placeholder: placeholder)
      .scaledToFill()
      .frame(width: size, height: size)
      .clipShape(Circle())
  }
}
