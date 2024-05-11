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
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                NSApplication.shared.terminate(nil)
            }) {
                Text("Close")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
