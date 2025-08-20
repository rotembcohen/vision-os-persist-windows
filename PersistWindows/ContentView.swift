//
//  ContentView.swift
//  PersistWindows
//
//  Created by Rotem Cohen on 8/19/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    @State var text: String = ""
    var body: some View {
        VStack (alignment: .center) {
            TextField("Enter Title", text: $text)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
            Button {
                openWindow(id:"MyWindow", value: text)
            } label: {
                Text("Open Window")
            }
        }
        .padding()
    }
}
