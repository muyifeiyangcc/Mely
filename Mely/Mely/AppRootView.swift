//
//  AppRootView.swift
//  Mely
//
//  Created by yangyang on 2026/3/5.
//

import SwiftUI

enum MainRoute: Hashable {
  case community
  case chat
  case profile
  case userProfile(userId: String)
  case settings
  case editProfile
  case communityPostCreate
  case communityPostDetail(postId: String)
  case challengeCreate
  case challengeDetail(challengeId: String)
  case uploadVideo(challengeId: String)
  case videoDetail(videoId: String)
  case wallet
  case aiGuide
  case aiChat
  case userList(UstzJWuwZtLDItVHl)
  case chatDetail(conversationId: String)
  case webProtocol(urlString: String, title: String)
}

struct AppRootView: View {
  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @StateObject private var appDataStore = MelystoreWpvugHy89HDWLR()
  @State private var path: [MainRoute] = []

  var body: some View {
    Group {
        if !appDataStore.izHqrtotvfHu1g.adHa2Yt5Jb {
        EULAmLsaSpDjzzZTqsView()
      } else if appDataStore.curp11O3LYjA9ooct == nil {
        LoginChoice4muHqmiYP6()
      } else {
        NavigationStack(path: $path) {
          MhoshoutosPR9GnzvOjHw(path: $path)
            .overlay(alignment: .bottom) {
              if path.isEmpty && appDataStore.S2E4yyK8CsIEumtoast {
                Text("Blocked successfully")
                  .font(.custom("Hanchansans-Medium", size: 15))
                  .foregroundColor(.black)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 12)
                  .background(Capsule().fill(Color(hex: "#CBED40")))
                  .padding(.bottom, 20)
                  .transition(.opacity.combined(with: .move(edge: .top)))
              }
            }
            .animation(.easeInOut(duration: 0.25), value: appDataStore.S2E4yyK8CsIEumtoast)
            .overlay(alignment: .bottomTrailing) {
              if path.isEmpty {
                FloatingPageSwitcher { target in
                  withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    path.append(target)
                  }
                }
                .padding()
              }
            }
            .navigationDestination(for: MainRoute.self) { route in
              switch route {
              case .community:
                CmntzhkG2J7gRwrRiEPo(path: $path)
              case .chat:
                Msg3ouu3bzLmqsqmr(path: $path)
              case .profile:
                Personouj3szwe9Ot9AX(path: $path)
              case .userProfile(let userId):
                Personouj3szwe9Ot9AX(path: $path, EoseNHMco4sgRUuid: userId)
              case .settings:
                Sets114ltB3Ta0kBrView(path: $path)
              case .editProfile:
                NFkh9JWFp64mW7Editpf(path: $path)
              case .communityPostCreate:
                Fapostr6rm5z92RxVRLB(path: $path)
              case .communityPostDetail(let postId):
                CmpodetQpyzEXwp4onYBY(path: $path, pid9gUnNcPrwJPjHW: postId)
              case .challengeCreate:
                CreachanY7WHA7o5fPRaY()
              case .challengeDetail(let challengeId):
                ChalldetNy2W04sqZPngXv(path: $path, chaidPpqAXLyzYjD1D7: challengeId)
              case .uploadVideo(let challengeId):
                UpdvdoS6ihyCxXzP8q3e(path: $path, chaidGv626ziV6BGf53: challengeId)
              case .videoDetail(let videoId):
                Vdet7QIifokraIERgO(path: $path, vidVPgbGqZoYamqMK: videoId)
              case .wallet:
                CoineCywyk67HOcjut()
              case .aiGuide:
                AI1Sn8TuoCJxWcKsGuide(path: $path)
              case .aiChat:
                AIChatYLGjVqcrYTKYRk(path: $path)
              case .userList(let listType):
                FilulistxLM01tqmx9RvFN(path: $path, lstyKEt8B9er18SA63: listType)
              case .chatDetail(let conversationId):
                ChadetliLsrfCbqFVharView(path: $path, ihcqcoxwUEDEh7cid: conversationId)
              case .webProtocol(let urlString, let title):
                WebProtocolView(urlString: urlString, title: title, path: $path)
              }
            }
        }
      }
    }
    .environmentObject(appDataStore)
    #if DEBUG
      .enableInjection()
    #endif
  }
}
