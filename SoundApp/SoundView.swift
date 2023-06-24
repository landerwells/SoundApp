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
import CoreAudio
//import MediaPlayer



struct SoundView: View {
    
    @StateObject private var volumeManager = VolumeManager.shared
    //@State public var volume: Double = 0.50
    @State private var showMenu = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("**Sound**")
            }
            
            Slider(value: $volumeManager.volume, in: 0.0...1.0)
                .frame(width: 200)
                .accentColor(.white)
            
            
            Text("\(Int(volumeManager.volume * 100))%")
            
            Button(action: {
                dockApps()
                withAnimation {
                    showMenu.toggle()
                }
            }) {
                Text("**Toggle Menu**")
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .buttonStyle(BorderlessButtonStyle())
            
            ScrollView {
                VStack {
                    if showMenu {
                        ForEach(appsArray, id: \.self) { app in
                            Text("\(app)")
                            Slider(value: $volumeManager.volume, in: 0...1.0)
                                .frame(width: 200)
                                .accentColor(.white)
                        }
                    }
                }
            }
            
            Divider()
            
            Button(action: {
                openSystemSettings()
            }) {
                Text("Sound Settings...")
                    .foregroundColor(.white)
            }
            .buttonStyle(BorderlessButtonStyle())
            Spacer() // Add spacer to push content to the top
        }
        
        .frame(width: 250)
        .onChange(of: volumeManager.volume) { newValue in
            setSystemVolume(volume: Float(newValue))
            AppDelegate.instance?.updateSymbolImage()
        }
        .padding(15)
        .alignmentGuide(.top) { _ in 0 } // Align the VStack with the top
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


