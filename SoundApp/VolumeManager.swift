//
//  VolumeManager.swift
//  SoundApp
//
//  Created by Lander Wells on 6/24/23.
//

import Foundation

class VolumeManager : ObservableObject {
    static let shared = VolumeManager()
    
    @Published var volume: Double = 0.50
    
    private init() {}
}
