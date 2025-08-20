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
    @EnvironmentObject var appModel: AppModel
    @State var text: String = ""
    var body: some View {
        VStack (alignment: .center) {
            TextField("Enter Title", text: $text)
                .textFieldStyle(.roundedBorder)
                .frame(width:300)
            Button {
                openWindow(id:"MyWindow", value: text)
                if !text.isEmpty && !appModel.openWindows.contains(text) {
                    appModel.openWindows.append(text)
                }
            } label: {
                Text("Open Window")
            }
        }
        .padding()
        .onAppear {
            NotificationCenter.default.addObserver(forName: .restoreWindow, object: nil, queue: .main) { notification in
                if let text = notification.object as? String {
                    openWindow(id: "MyWindow", value: text)
                }
            }
        }
        .onChange(of: appModel.openWindows) { 
            appModel.saveOpenWindows()
        }
    }
}
