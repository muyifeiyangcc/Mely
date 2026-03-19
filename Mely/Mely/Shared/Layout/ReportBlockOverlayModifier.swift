//
//  RepboModfiRKcX6DtMw2MFei.swift
//  Mely
//
//

import SwiftUI

struct RepboModfiRKcX6DtMw2MFei: ViewModifier {
  @Binding var isbloCY4jaarVfF0wpY: Bool
  @Binding var isrepppE4EmwOSEs9Cl: Bool
  var onOXhiQzKCNvCvG4Block: () -> Void
  var onReportSubmit: (ReportReason, String) -> Void
  var onCancel: (() -> Void)?

  func body(content: Content) -> some View {
    content
      .overlay {
        if isbloCY4jaarVfF0wpY {
          MelyReportBlockSheet(
            isPresented: $isbloCY4jaarVfF0wpY,
            onReport: {
              isbloCY4jaarVfF0wpY = false
              isrepppE4EmwOSEs9Cl = true
            },
            onOXhiQzKCNvCvG4Block: onOXhiQzKCNvCvG4Block,
            onCancel: onCancel
          )
        }
      }
      .overlay {
        if isrepppE4EmwOSEs9Cl {
          MelyReportSheet(
            isPresented: $isrepppE4EmwOSEs9Cl,
            onSubmit: onReportSubmit,
            onCancel: onCancel
          )
        }
      }
  }
}

extension View {
  func blorepEJWPcVqZsNi6EP(
    isbloCY4jaarVfF0wpY: Binding<Bool>,
    isrepppE4EmwOSEs9Cl: Binding<Bool>,
    onOXhiQzKCNvCvG4Block: @escaping () -> Void,
    onReportSubmit: @escaping (ReportReason, String) -> Void,
    onCancel: (() -> Void)? = nil
  ) -> some View {
    modifier(
      RepboModfiRKcX6DtMw2MFei(
        isbloCY4jaarVfF0wpY: isbloCY4jaarVfF0wpY,
        isrepppE4EmwOSEs9Cl: isrepppE4EmwOSEs9Cl,
        onOXhiQzKCNvCvG4Block: onOXhiQzKCNvCvG4Block,
        onReportSubmit: onReportSubmit,
        onCancel: onCancel
      ))
  }
}
