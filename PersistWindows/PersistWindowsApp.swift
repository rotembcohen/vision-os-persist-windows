//
//  PersistWindowsApp.swift
//  PersistWindows
//
//  Created by Rotem Cohen on 8/19/25.
//

import SwiftUI

@main
struct PersistWindowsApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
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
