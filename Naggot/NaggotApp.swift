//
//  NaggotApp.swift
//  Naggot
//
//  Created by Pete Louise Brooks-Asclepiadoideae on 5/10/24.
//

import Cocoa
import SwiftUI

@main
struct FullScreenNotificationApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApp.windows.first {
            setupFullScreen(window: window)
        }
    }

    private func setupFullScreen(window: NSWindow) {
        window.setFrame(NSScreen.main!.frame, display: true, animate: true)
        window.styleMask = [.fullSizeContentView, .borderless]
        window.level = .screenSaver // Ensures the window is above most other windows, including the menu bar
        window.isOpaque = true
        window.backgroundColor = .clear
        window.collectionBehavior = [.stationary, .canJoinAllSpaces, .fullScreenPrimary]
        NSApp.presentationOptions = [.autoHideDock, .autoHideMenuBar, .disableProcessSwitching, .disableForceQuit, .disableSessionTermination] // Enforces a more strict kiosk mode
    }
}
