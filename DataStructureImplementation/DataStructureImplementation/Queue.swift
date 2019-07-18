//
//  Queue.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 18/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

public struct Queue<T> {
    fileprivate var list = LinkedList<T>()
    
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(node: element)
    }
}


extension Queue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
