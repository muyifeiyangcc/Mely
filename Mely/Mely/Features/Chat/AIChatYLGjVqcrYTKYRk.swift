//
//  AIChatYLGjVqcrYTKYRk.swift
//  Mely
//
//

import SwiftUI

private struct AICtAhqMigsf3g8DWx: Identifiable, Equatable {
  let id: String
  let txtUi0OX2rjeesXjh: String
  let isFromUser: Bool
  let createdAt: Date

  static func user(_ text: String) -> AICtAhqMigsf3g8DWx {
    AICtAhqMigsf3g8DWx(
      id: UUID().uuidString, txtUi0OX2rjeesXjh: text, isFromUser: true, createdAt: Date())
  }

  static func ai(_ text: String) -> AICtAhqMigsf3g8DWx {
    AICtAhqMigsf3g8DWx(
      id: UUID().uuidString, txtUi0OX2rjeesXjh: text, isFromUser: false, createdAt: Date())
  }
}

private let sugCkQag01rS7yut4: [[String]] = [
  [
    "What should I warm up before dancing?",
    "How can I improve my fitness dance?",
    "Can you suggest a routine for beginners?",
  ],
  [
    "What are the best stretches for dancers?",
    "How often should I practice fitness dance?",
    "Tips for avoiding injury while dancing?",
  ],
  [
    "How to build stamina for long dance sessions?",
    "What music is good for fitness dance?",
    "How to cool down after a dance workout?",
  ],
]

private let rGssTimIrJBy8j =
  "Let's start our conversation now~ Please feel free to ask questions, and I will do my best to meet your needs."

private func replyV8z4BQ1ojqP3uu(for userText: String) -> String {
  let cmcFlJh2j8GB5l = [
    "Great question! For fitness dance, I recommend starting with 5–10 minutes of light cardio and dynamic stretches to get your body ready. Focus on your legs, hips, and arms. 🎶",
    "I'd be happy to help! Consistency is key—try to practice at least 3 times a week. Start with beginner routines and gradually increase intensity. You've got this! 💪",
    "Sure! A simple beginner routine could be: warm-up (5 min), basic steps (10 min), combination (10 min), cool-down (5 min). Adjust based on how you feel.",
    "That's a wonderful goal! Remember to listen to your body, stay hydrated, and have fun. Dance is not just exercise—it's expression! 🌟",
    "I'm here to support your fitness dance journey. Keep asking and we can build a plan that works for you. Let's dance together!",
  ]
  return cmcFlJh2j8GB5l.randomElement() ?? cmcFlJh2j8GB5l[0]
}

struct AIChatYLGjVqcrYTKYRk: View {
  @Binding var path: [MainRoute]
  @EnvironmentObject private var llEQBTQxlR8ETD: MelystoreWpvugHy89HDWLR
  @Environment(\.dismiss) private var dismiss

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @State private var m1mbtVikRszkm8: String = ""
  @State private var wIemTBaAkSG2tk: [AICtAhqMigsf3g8DWx] = []
  @State private var sgidxmhN1RHfEFWdWeK: Int = 0
  @State private var reingXhmTrjlj4ECLpJ: Bool = false
  @State private var kbhoZrEZShh5SGQAV: CGFloat = 0

  private let aipJZGzDUbRJVGQyt = Color(hex: "#FF1AB6")
  private let aigjXDBLyv08QTlTm = Color(hex: "#CBED40")

  var body: some View {
    MelyYemianScaffold {
      VStack(spacing: 0) {
        eznJHgfhnjj2BC

        ScrollViewReader { proxy in
          ScrollView {
            VStack(alignment: .leading, spacing: 0) {
              sc68Eocplv85nA6q
              hYYSre1rjQ2DyR
                .padding(.top, 20)
                .padding(.bottom, 16)
              ForEach(wIemTBaAkSG2tk) { msg in
                cbubrzbfxVKfJfURoj(msg)
                  .id(msg.id)
                  .padding(.bottom, 16)
              }
              if reingXhmTrjlj4ECLpJ {
                Typingv5sMWzE8rxoCi7()
                  .id("typing")
                  .padding(.bottom, 16)
              }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
          }
          .onChange(of: wIemTBaAkSG2tk.count) { _, _ in
            scbwGIvujfkGBOig3(proxy: proxy)
          }
          .onChange(of: reingXhmTrjlj4ECLpJ) { _, v in
            if v { scbwGIvujfkGBOig3(proxy: proxy) }
          }
        }

        iptSpweot67qNq9bt
      }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification))
    { notification in
      guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
      else { return }
      withAnimation(.easeOut(duration: 0.25)) { kbhoZrEZShh5SGQAV = frame.height }
    }
    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
    { _ in
      withAnimation(.easeOut(duration: 0.25)) { kbhoZrEZShh5SGQAV = 0 }
    }
    .toolbar(.hidden, for: .navigationBar)
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var eznJHgfhnjj2BC: some View {
    HStack(alignment: .bottom) {
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
      HStack(spacing: 6) {
        Image("sanfenxing")
          .resizable()
          .scaledToFit()
          .frame(width: 78, height: 26)
      }
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 8)
  }

  private var sc68Eocplv85nA6q: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("You can ask me something like:")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(aipJZGzDUbRJVGQyt)

      ZStack(alignment: .top) {
        HStack {
          Image("dayanjiqiren")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(Circle())

          Spacer()

          Button {
            withAnimation(.easeInOut(duration: 0.2)) {
              sgidxmhN1RHfEFWdWeK = (sgidxmhN1RHfEFWdWeK + 1) % sugCkQag01rS7yut4.count
            }
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "arrow.clockwise")
                .font(.system(size: 14, weight: .semibold))
              Text("Swap it out")
                .font(.system(size: 14))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
              Capsule()
                .fill(aigjXDBLyv08QTlTm)
            )
          }
        }
        .padding(.leading, 31)
        .padding(.trailing, 10)

        VStack(alignment: .leading, spacing: 18) {
          ForEach(Array(JhZXyJgsIy90rJ.enumerated()), id: \.offset) { _, q in
            Button {
              sendjKMYg2kZp1LQE5(q)
            } label: {
              Text(q)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
                .padding(.vertical, 15)
                .background(
                  RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(hex: "#FFF7F7").opacity(0.13))
                )
            }
            .buttonStyle(.plain)
          }
        }
        .padding(.horizontal, 10)
        .padding(.top, 30)
        .padding(.bottom, 20)
        .background(
          Image("quejiaodejuxing")
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        )
        .padding(.top, 70)
      }
    }
    .padding(.horizontal, 16)
    .padding(.top, 16)
    .padding(.bottom, 20)
    .background(
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.white)
    )
  }

  private var JhZXyJgsIy90rJ: [String] {
    let bGetbXT1LVTZMm = sugCkQag01rS7yut4[sgidxmhN1RHfEFWdWeK]
    return Array(bGetbXT1LVTZMm.prefix(3))
  }

  private var hYYSre1rjQ2DyR: some View {
    HStack(alignment: .top, spacing: 0) {
      Text(rGssTimIrJBy8j)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          Color(aipJZGzDUbRJVGQyt)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: 0,
            bottomTrailingRadius: 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )
        .frame(maxWidth: .infinity, alignment: .leading)

      Spacer(minLength: 60)
    }
  }

  private func cbubrzbfxVKfJfURoj(_ M5ARlZhROxxstB: AICtAhqMigsf3g8DWx) -> some View {
    HStack(alignment: .top, spacing: 0) {
      if M5ARlZhROxxstB.isFromUser { Spacer(minLength: 48) }
      Text(M5ARlZhROxxstB.txtUi0OX2rjeesXjh)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(M5ARlZhROxxstB.isFromUser ? .black : .white)
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          Color(M5ARlZhROxxstB.isFromUser ? aigjXDBLyv08QTlTm : aipJZGzDUbRJVGQyt)
        )
        .clipShape(
          UnevenRoundedRectangle(
            topLeadingRadius: 12,
            bottomLeadingRadius: M5ARlZhROxxstB.isFromUser ? 12 : 0,
            bottomTrailingRadius: M5ARlZhROxxstB.isFromUser ? 0 : 12,
            topTrailingRadius: 12,
            style: .continuous
          )
        )
        .frame(
          maxWidth: UIScreen.main.bounds.width * 0.75,
          alignment: M5ARlZhROxxstB.isFromUser ? .trailing : .leading)
      if !M5ARlZhROxxstB.isFromUser { Spacer(minLength: 48) }
    }
    .frame(maxWidth: .infinity, alignment: M5ARlZhROxxstB.isFromUser ? .trailing : .leading)
  }

  private var iptSpweot67qNq9bt: some View {
    HStack(spacing: 12) {
      TextField(
        "",
        text: $m1mbtVikRszkm8,
        prompt: Text("Just ask me...")
          .foregroundColor(.gray)
      )
      .font(.system(size: 16))
      .foregroundColor(.white)
      .tint(.white)
      .padding(.horizontal, 16)
      .padding(.vertical, 15)
      .submitLabel(.done)
      .background(
        Capsule()
          .fill(Color(hex: "#182037"))
      )

      Button {
        sendjKMYg2kZp1LQE5(m1mbtVikRszkm8.trimmingCharacters(in: .whitespacesAndNewlines))
        m1mbtVikRszkm8 = ""
        UIApplication.shared.sendAction(
          #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      } label: {
        Image(systemName: "paperplane")
          .font(.system(size: 26))
          .foregroundColor(.white)
      }
      .disabled(m1mbtVikRszkm8.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
    }
    .padding(.horizontal, 16)
    .padding(.top, 12)
    .padding(.bottom, max(6, kbhoZrEZShh5SGQAV > 0 ? 0 : 0))
    .background(Color.black)
  }

  private func sendjKMYg2kZp1LQE5(_ waIlN02s9KyGk8: String) {
    guard !waIlN02s9KyGk8.isEmpty else { return }
    let userMsg = AICtAhqMigsf3g8DWx.user(waIlN02s9KyGk8)
    wIemTBaAkSG2tk.append(userMsg)
    reingXhmTrjlj4ECLpJ = true

    Task { @MainActor in
      let OMlkoyJndtJ87V = await AIService.shared.sendChat(message: waIlN02s9KyGk8)
      let VVUSQ5qQq5K3R7: String
      switch OMlkoyJndtJ87V {
      case .success(let aiText):
        VVUSQ5qQq5K3R7 = aiText
      case .failure:
        VVUSQ5qQq5K3R7 = replyV8z4BQ1ojqP3uu(for: waIlN02s9KyGk8)
      }
      let wGIvujfkGBOig3 = AICtAhqMigsf3g8DWx.ai(VVUSQ5qQq5K3R7)
      withAnimation(.easeOut(duration: 0.25)) {
        wIemTBaAkSG2tk.append(wGIvujfkGBOig3)
        reingXhmTrjlj4ECLpJ = false
      }
    }
  }

  private func scbwGIvujfkGBOig3(proxy: ScrollViewProxy) {
    withAnimation(.easeOut(duration: 0.2)) {
      if reingXhmTrjlj4ECLpJ {
        proxy.scrollTo("typing", anchor: .bottom)
      } else if let last = wIemTBaAkSG2tk.last {
        proxy.scrollTo(last.id, anchor: .bottom)
      }
    }
  }
}

private struct Typingv5sMWzE8rxoCi7: View {
  var body: some View {
    TimelineView(.periodic(from: .now, by: 0.4)) { context in
      let kOvPu4K0psg47j = context.date.timeIntervalSinceReferenceDate
      let d7b1nbJ4UXVdPok = Int(kOvPu4K0psg47j / 0.4) % 3
      HStack(alignment: .top, spacing: 0) {
        HStack(spacing: 4) {
          ForEach(0..<3, id: \.self) { i in
            Circle()
              .fill(Color.white.opacity(0.9))
              .frame(width: 6, height: 6)
              .opacity(i <= d7b1nbJ4UXVdPok ? 1 : 0.4)
          }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Color(red: 255 / 255, green: 26 / 255, blue: 182 / 255))
        )
        Spacer(minLength: 48)
      }
    }
  }
}
