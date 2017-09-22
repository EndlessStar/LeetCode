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
    
    
/*
     There are N children standing in a line. Each child is assigned a rating value.
     
     You are giving candies to these children subjected to the following requirements:
     
     Each child must have at least one candy.
     Children with a higher rating get more candies than their neighbors.
     What is the minimum candies you must give?
*/
    class func candy(values: [Int]) -> Int {
        var min: Int = 0
        var wave = Array<Int>(repeating: 0, count: values.count)
        for index in 0..<values.count {
            let curValue = values[index]
            let preValue = index - 1 >= 0 ? values[index - 1] : curValue
            let nextValue = index + 1 < values.count ? values[index + 1] : curValue
            wave[index] = curValue > preValue || curValue > nextValue ? 1 : 0
        }
        
        var count = 1
        for index in 0..<wave.count {
            let curValue = wave[index]
            if index - 1 >= 0 {
                if curValue == 1 {
                    count += 1
                    min += count
                } else {
                    min += 1
                    count = 1
                }
            } else {
                min += 1
                count = 1
            }
        }
        
        return min
    }
    
    /*
     Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
     
     For example,
     Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.
     
     
     The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.Thanks Marcos for contributing this image!
    */
    
    class func calculateRainfall(elevationMap: [Int]) -> Int {
        
        func statistics(startIndex: Int, endIndex: Int, elevation: Int) -> Int {
            guard startIndex >= 0 && endIndex < elevationMap.count else {
                return 0
            }
            var count = 0
            for index in startIndex...endIndex {
                count += elevation - elevationMap[index]
            }
            return count
        }
        
        func findMaxElevation(startIndex: Int, endIndex: Int) -> (position: Int, elevation: Int) {
            guard startIndex >= 0 && endIndex < elevationMap.count else {
                return (NSNotFound, NSNotFound)
            }
            var maxElevation: Int = Int.min
            var position: Int = NSNotFound
            for index in startIndex...endIndex {
                if maxElevation < elevationMap[index] {
                    maxElevation = elevationMap[index]
                    position = index
                }
            }
            return (position, maxElevation)
        }
        let maxElevation = findMaxElevation(startIndex: 0, endIndex: elevationMap.count - 1)
        var leftIndex = maxElevation.position - 1
        var rightIndex = maxElevation.position + 1
        var rainfall: Int = 0
        while leftIndex >= 0 || rightIndex < elevationMap.count  {
            if leftIndex >= 0 {
                let leftMaxElevation = findMaxElevation(startIndex: 0, endIndex: leftIndex)
                if leftMaxElevation.elevation != NSNotFound && leftMaxElevation.position != NSNotFound {
                    rainfall += statistics(startIndex: leftMaxElevation.position, endIndex: leftIndex, elevation: leftMaxElevation.elevation)
                    leftIndex = leftMaxElevation.position - 1
                }
            }
            
            if rightIndex < elevationMap.count {
                let rightMaxElevation = findMaxElevation(startIndex: rightIndex, endIndex: elevationMap.count - 1)
                if rightMaxElevation.elevation != NSNotFound && rightMaxElevation.position != NSNotFound {
                    rainfall += statistics(startIndex: rightIndex, endIndex: rightMaxElevation.position, elevation: rightMaxElevation.elevation)
                    rightIndex = rightMaxElevation.position + 1
                }
            }
        }
        return rainfall
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
