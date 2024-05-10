//
//  NaggotApp.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

@main
struct FullScreenNotificationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    if let window = NSApp.windows.first {
                        setupKioskMode(window: window)
                    }
                }
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Hide the title bar
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false))
        .commands {
            CommandGroup(replacing: .newItem, addition: {})
        }
    }

    private func setupKioskMode(window: NSWindow) {
        window.level = .statusBar
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenPrimary]
        window.styleMask.insert(.fullScreen)
        NSApp.activate(ignoringOtherApps: true)
    }
}
