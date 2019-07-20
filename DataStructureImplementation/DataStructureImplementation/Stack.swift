//
//  Stack.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 20/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

struct Stack<Element> {
    fileprivate var array:[Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    mutating func peek() -> Element? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return array.map{"\($0)"}.reversed().joined(separator: "\n")
    }
}
