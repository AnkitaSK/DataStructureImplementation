

// 1. Find the paths between 2 vertises
// using DF traversal
extension Graph where Element: Hashable {
    func pathsBetweenVertises(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        var numberOfPaths = 0
        var visited: Set<Vertex<Element>> = []
        paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)
        return numberOfPaths
    }
    
    private func paths(from source: Vertex<Element>, to destination: Vertex<Element>, visited: inout Set<Vertex<Element>>, pathCount: inout Int) {
        visited.insert(source)
        if source == destination {
            pathCount += 1
        } else {
            let neighbours = edges(from: source)
            for edge in neighbours {
                if !visited.contains(edge.destination) {
                    paths(from: edge.destination, to: destination, visited: &visited, pathCount: &pathCount)
                }
            }
        }
        visited.remove(source)
    }
}

let graph = AdjacencyList<String>()
let a = graph.createVertex("A")
let b = graph.createVertex("B")
let c = graph.createVertex("C")
let d = graph.createVertex("D")
let e = graph.createVertex("E")

graph.addUnDirectedEdge(source: a, destination: b, weight: nil)
graph.addUnDirectedEdge(source: b, destination: e, weight: nil)

//graph.addUnDirectedEdge(source: b, destination: d, weight: nil)

graph.addUnDirectedEdge(source: a, destination: c, weight: nil)
graph.addUnDirectedEdge(source: c, destination: d, weight: nil)
graph.addUnDirectedEdge(source: d, destination: e, weight: nil)

print(graph.pathsBetweenVertises(from: a, to: e))

print("BFS")
let bfsArray = graph.breathFirstSearch(from: a)
for vertex in bfsArray {
    print(vertex.data)
}

print("DFS")
let dfsArray = graph.depthFirstSearch(from: a)
for vertex in dfsArray {
    print(vertex.data)
}


// 3. check if graph is connected
extension Graph where Element: Hashable {
    // shoud be checked with undirected graphs
    func isConnected() -> Bool {
        guard let firstVertex = allVertices.first else { return true }
        
        let bfsNodes = breathFirstSearch(from: firstVertex)
        if allVertices.filter({bfsNodes.contains($0)}).count == allVertices.count {
            return true
        } else {
//            print("Count \(bfsNodes.filter({allVertices.contains($0)}).count)")
//                       print("bfs node count \(bfsNodes.count)")
//                       print("allVertices count \(allVertices.count)")
//                       print("First vertex \(firstVertex.data)")
            
            return false // else not connected
        }
    }
}

print(graph.isConnected())
