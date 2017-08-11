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
        
        let node3 = Node(label: 3)
        
        let node2 = Node(label: 2)
        node2.neighbors = [node2, node3]
        
        let node1 = Node(label: 1, neighbors: [node2, node3])
        let node0 = Node(label: 0, neighbors: [node1, node2, node3])
        
        node3.neighbors = [node0, node1, node2, node3]
        
        let cloneGraph = LeetCode.cloneGraph(node: node0)
        _ = LeetCode.cloneGraph(node: cloneGraph)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

