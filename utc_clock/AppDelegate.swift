//
//  AppDelegate.swift
//  utc_clock
//
//  Created by Jake Laurie on 5/02/20.
//  Copyright © 2020 Jake Laurie. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusBar = NSStatusBar.system
    var timer: Timer?
    var statusBarItem: NSStatusItem?
    var dateFormatter = DateFormatter()

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        //App shit
        NSApp.setActivationPolicy(.prohibited)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        self.statusBarItem = self.statusBar.statusItem(withLength: NSStatusItem.variableLength)
        self.dateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        self.timer?.invalidate()
    }
    
    @objc func timerTick() {
        statusBarItem?.button?.title = self.dateFormatter.string(from: Date())
    }


}

