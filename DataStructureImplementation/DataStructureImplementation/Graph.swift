//
//  Graph.swift
//  DataStructureImplementation
//
//  Created by Kalangutkar Ankita Vinod on 7/19/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Cocoa

//class Graph: NSObject {
//
//}

// Vertex
// as vertex will be stored as a custom key in dictionary, conform it to the Hashable proticol
public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hash: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

// Edge

enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

extension Edge: Hashable {
    public var hash: Int {
        return "\(source)\(destination)\(String(describing: weight))".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible {get}
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
}


// creating Adjacency list

class AdjacencyList<T:Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

//extension AdjacencyList: Graphable {
//    typealias Element = T
//    
////    var description: CustomStringConvertible {
////
////    }
//    
//    func createVertex(data: T) -> Vertex<T> {
//        let vertex = Vertex(data: data)
//        if adjacencyDict[vertex] == nil {
//            adjacencyDict[vertex] = []
//        }
//        return vertex
//    }
//    
////    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
////        <#code#>
////    }
//    
////    func weight(from source: Vertex<T>, to destination: Vertex<T>) {
////        <#code#>
////    }
//    
////    func edges(from source: Vertex<T>) -> [Edge<T>] {
////        <#code#>
////    }
//    
//    
//    
//    
//}
