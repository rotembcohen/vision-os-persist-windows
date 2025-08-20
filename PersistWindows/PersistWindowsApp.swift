//
//  PersistWindowsApp.swift
//  PersistWindows
//
//  Created by Rotem Cohen on 8/19/25.
//

import SwiftUI

@main
struct PersistWindowsApp: App {

    @StateObject private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appModel)
                .onAppear {
                    // Restore windows after appModel is initialized
                    DispatchQueue.main.async {
                        for text in appModel.openWindows {
                            if !text.isEmpty {
                                // Use NotificationCenter to trigger window opening
                                NotificationCenter.default.post(name: .restoreWindow, object: text)
                            }
                        }
                    }
                }
        }

        WindowGroup(id: "MyWindow", for: String.self) { $text in
            if let text = text {
                MyWindowView(text: text)
            } else {
                MyWindowView(text: "Unknown")
            }
        }
    }
}

extension Notification.Name {
    static let restoreWindow = Notification.Name("restoreWindow")
}
