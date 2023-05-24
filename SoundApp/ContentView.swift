//
//  ContentView.swift
//  SoundApp
//
//  Created by Lander Wells on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var volume: Double = 50
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, I am typing this message")
            Slider(value: $volume, in: 0...100)
        } .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
