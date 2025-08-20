//
//  AppModel.swift
//  PersistWindows
//
//  Created by Rotem Cohen on 8/19/25.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
class AppModel: ObservableObject {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed

    // Track open windows and their state (window texts)
    @Published var openWindows: [String] = []

    init() {
        loadOpenWindows()
    }

    func saveOpenWindows() {
        UserDefaults.standard.set(openWindows, forKey: "openWindows")
    }

    private func loadOpenWindows() {
        if let saved = UserDefaults.standard.stringArray(forKey: "openWindows") {
            openWindows = saved
        }
    }
}
