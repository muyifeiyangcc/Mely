//
//  EmailLoginView.swift
//  Mely
//
//  邮箱登录 / 注册 / 忘记密码 复用表单。
//

import SwiftUI

enum EmailAuthMode: Identifiable {
  case login
  case signup
  case forgot

  var id: String {
    switch self {
    case .login: return "login"
    case .signup: return "signup"
    case .forgot: return "forgot"
    }
  }
}

struct EmailAuthView: View {
  let initialMode: EmailAuthMode

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var appDataStore: AppDataStore

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var email: String = ""
  @State private var password: String = ""
  @State private var confirmPassword: String = ""
  @State private var showPassword: Bool = false
  @State private var showConfirmPassword: Bool = false
  @State private var mode: EmailAuthMode
  @State private var errorMessage: String?

  init(mode: EmailAuthMode) {
    self.initialMode = mode
    _mode = State(initialValue: mode)
  }

  var body: some View {
    ZStack {
      Image("sancaihebg")
        .resizable()
        .ignoresSafeArea()

      VStack(spacing: 24) {
        HStack {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.backward")
              .foregroundColor(.black)
              .padding(10)
              .background(.white, in: Circle())
          }
          Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 8)

        ZStack(alignment: .leading) {
          Image("xinqiuhuanrao")
            .resizable()
            .scaledToFit()
            .frame(width: 220, height: 126)

          Text(titleText)
            .font(.custom("Hanchansans-Medium", size: 36))
            .foregroundColor(.white)
            .padding(.leading, 26)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 0)
        // .padding(.top, 16)

        VStack(spacing: 16) {
          emailField
          passwordField
          if showsConfirmField {
            confirmPasswordField
          }

          if mode == .login {
            HStack {
              Spacer()
              Button("Forgot?") {
                mode = .forgot
                password = ""
                confirmPassword = ""
                errorMessage = nil
              }
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            }
            .padding(.horizontal, 18)
          }

          if let errorMessage {
            Text(errorMessage)
              .font(.footnote)
              .foregroundColor(.red)
              .frame(maxWidth: .infinity, alignment: .leading)
          }

          Button(action: submit) {
            Text(primaryButtonTitle)
              .font(.headline)
              .foregroundColor(.black)
              .frame(width: 300)
              .padding(.vertical, 14)
              .background(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                  .fill(Color(red: 0.82, green: 1.0, blue: 0.0))
              )
          }
          .disabled(!canSubmit)
          .padding(.top, 50)
        }

        Spacer()
      }
    }
    // 不要原生的页面返回
    .navigationBarBackButtonHidden(true)
    // .navigationBarItems(leading: Button(action: {
    //   dismiss()
    // }) {
    //   Image(systemName: "chevron.backward")
    //     .foregroundColor(.white)
    // })

    #if DEBUG
      .enableInjection()
    #endif
  }

  // MARK: - Subviews

  private var emailField: some View {
    HStack {
      Image(systemName: "envelope.fill")
        .foregroundColor(.black)
      TextField("", text: $email, prompt: Text("Email address").foregroundColor(.gray))
        .font(.custom("Hanchansans-Medium", size: 16))
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .foregroundColor(.black)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(.white)
    // .background(.white, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
  }

  private var passwordField: some View {
    HStack {
      Image(systemName: "key.fill")
        .foregroundColor(.black)
        .font(.system(size: 18))
        .padding(.leading, 5)
      Group {
        if showPassword {
          TextField("", text: $password, prompt: Text(passwordPlaceholder).foregroundColor(.gray))
        } else {
          SecureField("", text: $password, prompt: Text(passwordPlaceholder).foregroundColor(.gray))
        }
      }
      .foregroundColor(.black)
      .font(.custom("Hanchansans-Medium", size: 16))
      .padding(.leading, 4)

      Button {
        showPassword.toggle()
      } label: {
        Image(showPassword ? "lxetxabjvlyj_kai" : "lxetxabjvlyj_guan")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(.white)
  }

  private var confirmPasswordField: some View {
    HStack {
      Image(systemName: "key.fill")
        .foregroundColor(.black)
        .font(.system(size: 18))
        .padding(.leading, 5)
      Group {
        if showConfirmPassword {
          TextField(
            "", text: $confirmPassword,
            prompt: Text(confirmPasswordPlaceholder).foregroundColor(.gray))
        } else {
          SecureField(
            "", text: $confirmPassword,
            prompt: Text(confirmPasswordPlaceholder).foregroundColor(.gray))
        }
      }
      .foregroundColor(.black)
      .font(.custom("Hanchansans-Medium", size: 16))
      .padding(.leading, 5)

      Button {
        showConfirmPassword.toggle()
      } label: {
        Image(showConfirmPassword ? "lxetxabjvlyj_kai" : "lxetxabjvlyj_guan")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .background(.white)
  }

  // MARK: - Computed

  private var titleText: String {
    switch mode {
    case .login:
      return "Welcome!"
    case .signup:
      return "Sign up"
    case .forgot:
      return "Forget password"
    }
  }

  private var primaryButtonTitle: String {
    switch mode {
    case .login:
      return "Login"
    case .signup:
      return "Sign up"
    case .forgot:
      return "Save"
    }
  }

  private var passwordPlaceholder: String {
    switch mode {
    case .login, .signup:
      return "Password"
    case .forgot:
      return "New password"
    }
  }

  private var confirmPasswordPlaceholder: String {
    switch mode {
    case .signup:
      return "Password"
    case .forgot:
      return "Confirm password"
    case .login:
      return ""
    }
  }

  private var showsConfirmField: Bool {
    switch mode {
    case .login:
      return false
    case .signup, .forgot:
      return true
    }
  }

  private var canSubmit: Bool {
    let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmedEmail.isEmpty else { return false }
    switch mode {
    case .login:
      return !password.isEmpty
    case .signup, .forgot:
      return !password.isEmpty && !confirmPassword.isEmpty
    }
  }

  // MARK: - Actions

  private func submit() {
    errorMessage = nil
    let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmedEmail.isEmpty else { return }

    switch mode {
    case .login:
      do {
        try appDataStore.login(email: trimmedEmail, password: password)
        dismiss()
      } catch {
        errorMessage = (error as? AppDataStore.AuthError)?.errorDescription ?? "登录失败，请稍后重试。"
      }

    case .signup:
      guard password == confirmPassword else {
        errorMessage = "两次输入的密码不一致。"
        return
      }
      do {
        try appDataStore.signup(email: trimmedEmail, password: password)
        dismiss()
      } catch {
        errorMessage = (error as? AppDataStore.AuthError)?.errorDescription ?? "注册失败，请稍后重试。"
      }

    case .forgot:
      guard password == confirmPassword else {
        errorMessage = "两次输入的密码不一致。"
        return
      }
      do {
        try appDataStore.resetPassword(email: trimmedEmail, newPassword: password)
        dismiss()
      } catch {
        errorMessage = (error as? AppDataStore.AuthError)?.errorDescription ?? "重置密码失败，请稍后重试。"
      }
    }
  }
}
