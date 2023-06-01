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


struct SoundView: View {
    
    @State var volume: Double = 0.50
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("**Sound**")
                
            }
            Slider(value: $volume, in: 0...1.0, step: 0.01)
            
            Button(action: {
                openSystemSettings()
            }) {
                Text("Sound Settings...")
            }
            
            
        } .frame(width: 225).padding()
        
            .onChange(of: volume) { newValue in
                setSystemVolume(volume: Float(newValue))
            }
        
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
