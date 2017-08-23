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
        
        let values: [Int] = [1, 4, 6, 3, 4, 6, 8]
        let min = LeetCode.candy(values: values)
        print(min)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

