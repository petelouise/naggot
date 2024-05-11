//
//  ContentView.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is your full-screen notification!")
                .font(.largeTitle)
                .foregroundColor(.white)
            Button("Dismiss") {
                NSApp.keyWindow?.close()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)  // Ensures the view extends into the safe area
        .edgesIgnoringSafeArea([.top, .leading, .bottom, .trailing])
    }
}
