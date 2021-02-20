
extension Graph where Element: Hashable {
    public func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        // using stack
        var stack = Stack<Vertex<Element>>()
        var visited: Set<Vertex<Element>> = []
        var dfs = [Vertex<Element>]()
        
        stack.push(source)
        visited.insert(source)
        
        while !stack.isEmpty, let vertex = stack.pop() {
            dfs.append(vertex)
            
            let neighbours = edges(from: vertex)
            for edge in neighbours {
                if !visited.contains(edge.destination) {
                    stack.push(edge.destination)
                    visited.insert(edge.destination)
                }
            }
        }
        
        return dfs
    }
}

