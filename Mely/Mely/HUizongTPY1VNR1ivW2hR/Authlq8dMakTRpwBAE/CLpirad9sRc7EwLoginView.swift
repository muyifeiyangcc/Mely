//
//  CLpirad9sRc7EwLoginView.swift
//  Mely
//
//

import SwiftUI

enum ZBhqAB7Yj4CCksAumod: Identifiable {
  case locGG0oWaNjmDMcq
  case supFE4eYtk9APWyCf
  case fgt881tEnmrdjQaCw

  var id: String {
    switch self {
    case .locGG0oWaNjmDMcq: return "login"
    case .supFE4eYtk9APWyCf: return "signup"
    case .fgt881tEnmrdjQaCw: return "forgot"
    }
  }
}

struct CLpirad9sRc7EwLoginView: View {
  let inimodeNxUi7SlfqqAeI: ZBhqAB7Yj4CCksAumod

  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var XhMd8CtuFVVV7E: MelystoreWpvugHy89HDWLR

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var eml6tQ1nETAWp0FkI: String = ""
  @State private var pd9RSH79ektpsEoG: String = ""
  @State private var cfNWHj7W1x4NVeTf: String = ""
  @State private var spZhYfPvlZOqQBu1: Bool = false
  @State private var sfuMz9lYqA4iornc: Bool = false
  @State private var mode: ZBhqAB7Yj4CCksAumod
  @State private var er9FEPx028SNParU: String?

  init(mode: ZBhqAB7Yj4CCksAumod) {
    self.inimodeNxUi7SlfqqAeI = mode
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
            Image(systemName: "chevron.left")
              .font(.system(size: 18))
              .foregroundColor(.black)
              .frame(width: 44, height: 44)
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

          Text(txtpZxZwN7RfZ0b4T)
            .font(.custom("Hanchansans-Medium", size: 36))
            .foregroundColor(.white)
            .padding(.leading, 26)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 0)

        VStack(spacing: 16) {
          emfmPF38vsK9L4HTC
          pdQRpDLzcTG2h36I
          if sfRjoCzNnnBakwca {
            cfpq8zNVf5l3Pldnz
          }

          if mode == .locGG0oWaNjmDMcq {
            HStack {
              Spacer()
              Button("Forgot?") {
                mode = .fgt881tEnmrdjQaCw
                pd9RSH79ektpsEoG = ""
                cfNWHj7W1x4NVeTf = ""
                er9FEPx028SNParU = nil
              }
              .font(.custom("Hanchansans-Medium", size: 18))
              .foregroundColor(.white)
            }
            .padding(.horizontal, 18)
          }

          if let er9FEPx028SNParU {
            Text(er9FEPx028SNParU)
              .font(.custom("Hanchansans-Medium", size: 14))
              .foregroundColor(.red)
              .padding(.horizontal, 50)
              .frame(maxWidth: .infinity, alignment: .leading)
          }

          Button(action: subi8lomF1GqsBAAf) {
            Text(pbt73LRh20fD43HjB)
              .font(.headline)
              .foregroundColor(.black)
              .frame(width: 300)
              .padding(.vertical, 14)
              .background(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                  .fill(Color(red: 0.82, green: 1.0, blue: 0.0))
              )
          }
          .disabled(!csbmigFrwwb9Ijcqw)
          .padding(.top, 50)
        }

        Spacer()
      }
    }
    .navigationBarBackButtonHidden(true)

    #if DEBUG
      .enableInjection()
    #endif
  }

  private var emfmPF38vsK9L4HTC: some View {
    HStack {
      Image(systemName: "envelope.fill")
        .foregroundColor(.black)
      TextField("", text: $eml6tQ1nETAWp0FkI, prompt: Text("Email address").foregroundColor(.gray))
        .font(.custom("Hanchansans-Medium", size: 16))
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .foregroundColor(.black)
        .submitLabel(.done)
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(.white)
  }

  private var pdQRpDLzcTG2h36I: some View {
    HStack {
      Image(systemName: "key.fill")
        .foregroundColor(.black)
        .font(.system(size: 18))
        .padding(.leading, 5)
      Group {
        if spZhYfPvlZOqQBu1 {
          TextField(
            "", text: $pd9RSH79ektpsEoG, prompt: Text(pph0Ke7rn1sBopB7N).foregroundColor(.gray)
          )
          .submitLabel(.done)
        } else {
          SecureField(
            "", text: $pd9RSH79ektpsEoG, prompt: Text(pph0Ke7rn1sBopB7N).foregroundColor(.gray)
          )
          .submitLabel(.done)
        }
      }
      .foregroundColor(.black)
      .font(.custom("Hanchansans-Medium", size: 16))
      .padding(.leading, 4)

      Button {
        spZhYfPvlZOqQBu1.toggle()
      } label: {
        Image(spZhYfPvlZOqQBu1 ? "lxetxabjvlyj_kai" : "lxetxabjvlyj_guan")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(.white)
  }

  private var cfpq8zNVf5l3Pldnz: some View {
    HStack {
      Image(systemName: "key.fill")
        .foregroundColor(.black)
        .font(.system(size: 18))
        .padding(.leading, 5)
      Group {
        if sfuMz9lYqA4iornc {
          TextField(
            "", text: $cfNWHj7W1x4NVeTf,
            prompt: Text(cfpfZOpeLbzqNYiMf).foregroundColor(.gray)
          )
          .submitLabel(.done)
        } else {
          SecureField(
            "", text: $cfNWHj7W1x4NVeTf,
            prompt: Text(cfpfZOpeLbzqNYiMf).foregroundColor(.gray)
          )
          .submitLabel(.done)
        }
      }
      .foregroundColor(.black)
      .font(.custom("Hanchansans-Medium", size: 16))
      .padding(.leading, 5)

      Button {
        sfuMz9lYqA4iornc.toggle()
      } label: {
        Image(sfuMz9lYqA4iornc ? "lxetxabjvlyj_kai" : "lxetxabjvlyj_guan")
          .resizable()
          .scaledToFit()
          .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 16)
    .background(.white)
  }

  private var txtpZxZwN7RfZ0b4T: String {
    switch mode {
    case .locGG0oWaNjmDMcq:
      return "Welcome!"
    case .supFE4eYtk9APWyCf:
      return "Sign up"
    case .fgt881tEnmrdjQaCw:
      return "Forget password"
    }
  }

  private var pbt73LRh20fD43HjB: String {
    switch mode {
    case .locGG0oWaNjmDMcq:
      return "Login"
    case .supFE4eYtk9APWyCf:
      return "Sign up"
    case .fgt881tEnmrdjQaCw:
      return "Save"
    }
  }

  private var pph0Ke7rn1sBopB7N: String {
    switch mode {
    case .locGG0oWaNjmDMcq, .supFE4eYtk9APWyCf:
      return "Password"
    case .fgt881tEnmrdjQaCw:
      return "New password"
    }
  }

  private var cfpfZOpeLbzqNYiMf: String {
    switch mode {
    case .supFE4eYtk9APWyCf:
      return "Password"
    case .fgt881tEnmrdjQaCw:
      return "Confirm password"
    case .locGG0oWaNjmDMcq:
      return ""
    }
  }

  private var sfRjoCzNnnBakwca: Bool {
    switch mode {
    case .locGG0oWaNjmDMcq:
      return false
    case .supFE4eYtk9APWyCf, .fgt881tEnmrdjQaCw:
      return true
    }
  }

  private var csbmigFrwwb9Ijcqw: Bool {
    let OZCvxNKMxCLZhh = eml6tQ1nETAWp0FkI.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !OZCvxNKMxCLZhh.isEmpty else { return false }
    switch mode {
    case .locGG0oWaNjmDMcq:
      return !pd9RSH79ektpsEoG.isEmpty
    case .supFE4eYtk9APWyCf, .fgt881tEnmrdjQaCw:
      return !pd9RSH79ektpsEoG.isEmpty && !cfNWHj7W1x4NVeTf.isEmpty
    }
  }

  private func subi8lomF1GqsBAAf() {
    er9FEPx028SNParU = nil
    let OZCvxNKMxCLZhh = eml6tQ1nETAWp0FkI.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !OZCvxNKMxCLZhh.isEmpty else { return }

    switch mode {
    case .locGG0oWaNjmDMcq:
      do {
        try XhMd8CtuFVVV7E.denloginF3jsApBVSAQGZU(
          FkjlDAvGK5B6KO: OZCvxNKMxCLZhh, PQ60pPWNJ0DEn5: pd9RSH79ektpsEoG)
        dismiss()
      } catch {
        er9FEPx028SNParU =
          (error as? MelystoreWpvugHy89HDWLR.AuErizHqrtotvfHu1g)?.errorDescription
          ?? "Login failed, please try again later."
      }

    case .supFE4eYtk9APWyCf:
      guard pd9RSH79ektpsEoG == cfNWHj7W1x4NVeTf else {
        er9FEPx028SNParU = "The two passwords entered do not match."
        return
      }
      do {
        try XhMd8CtuFVVV7E.signunSdjEjqbNc2QU7(
          K4VbtUDRr8jBB7: OZCvxNKMxCLZhh, p4NifCezx0jbi95: pd9RSH79ektpsEoG)
        dismiss()
      } catch {
        er9FEPx028SNParU =
          (error as? MelystoreWpvugHy89HDWLR.AuErizHqrtotvfHu1g)?.errorDescription
          ?? "Registration failed, please try again later."
      }

    case .fgt881tEnmrdjQaCw:
      guard pd9RSH79ektpsEoG == cfNWHj7W1x4NVeTf else {
        er9FEPx028SNParU = "The two passwords entered do not match."
        return
      }
      do {
        try XhMd8CtuFVVV7E.reFk5zPOYd1fAtqS(
          Yi8WCvaaatLQJt: OZCvxNKMxCLZhh, r8SqGvRFSDz2WU: pd9RSH79ektpsEoG)
        dismiss()
      } catch {
        er9FEPx028SNParU =
          (error as? MelystoreWpvugHy89HDWLR.AuErizHqrtotvfHu1g)?.errorDescription
          ?? "Password reset failed, please try again later."
      }
    }
  }
}
