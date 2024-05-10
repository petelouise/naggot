//
//  NaggotApp.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import SwiftUI

@main
struct FullScreenNotificationApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
        .windowStyle(HiddenTitleBarWindowStyle()) // Hides the title bar, ensuring a more immersive mode
        .commands {
            CommandGroup(replacing: .newItem, addition: {})
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidBecomeActive(_ notification: Notification) {
        if let window = NSApp.keyWindow {
            setupKioskMode(window: window)
        }
    }

    private func setupKioskMode(window: NSWindow) {
        window.level = .floating // Ensures the window is always on top
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary] // Full screen across all spaces
        window.styleMask.insert(.fullScreen)
        window.toggleFullScreen(nil)  // Force the window into full screen
        NSApp.activate(ignoringOtherApps: true) // Focus the app
    }
}
