//
//  AppDelegate.swift
//  LeetCode
//
//  Created by user on 2017/7/31.
//  Copyright © 2017年 LYL. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let S = "barfoothefoothebarmanthebarfoo"
        let L = ["foo", "bar", "the"]
        let result = LeetCode.substringWithConcatenationWords(S: S, L: L)
        print(result)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

