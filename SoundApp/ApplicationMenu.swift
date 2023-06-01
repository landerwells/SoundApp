//
//  ApplicationMenu.swift
//  SoundApp
//
//  Created by Lander Wells on 5/31/23.
//

import Foundation
import SwiftUI

class ApplicationMenu: NSObject {
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        let soundView = SoundView()
        let topView = NSHostingController(rootView: soundView)
        topView.view.frame.size = CGSize(width: 225, height: 225)
        
        let customMenuItem = NSMenuItem()
        customMenuItem.view = topView.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        return menu
    }
    
    
}
