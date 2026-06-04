//
//  SharedModelContainer.swift
//  MessagingUIDevelopment
//

import SwiftData

@available(iOS 17, *)
enum SharedModelContainer {
  static let shared: ModelContainer = {
    let schema = Schema([Memo.self, ChatMessageModel.self])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()
}
