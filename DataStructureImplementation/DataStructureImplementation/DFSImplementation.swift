//
//  DFSImplementation.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 20/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation


extension Graphable {
    public func depthFirstSearch(from start: Vertex<Element>, to end: Vertex<Element>) -> Stack<Vertex<Element>>? {
        var visited = Set<Vertex<Element>>()
        var stack = Stack<Vertex<Element>>()
        
        stack.push(start)
        visited.insert(start)
        
        while let vertex = stack.peek() {
            if vertex == end {
//                TODO
                return stack
            }
            
            guard let neibours = edges(from: vertex) else {
                return nil
            }
            
            for edge in neibours {
                if !visited.contains(edge.destination) {
                    visited.insert(edge.destination)
                    stack.push(edge.destination)
                }
            }
            
        }
        return nil
    }
}
