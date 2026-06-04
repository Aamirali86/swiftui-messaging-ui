//
//  ContentView.swift
//  MessagingUIDevelopment
//
//  Created by Hiroshi Kimura on 2025/10/27.
//

import SwiftUI

enum DemoDestination: Hashable {
  case tiledView
  case tiledViewLoadingIndicator
  case tiledViewTypingIndicator
  case tiledViewHeaderContent
}

struct ContentView: View {

  @Namespace private var namespace

  var body: some View {
    NavigationStack {
      List {
        NavigationLink(value: DemoDestination.tiledView) {
          Label {
            VStack(alignment: .leading) {
              Text("TiledView")
              Text("UICollectionView based")
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          } icon: {
            Image(systemName: "square.grid.2x2")
          }
        }

        NavigationLink(value: DemoDestination.tiledViewLoadingIndicator) {
          Label {
            VStack(alignment: .leading) {
              Text("Loading Indicators")
              Text("Header/Footer loading spinners")
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          } icon: {
            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
          }
        }

        NavigationLink(value: DemoDestination.tiledViewTypingIndicator) {
          Label {
            VStack(alignment: .leading) {
              Text("Typing Indicator")
              Text("Show typing status at bottom")
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          } icon: {
            Image(systemName: "ellipsis.bubble")
          }
        }

        NavigationLink(value: DemoDestination.tiledViewHeaderContent) {
          Label {
            VStack(alignment: .leading) {
              Text("Header Content")
              Text("Static header above messages")
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          } icon: {
            Image(systemName: "text.badge.star")
          }
        }
      }
      .navigationTitle("MessagingUI")
      .navigationDestination(for: DemoDestination.self) { destination in
        switch destination {
        case .tiledView:
          BookTiledView(namespace: namespace)
        case .tiledViewLoadingIndicator:
          BookTiledViewLoadingIndicator()
            .navigationBarTitleDisplayMode(.inline)
        case .tiledViewTypingIndicator:
          BookTiledViewTypingIndicator()
            .navigationBarTitleDisplayMode(.inline)
        case .tiledViewHeaderContent:
          BookTiledViewHeaderContent()
            .navigationBarTitleDisplayMode(.inline)
        }
      }
      .navigationDestination(for: ChatMessage.self) { message in
        if #available(iOS 18.0, *) {
          Text("Detail View for Message ID: \(message.id)")
            .navigationTransition(.zoom(sourceID: message.id, in: namespace))
        } else {
          Text("Detail View for Message ID: \(message.id)")
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
