//
//  DFSImplementation.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 18/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

// for finding a way back
enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
//        inorder to avoid visited node + find a way back
//        var enqueuedVertises = Set<Vertex<Element>>()
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source]
        
        while let visitedVertex = queue.dequeue() {
            if visitedVertex == destination {
                var vertex = destination
                var route: [Edge<Element>] = []
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                return route
            }
//            now visit vertex's neighbours
            guard let neibourEdges = edges(from: visitedVertex) else { return nil }
            for edge in neibourEdges {
//                if !enqueuedVertises.contains(edge.destination) {
//                    enqueuedVertises.insert(edge.destination)
//                    queue.enqueue(edge.destination)
//                }
                if visits[edge.destination] == nil {
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
                
            }
            
        }
        return nil
    }
}
