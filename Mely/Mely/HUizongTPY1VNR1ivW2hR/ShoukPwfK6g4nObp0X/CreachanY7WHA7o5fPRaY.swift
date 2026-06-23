//
//  CreachanY7WHA7o5fPRaY.swift
//  Mely
//
//  Created by MELY on 2026/3/6.
//

import SwiftUI

struct CreachanY7WHA7o5fPRaY: View {
  @EnvironmentObject private var jqhpcZcZAlcAaD: MelystoreWpvugHy89HDWLR

  #if DEBUG
    @ObserveInjection var redraw
  #endif

  @Environment(\.dismiss) private var dismiss

  @State private var txtrl66anuqACJ0An: String = ""
  @State private var rulet1ykLXwK0ei7MM: String = ""
  @State private var hasBxiL6C7Eate9EmCover: Bool = false
  @State private var selectedCoverImage: UIImage?
  @State private var pVLts0oj3NbCHo: Bool = false
  @State private var ipics4kOt5TLVCAbZ8: Bool = false

  private let ruleLimit: Int = 50

  var body: some View {
    CreatejLlpeiC5nAUAvPScaffold(
      title: "Post",
      primaryButtonTitle: "Create",
      onBack: { dismiss.callAsFunction() },
      onPrimaryTap: precreCFwcUZXv5XUjex,
      buttonBottomPadding: 20
    ) {
      VStack(spacing: 30) {
        coverS14sugISc1q8wx4
        t2yMJZV0etfrzqn
        ibVtu9eJRLclx2
      }
      .padding(.horizontal, 20)
      .padding(.top, 24)
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
    .toolbar {
      ToolbarItemGroup(placement: .keyboard) {
        Spacer()
        Button("Done") {
          UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .font(.custom("Hanchansans-Medium", size: 16))
        .foregroundColor(.blue)
      }
    }
    .imageSourcePicker(isPresented: $ipics4kOt5TLVCAbZ8) { image in
      selectedCoverImage = image
      hasBxiL6C7Eate9EmCover = true
    }
    #if DEBUG
      .enableInjection()
    #endif
  }

  private var coverS14sugISc1q8wx4: some View {
    VStack(spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
          .fill(Color(red: 46 / 255, green: 53 / 255, blue: 71 / 255))
          .stroke(Color.white.opacity(0.25), lineWidth: 2)
          .frame(height: 180)
          .padding(.horizontal, 16)
          .clipped()

        if let s4Y8z3TkfBV0ah = selectedCoverImage {
          Image(uiImage: s4Y8z3TkfBV0ah)
            .resizable()
            .scaledToFill()
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.horizontal, 16)
        } else {
          Image("gfqjfrzfemtladd")
            .resizable()
            .frame(width: 52, height: 52)
        }
      }
      .onTapGesture {
        ipics4kOt5TLVCAbZ8 = true
      }

      Text("Cover  (\(hasBxiL6C7Eate9EmCover ? 1 : 0)/1)")
        .font(.custom("Hanchansans-Medium", size: 18))
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
  }

  private var t2yMJZV0etfrzqn: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 10) {
        Text("Challenge Theme")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      TextField(
        "",
        text: $txtrl66anuqACJ0An,
        prompt: Text("Please enter").foregroundColor(Color(white: 0.7))
      )
      .font(.custom("Hanchansans-Medium", size: 16))
      .foregroundColor(.black)
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color.white)
      )
    }
  }

  private var ibVtu9eJRLclx2: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 10) {
        Text("Rule")
          .font(.custom("Hanchansans-Medium", size: 22))
          .foregroundColor(.white)
        Image("eaynmjbwgatf_star")
          .resizable()
          .frame(width: 24, height: 24)
      }

      ZStack(alignment: .topLeading) {
        TextEditor(text: $rulet1ykLXwK0ei7MM)
          .font(.custom("Hanchansans-Medium", size: 16))
          .foregroundColor(.black)
          .padding(.horizontal, 12)
          .padding(.vertical, 8)
          .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .fill(Color.white)
          )

        if rulet1ykLXwK0ei7MM.isEmpty {
          Text("Please enter")
            .font(.custom("Hanchansans-Medium", size: 16))
            .foregroundColor(Color(white: 0.7))
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }

        VStack {
          Spacer()
          HStack {
            Spacer()
            Text("\(rulet1ykLXwK0ei7MM.count)/\(ruleLimit)")
              .font(.caption)
              .foregroundColor(.black)
          }
          .padding(10)
        }

      }
      .frame(height: 140)

    }
  }

  private var canCreate: Bool {
    selectedCoverImage != nil
      && !txtrl66anuqACJ0An.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      && !rulet1ykLXwK0ei7MM.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  private var ruleLimited: Binding<String> {
    Binding(
      get: { rulet1ykLXwK0ei7MM },
      set: { Z49GskIdWVr6kY in
        if Z49GskIdWVr6kY.count <= ruleLimit {
          rulet1ykLXwK0ei7MM = Z49GskIdWVr6kY
        } else {
          rulet1ykLXwK0ei7MM = String(Z49GskIdWVr6kY.prefix(ruleLimit))
        }
      }
    )
  }

  private func precreCFwcUZXv5XUjex() {
    guard canCreate, !pVLts0oj3NbCHo else { return }
    pVLts0oj3NbCHo = true

    var YI8yIA6nhB3bor: String? = nil
    if let RDfLO3LxCglFHR = selectedCoverImage,
      let path = ImgstorehR7h57Xdriq7hH.sachalb07MaCxHrhsdB(RDfLO3LxCglFHR)
    {
      YI8yIA6nhB3bor = path
    }
    jqhpcZcZAlcAaD.adchaG3G6yAAgJ7cUJE(
      gzUGAsAiYTc7Dv: txtrl66anuqACJ0An, rule: rulet1ykLXwK0ei7MM, covHMcwQvUcHm3NmI: YI8yIA6nhB3bor)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      pVLts0oj3NbCHo = false
      dismiss()
    }
  }
}
