//
//  AppDelegate.swift
//  ColorsetCreator
//
//  Created by Federico Cappelli on 03/02/2018.
//  Copyright (c) 2018 Federico Cappelli. All rights reserved.
//

import Cocoa
import ColorsetCreator

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let colorsTest = [
            Color(name: "Color1", nsColor: NSColor.red),
            Color(name: "Color2", nsColor: NSColor.black),
            Color(name: "Color3", nsColor: NSColor(deviceRed: 50/255, green: 168/255, blue: 82/255, alpha: 1.0)),
            Color(name: "Color4", nsColor: NSColor.green),
        ]
        
        let homePath = FileManager.default.homeDirectoryForCurrentUser
        let desktopURL = homePath.appendingPathComponent("Desktop")
        do {
            try ColorsetCreator.generateXCAsset(fromColorsWithNames: colorsTest,
                                                inFolder: desktopURL,
                                                assetName: "ColorsetCreatorTest",
                                                force: true)
        } catch {
            print("Error: \(error)")
        }
        
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

