//
//  ContentView.swift
//  SoundApp
//
//  Created by Lander Wells on 5/22/23.
//

import SwiftUI
import Cocoa
import AppKit
import AudioToolbox
import MediaPlayer


struct SoundView: View {
    
    @State var volume: Double = 0.50
    @State private var showMenu = false

    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("**Sound**")
                Text(appsArray.joined(separator: "\n"))
            }
            
            Slider(value: $volume, in: 0...1.0)
                .frame(width: 200)
                .accentColor(.white)

            Text("\(Int(volume * 100))%")
            
            
            Button(action: {
                            showMenu.toggle()
                        }) {
                            Text("Additional Options...")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        
                        if showMenu {
                            Menu {
                                ForEach(apps, id: \.self) { app in
                                    Text("\(app)")
                                }
                            } label: {
                                EmptyView()
                            }
                            .menuStyle(BorderlessButtonMenuStyle())
                        }
            
            
            
            
            
            Divider()
            
            
            Button(action: {
                openSystemSettings()
                dockApps()
            }) {
                Text("Sound Settings...")
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderlessButtonStyle())

            
        }
            .frame(width: 250)
            .onChange(of: volume) { newValue in
                setSystemVolume(volume: Float(newValue))
            }
            .padding(15)
        
    }
    
    private func openSystemSettings() {
            let workspace = NSWorkspace.shared
            let url = URL(string: "x-apple.systempreferences:com.apple.preference.sound")!
        workspace.open(url)
    }
    
}


struct SoundView_Previews: PreviewProvider {
    static var previews: some View {
        SoundView()
    }
}


func setSystemVolume(volume: Float) {
    var deviceId = AudioObjectID(kAudioObjectUnknown)
    var dataSize = UInt32(MemoryLayout<AudioObjectID>.size)
    
    // Get the device ID of the system output device
    var propertyAddress = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDefaultOutputDevice,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )
    AudioObjectGetPropertyData(
        AudioObjectID(kAudioObjectSystemObject),
        &propertyAddress,
        0,
        nil,
        &dataSize,
        &deviceId
    )
    
    // Set the volume for the system output device
    propertyAddress.mSelector = kAudioHardwareServiceDeviceProperty_VirtualMainVolume
    propertyAddress.mScope = kAudioDevicePropertyScopeOutput
    var targetVolume = volume
    AudioObjectSetPropertyData(
        deviceId,
        &propertyAddress,
        0,
        nil,
        UInt32(MemoryLayout<Float32>.size),
        &targetVolume
    )
}
