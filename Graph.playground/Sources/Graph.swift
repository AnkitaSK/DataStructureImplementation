
public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    associatedtype Element
    
    var allVertices: [Vertex<Element>] { get }
    func createVertex(_ data: Element) -> Vertex<Element>
    func addDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
    func addUnDirectedEdge(source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
    func add(_ edge: EdgeType, source: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(source: Vertex<Element>, destination: Vertex<Element>) -> Double?
}

