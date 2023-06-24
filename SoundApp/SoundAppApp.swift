//
//  SoundAppApp.swift
//
//  SoundApp
//  Created by Lander Wells on 5/22/23.
//

import SwiftUI
import Combine

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
    
    //@StateObject private var volumeManager = VolumeManager.shared // Create an instance of VolumeManager
    @ObservedObject private var volumeManager = VolumeManager.shared // Create an instance of VolumeManager

    
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    var volumeObserver: AnyCancellable? // Observer for volume changes

    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        updateSymbolImage()
        
        //statusBarItem.button?.image = NSImage(systemSymbolName: "speaker.wave.3.fill", accessibilityDescription: nil)
        
        statusBarItem.button?.imagePosition = .imageLeading

        statusBarItem.menu = menu.createMenu()
    }
    
    public func updateSymbolImage() {
        let symbolName: String
        
        print(volumeManager.volume)
        
        if (0.000 == volumeManager.volume) {symbolName = "speaker.slash.fill"}
        else if (0.333 >= volumeManager.volume) {symbolName = "speaker.wave.1.fill"}
        else if (0.666 >= volumeManager.volume) {symbolName = "speaker.wave.2.fill"}
        else {symbolName = "speaker.wave.3.fill"}
        
        statusBarItem.button?.image = NSImage(systemSymbolName: symbolName, accessibilityDescription: nil)
    }
}
