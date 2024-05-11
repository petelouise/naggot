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
        window.styleMask.insert(.fullScreen)
        window.level = .floating  // Keep the window always on top
        window.collectionBehavior = [.stationary, .canJoinAllSpaces]  // Enable display across all spaces
        window.toggleFullScreen(nil)
    }
}
