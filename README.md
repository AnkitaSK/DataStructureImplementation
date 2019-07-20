# DataStructureImplementation
All possible DS implementation

Using Xcode 10.2 and Swift 5


BFS testing

let adjacencyList = AdjacencyList<Int>()
let one = adjacencyList.createVertex(data: 1)
let two = adjacencyList.createVertex(data: 2)
let three = adjacencyList.createVertex(data: 3)

adjacencyList.add(.directed, from: one, to: two, weight: 5)
adjacencyList.add(.directed, from: two, to: three, weight: 10)
adjacencyList.add(.directed, from: three, to: one, weight: 15)

adjacencyList.add(.undirected, from: two, to: one, weight: 2)

print(adjacencyList.description)


// BFS testing
if let edges = adjacencyList.breadthFirstSearch(from: one, to: three) {
for edge in edges {
print("\(edge.source) --> \(edge.destination)")
}
}

Output:

vertex ----> [{vertex, weight}]
2 ----> [{3, 10.0}, {1, 2.0}]
1 ----> [{2, 5.0}]
3 ----> [{1, 15.0}]

Path
1 --> 2
2 --> 3


// Stack testing
var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

stack.pop()

print(stack)

output:
2
1
