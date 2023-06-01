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
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.button?.image = NSImage(systemSymbolName: "speaker.wave.3.fill", accessibilityDescription: nil)
        statusBarItem.button?.imagePosition = .imageLeading
        statusBarItem.menu = menu.createMenu()
    }
}
