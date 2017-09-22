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
        
        let values: [Int] = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1, 3]
        let rainfall = LeetCode.calculateRainfall(elevationMap: values)
        print(rainfall)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

