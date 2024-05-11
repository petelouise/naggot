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
                NSApplication.shared.terminate(nil)
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)  // Ensures the view extends into the safe area
    }
}
