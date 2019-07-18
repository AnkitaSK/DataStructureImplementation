//
//  LinkedList.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 18/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
            newNode.previous = tailNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            
            while node?.next != nil {
                if i == 0 {
                    return node!
                }
                i -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prevNode = prev {
            //        removing middle node
            prevNode.next = next
        } else {
            head = next // removing 1st node
        }
        
        next?.previous = prev
    
        if next == nil {
            tail = prev
        }
        
//        finally remove nodes
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(String(describing: node?.value))"
            node = node?.next
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
    
    
}

public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
