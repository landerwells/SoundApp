//
//  SoundAppApp.swift
//  SoundApp
//
//  Created by Lander Wells on 5/22/23.
//

import SwiftUI

@main
struct SoundAppApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
