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
        .windowStyle(HiddenTitleBarWindowStyle()) // Hide the title bar
        .windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false))
        .commands {
            CommandGroup(replacing: .newItem, addition: {})
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Setup the main application window
        if let window = NSApp.windows.first {
            setupKioskMode(window: window)
        }
    }

    private func setupKioskMode(window: NSWindow) {
        window.level = .statusBar
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenPrimary]
        window.styleMask.insert(.fullScreen)
        window.toggleFullScreen(nil)  // Attempt to toggle full screen
        NSApp.activate(ignoringOtherApps: true)
    }
}
