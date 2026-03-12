//
//  EditProfileView.swift
//  Mely
//
//  编辑用户信息：头像、昵称
//

import SwiftUI

struct EditProfileView: View {
  @EnvironmentObject private var appDataStore: AppDataStore
  @Environment(\.dismiss) private var dismiss
  @Binding var path: [MainRoute]

  @State private var nameText: String = ""
  @State private var selectedAvatarImage: UIImage?
  @State private var pendingAvatarPath: String?
  @State private var showImageSourcePicker: Bool = false

  private let accentGreen = Color(hex: "#CBED40")

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private var displayAvatar: (isImage: Bool, image: UIImage?, symbol: String)? {
    if let img = selectedAvatarImage {
      return (true, img, "")
    }
    let symbol = pendingAvatarPath ?? appDataStore.currentUser?.avatarSymbol ?? "mely_defava"
    return (false, nil, symbol)
  }

  var body: some View {
    ZStack {
      Image("zhuyaoyebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 0) {
        navigationBar

        VStack(spacing: 32) {
          avatarSection
          nameInputSection
        }
        .padding(.horizontal, 24)
        .padding(.top, 40)

        Spacer()

        saveButton
          .padding(.bottom, 48)
      }
    }
    .onAppear {
      nameText = appDataStore.currentUser?.name ?? ""
    }
    .imageSourcePicker(isPresented: $showImageSourcePicker) { image in
      selectedAvatarImage = image
      if let path = ImageStorageHelper.saveAvatarImage(image) {
        pendingAvatarPath = path
      }
    }
    .navigationBarHidden(true)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var navigationBar: some View {
    HStack {
      Button {
        if !path.isEmpty { path.removeLast() } else { dismiss() }
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()

      Color.clear
        .frame(width: 44, height: 44)
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 4)
  }

  private var avatarSection: some View {
    Button {
      showImageSourcePicker = true
    } label: {
      ZStack(alignment: .bottomTrailing) {
        ZStack {
          Circle()
            .fill(accentGreen)
            .frame(width: 120, height: 120)

          if let display = displayAvatar {
            if display.isImage, let img = display.image {
              Image(uiImage: img)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            } else {
              SmartImageView.namedOrPath(
                display.symbol,
                placeholder: Image("mely_defava")
              )
              .scaledToFill()
              .frame(width: 120, height: 120)
              .clipShape(Circle())
            }
          }
        }

        Circle()
          .fill(Color.white)
          .frame(width: 36, height: 36)
          .overlay {
            Image(systemName: "camera.fill")
              .font(.system(size: 16))
              .foregroundColor(.black)
          }
          .offset(x: -4, y: -4)
      }
    }
    .buttonStyle(.plain)
  }

  private var nameInputSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Name")
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)

      TextField("Please enter", text: $nameText)
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color.black.opacity(0.7))
        )
        .submitLabel(.done)
    }
  }

  private var saveButton: some View {
    Button {
      performSave()
    } label: {
      Text("Save")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 28, style: .continuous)
            .fill(accentGreen)
        )
    }
    .buttonStyle(.plain)
    .padding(.horizontal, 24)
  }

  private func performSave() {
    let trimmedName = nameText.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmedName.isEmpty || pendingAvatarPath != nil else { return }
    appDataStore.updateCurrentUser(
      name: trimmedName.isEmpty ? nil : trimmedName,
      avatarSymbol: pendingAvatarPath
    )
    if !path.isEmpty { path.removeLast() } else { dismiss() }
  }
}
