//
//  AppDelegate.swift
//  SoundApp
//
//  Created by Lander Wells on 5/24/23.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    static var popover = NSPopover()
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        Self.popover.contentViewController = NSHostingController(rootView: PopoverView())
        
        
        Self.popover.behavior = .transient
        
        statusBar = StatusBarController(Self.popover)
    }
    
    
}
