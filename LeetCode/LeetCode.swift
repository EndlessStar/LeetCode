//
//  LeetCode.swift
//  LeetCode
//
//  Created by user on 2017/7/31.
//  Copyright © 2017年 LYL. All rights reserved.
//

import Foundation

class LeetCode {
    /// First Missing Positive
    ///
    /// - Parameter array:
    /// - Returns:
    class func findFirstMissingPositiveInteger(array: [Int]) -> Int {
        var min = Int.max
        for num in array {
            if num < min && num > 0 {
                min = num
            }
        }
        
        var hash: [Int] = Array<Int>(repeating: -1, count: array.count)
        for num in array {
            if num <= 0 {
                continue
            }
            let index = num - min
            if index < array.count {
                hash[index] = index
            }
        }
        
        var missingInteger: Int = 0
        for index in 0..<hash.count {
            if index + 1 < hash.count {
                if hash[index + 1] < 0 {
                    missingInteger = index + 1
                    break
                }
            } else {
                missingInteger = index + 1
            }
        }
        return missingInteger + min
    }
    
    static var stack: [Node] = []
    static var trash: [Node] = []
    static var sequence: String = ""
    
    class func cloneGraph(node: Node) -> Node{
        let graph = LeetCode.cloneNode(node: node)
        print(sequence)
        stack.removeAll()
        trash.removeAll()
        sequence.removeAll()
        return graph!
    }
    
    class private func cloneNode(node: Node) -> Node? {
        for item in LeetCode.trash {
            if item.label == node.label {
                return item
            }
        }
        for item in LeetCode.stack {
            if item.label == node.label {
                return nil
            }
        }
        LeetCode.stack.append(node)
        
        if LeetCode.sequence == "" {
            LeetCode.sequence.append("\(node.label)")
        } else {
            LeetCode.sequence.append("#\(node.label)")
        }
        for nodeItem in node.neighbors{
            LeetCode.sequence.append(",\(nodeItem.label)")
        }
        
        let label = node.label
        var neighbors: [Node] = []
        
        var hasSelfNode = false
        for nodeItem in node.neighbors {
            if nodeItem.label == node.label {
                hasSelfNode = true
                continue
            }
            if let cloneNode = self.cloneNode(node: nodeItem) {
                neighbors.append(cloneNode)
            }
        }
        LeetCode.stack.removeLast()
        LeetCode.trash.append(node)
        
        let result = Node(label: label, neighbors: neighbors)
        if hasSelfNode {
            result.neighbors.append(result)
        }
        return result
    }
}

class Node {
    let label: Int;
    var neighbors: [Node] = []
    init(label: Int, neighbors: [Node] = []) {
        self.label = label
        self.neighbors = neighbors
    }
}
