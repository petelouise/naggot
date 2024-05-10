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
            Spacer()
            Text("This is your full-screen notification!")
                .font(.largeTitle)
                .foregroundColor(.white)
            Spacer()
            Button("Dismiss") {
                NSApplication.shared.terminate(nil)
            }
            .font(.title)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all) // This makes the view truly full-screen
    }
}
