//
//  ContentView.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("This is your full-screen notification!")
            .font(.largeTitle)
            .foregroundColor(.white)
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
