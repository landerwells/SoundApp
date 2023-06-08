//
//  PopoverView.swift
//  SoundApp
//
//  Created by Lander Wells on 5/24/23.
//

/*

import SwiftUI

struct PopoverView: View {
    
    @State var volume: Double = 50.00
    @State private var showGreeting = true
    
    var body: some View {
        
        
        Text("**Sound**").frame(maxWidth: .infinity, alignment: .leading)
        
        VStack {
            Slider(value: $volume, in: 0...100)
        } .padding()
        
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting).toggleStyle(SwitchToggleStyle(tint: .red))
            
            if showGreeting {
                Text("Hello World!")
            }
        }
            
        
        Divider()
        
        Button(action: {
            openSystemSettings()
        }) {
            Text("Sound Settings...")
        }
    }
    private func openSystemSettings() {
        let workspace = NSWorkspace.shared
        let url = URL(string: "x-apple.systempreferences:com.apple.preference.sound")!
        workspace.open(url)
    }
}

*/
