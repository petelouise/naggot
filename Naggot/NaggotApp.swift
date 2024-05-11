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
    window.setFrame(NSScreen.main!.frame, display: true)
    window.styleMask = [.fullScreen]
    window.level = .screenSaver  // Ensures the window is always on top and does not allow app switching
    window.collectionBehavior = [.stationary, .canJoinAllSpaces, .fullScreenPrimary]
    NSApp.presentationOptions = [.fullScreen, .disableProcessSwitching, .disableMenuBarTransparency]  // Kiosk mode settings
    window.toggleFullScreen(nil)
}
    }
}
