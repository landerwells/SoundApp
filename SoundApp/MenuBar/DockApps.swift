//
//  DockApps.swift
//  SoundApp
//
//  Created by Lander Wells on 6/9/23.
//

import Foundation
import Cocoa

let workspace = NSWorkspace.shared
var apps = workspace.runningApplications.filter{  $0.activationPolicy == .regular }
var appsArray: [String] = []

func dockApps() {
    appsArray.removeAll()
    for app in apps {
        //print("Bundle Identifier: \(app.bundleIdentifier ?? "")")
        //print("Process Identifier: \(app.processIdentifier)")
        appsArray.append("\(app.localizedName ?? "")")
        print("\(app.localizedName ?? "")")
        //print("Executable URL: \(app.executableURL?.path ?? "")")
        //print("----")
    }
}
