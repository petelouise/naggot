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
        .commands {
            CommandGroup(replacing: .newItem, addition: {})
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidBecomeActive(_ notification: Notification) {
        if let window = NSApp.keyWindow {
            setupFullScreen(window: window)
        }
    }

    private func setupFullScreen(window: NSWindow) {
        window.styleMask.insert(.fullScreen)
        window.toggleFullScreen(nil)
    }
}
