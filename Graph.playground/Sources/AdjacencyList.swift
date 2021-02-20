

public class AdjacencyList<T: Hashable>: Graph {
    
    
    var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    public var allVertices: [Vertex<T>] {
        var _allVertices = [Vertex<T>]()
        for (vertex, _) in adjacencies {
            _allVertices.append(vertex)
        }
        return _allVertices
    }
    
    public func createVertex(_ data: T) -> Vertex<Element> {
        let vertex = Vertex(data: data, index: adjacencies.count)
        adjacencies[vertex] = []
        return vertex
    }
    
    public func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    public func addUnDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        addDirectedEdge(source: source, destination: destination, weight: weight)
        addDirectedEdge(source: destination, destination: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType, source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(source: source, destination: destination, weight: weight)
        case .undirected:
            addUnDirectedEdge(source: source, destination: destination, weight: weight)
        }
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        adjacencies[source] ?? []
    }
     
    public func weight(source: Vertex<T>, destination: Vertex<T>) -> Double? {
//        adjacencies[source]?.filter{ $0.destination == destination }.first?.weight
        adjacencies[source]?.first{ $0.destination == destination }?.weight
    }
} 

extension AdjacencyList: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
                result.append("\(vertex) --> [\(edgeString)]")
            }
        }
        return result
    }
}
