//
//  MessagingUIDevelopmentApp.swift
//  MessagingUIDevelopment
//
//  Created by Hiroshi Kimura on 2025/10/27.
//

import SwiftData
import SwiftUI

@main
struct MessagingUIDevelopmentApp: App {

  var body: some Scene {
    WindowGroup {
      RootContentView()
    }
  }
}

private struct RootContentView: View {
  var body: some View {
    if #available(iOS 17, *) {
      ContentView()
        .modelContainer(SharedModelContainer.shared)
    } else {
      ContentView()
    }
  }
}
