//
//  DockApps.swift
//  SoundApp
//
//  Created by Lander Wells on 6/9/23.
//

import Foundation
import Cocoa

let workspace = NSWorkspace.shared
let apps = workspace.runningApplications.filter{  $0.activationPolicy == .regular }
var appsArray: [String] = []

func dockApps() {
    for app in apps {
        //print("Bundle Identifier: \(app.bundleIdentifier ?? "")")
        //print("Process Identifier: \(app.processIdentifier)")
        appsArray.append("\(app.localizedName ?? "")")
        print("\(app.localizedName ?? "")")
        //print("Executable URL: \(app.executableURL?.path ?? "")")
        //print("----")
    }
}
