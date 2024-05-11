import Cocoa

class SettingsWindowController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    convenience init() {
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 300), styleMask: [.titled, .closable], backing: .buffered, defer: false)
        self.init(window: window)
        window.center()
        let contentView = NSView(frame: window.contentRectForFrameRect(window.frame))
        window.contentView = contentView
        
        // Add controls for settings here
    }
}