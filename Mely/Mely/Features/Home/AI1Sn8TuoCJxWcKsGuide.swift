//
//  AI1Sn8TuoCJxWcKsGuide.swift
//  Mely
//
//

import SwiftUI

struct AI1Sn8TuoCJxWcKsGuide: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var a3u069RLQywrsrH: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss
  @State private var wihIsHiYjmlGqC = false

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  private let aigSvtv3naRZJUD82 = Color(hex: "#CBED40")
  private let aipNReqTSV9stRlWm = Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255)
  private let dargCpl7rkOeeh7GGM = LinearGradient(
    colors: [
      Color(red: 0.15, green: 0.18, blue: 0.35),
      Color(red: 0.08, green: 0.10, blue: 0.20),
    ],
    startPoint: .top,
    endPoint: .bottom
  )

  var body: some View {
    MelyYemianScaffold(
      alignment: .top,
      background: {
        Image("nmhenaqqihcs")
          .resizable()
          .ignoresSafeArea()
      }
    ) {
      VStack(spacing: 0) {
        tsIK8z1DQcXGamTV
        Spacer(minLength: 20)
        itsmHYhAE1karZHrr
        Spacer(minLength: 24)
        cbdBsipwGdSyTEWU
      }
      .padding(.bottom, 34)

      tp72CZkpi7Z61X3N
    }
    .toolbar(.hidden, for: .navigationBar)
    .overlay {
      if wihIsHiYjmlGqC {
        MelyAlertDialog(
          isPresented: $wihIsHiYjmlGqC,
          text: "Sorry, your wallet balance is insufficient. Do you want to go for recharge?",
          iconName: "kuku3kywiTUzOpQ1",
          iconSize: 52,
          btnText: "Confirm",
          onConfirm: { path.append(.wallet) }
        )
      }
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var tp72CZkpi7Z61X3N: some View {
    HStack(alignment: .top, spacing: 0) {
      Button {
        dismiss.callAsFunction()
      } label: {
        Image(systemName: "chevron.left")
          .font(.system(size: 18))
          .foregroundColor(.black)
          .frame(width: 44, height: 44)
          .background(Circle().fill(Color.white))
      }

      Spacer()
    }
    .padding(.horizontal, 20)
  }

  private var tsIK8z1DQcXGamTV: some View {
    ZStack(alignment: .top) {
      HStack(alignment: .center, spacing: 0) {
        VStack(alignment: .leading, spacing: 4) {
          Text("Fitness Dance")
            .font(.custom("Hanchansans-Medium", size: 30))
            .foregroundColor(.black)
            .tracking(-0.6)
          Text("Q&A AI")
            .font(.custom("Hanchansans-Medium", size: 30))
            .foregroundColor(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
            .shadow(color: Color.white.opacity(0.28), radius: 4, x: 0, y: 2)
        }
        .padding(.top, 15)

        Spacer()

      }
      .background(
        Image("wangshange")
          .resizable()
          .scaledToFill()
          .padding(.horizontal, 18)
          .frame(width: UIScreen.main.bounds.width, height: 100)
          .padding(.top, 26)
      )
      .padding(.horizontal, 20)
      .padding(.top, 90)

      HStack(alignment: .top) {
        Spacer()

        Image("hitubiaoyun")
          .resizable()
          .scaledToFit()
          .frame(width: 65, height: 65)

        Image("dayanjiqiren")
          .resizable()
          .scaledToFit()
          .frame(width: 120, height: 120)
          .clipShape(Circle())
      }
      .padding(.trailing, 20)
      .padding(.top, 10)
    }
  }

  private var itsmHYhAE1karZHrr: some View {
    VStack(spacing: 18) {
      HStack(spacing: 0) {
        Spacer()

        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)
      }

      Text(
        "I can give you dance tips, help you develop a fitness dance plan, or chat with you about interesting things in dance. Whether you are a beginner or an expert, I am here to accompany you to improve and inspire you to challenge yourself. Tell me what you need and let's dance together! 🎶💪"
      )
      .font(.system(size: 17, weight: .medium))
      .foregroundColor(.white)
      .multilineTextAlignment(.leading)
      .lineSpacing(22)

      HStack(spacing: 0) {
        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)

        Spacer()
      }
      .padding(.top, 6)
    }
    .padding(.horizontal, 24)
  }

  private var cbdBsipwGdSyTEWU: some View {
    Button {
      staitwAzqTicUYdevN()
    } label: {
      HStack(spacing: 8) {
        Image("mkirgxytewig_diamond")
          .resizable()
          .scaledToFit()
          .frame(width: 28, height: 28)
        Text("-300")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
        Text("Chat")
          .font(.custom("Hanchansans-Medium", size: 20))
          .foregroundColor(.black)
          .padding(.leading, 6)
      }
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        Capsule()
          .fill(aigSvtv3naRZJUD82)
      )
    }
    .buttonStyle(.plain)
    .frame(width: 260, height: 50)
  }

  private func staitwAzqTicUYdevN() {
    let wKxtRYd25bUiHx = a3u069RLQywrsrH.curp11O3LYjA9ooct?.uDg2Jy5Wx ?? 0
    if wKxtRYd25bUiHx < 300 {
      wihIsHiYjmlGqC = true
      return
    }
    guard a3u069RLQywrsrH.deductDiamonds(300) else { return }
    path.append(.aiChat)
  }
}
