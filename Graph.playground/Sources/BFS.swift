
extension Graph where Element: Hashable {
    public func breathFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        // using queue
        var queue = Queue<Vertex<Element>>()
        var visited: Set<Vertex<Element>> = []
        var bfsArray = [Vertex<Element>]()
        
        queue.enqueue(source)
        visited.insert(source)
        while !queue.isEmpty, let vertex = queue.dequeue() {
            bfsArray.append(vertex)
//            print(vertex.data)
            let neighbours = edges(from: vertex)
            for edge in neighbours {
                if !visited.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    visited.insert(edge.destination)
                }
            }
        }
        return bfsArray
    }
}

