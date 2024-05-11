//
//  ContentView.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cyclingColors = false
    @State private var editingMessage = false
    private let defaultMessage = "This is your full-screen notification!"
    @AppStorage("userMessage") private var userMessage: String = ""
    @State private var currentColor: Color = .blue
    let colors: [Color] = [.red, .green, .blue, .orange, .purple, .pink]
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            // Background color covering the full screen, changes if cyclingColors is enabled
            (cyclingColors ? currentColor : Color.blue)
                .edgesIgnoringSafeArea(.all)

            VStack {
                if editingMessage {
                    TextField("Edit your message", text: $userMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                } else {
                    Text(userMessage.isEmpty ? defaultMessage : userMessage)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                if editingMessage {
                    Button("Save") {
                        UserDefaults.standard.set(userMessage, forKey: "userMessage")
                        NSApp.terminate(nil)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    HStack {
                        Button("Yes") {
                            editingMessage = true
                        }
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("No") {
                            NSApp.terminate(nil)
                        }
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .frame(width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height) // Full screen frame
        .onReceive(timer) { _ in
            if cyclingColors {
                currentColor = colors.randomElement() ?? .blue
            }
        }
        .onAppear {
            userMessage = UserDefaults.standard.string(forKey: "userMessage") ?? ""
        }
    }
}
