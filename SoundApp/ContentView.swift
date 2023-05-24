//
//  ContentView.swift
//  SoundApp
//
//  Created by Lander Wells on 5/22/23.
//

import SwiftUI
import Cocoa


struct ContentView: View {
    @State var volume: Double = 50
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, I am typing this message")
            Slider(value: $volume, in: 0...100)
        } .padding()
        
        Button(action: {
            openSystemSettings()
        }) {
            Text("Open System Settings")
        }
        
    }
    
    private func openSystemSettings() {
            let workspace = NSWorkspace.shared
            let url = URL(string: "x-apple.systempreferences:com.apple.preference.sound")!
            workspace.open(url)
        }
}
