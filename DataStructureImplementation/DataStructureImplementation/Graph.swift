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

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
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
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}


// creating Adjacency list

class AdjacencyList<T:Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    typealias Element = T
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    fileprivate func addUndirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
//        addDirectedEdge(from: source, to: destination, weight: weight)
//        addDirectedEdge(from: destination, to: source, weight: weight)
        
        if self.weight(from: source, to: destination) == nil {
            addDirectedEdge(from: source, to: destination, weight: weight)
        }
        
        if self.weight(from: destination, to: source) == nil {
            addDirectedEdge(from: destination, to: source, weight: weight)
        }
    }

    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("{\(edge.destination), \(edge.weight ?? 0.0)}, ")
                } else {
                    edgeString.append("{\(edge.destination), \(edge.weight ?? 0.0)}")
                }
            }
            result.append("\(vertex) ----> [\(edgeString)]\n")
        }
        return result
    }

    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }

    func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(from: source, to: destination, weight: weight)
        }
    }

    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        
        let filteredByDestination = edges.filter({$0.destination == destination})
        return filteredByDestination.count > 0 ? filteredByDestination[0].weight : nil
    }

    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }

}
