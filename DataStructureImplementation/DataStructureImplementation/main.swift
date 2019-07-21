//
//  main.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 18/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

//print("Hello, World!")

//// Linked list testing
//var testLinkedList = LinkedList<Int>()
//testLinkedList.append(value: 1)
//testLinkedList.append(value: 2)
//testLinkedList.append(value: 3)
//
//print(testLinkedList)

//// Queue testing
//var queue = Queue<Int>()
//queue.enqueue(1)
//queue.enqueue(5)
//queue.enqueue(90)
//queue.dequeue()
//print(queue)

// Graph adjacency list testing
//let adjacencyList = AdjacencyList<Int>()
//let one = adjacencyList.createVertex(data: 1)
//let two = adjacencyList.createVertex(data: 2)
//let three = adjacencyList.createVertex(data: 3)
//
//adjacencyList.add(.directed, from: one, to: two, weight: 5)
//adjacencyList.add(.directed, from: two, to: three, weight: 10)
//adjacencyList.add(.directed, from: three, to: one, weight: 15)
//
//adjacencyList.add(.undirected, from: two, to: one, weight: 2)
//
//print(adjacencyList.description)


// BFS testing
//if let edges = adjacencyList.breadthFirstSearch(from: one, to: three) {
//    for edge in edges {
//        print("\(edge.source) --> \(edge.destination)")
//    }
//}

// Stack testing
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(2)
//stack.push(3)
//
//stack.pop()
//
//print(stack)

// DFS testing
//if let stackValues = adjacencyList.depthFirstSearch(from: one, to: three) {
//    print(stackValues)
//}

// Heap Testing
let unsortedList = [6, 12, 2, 26, 8, 18, 21, 9, 5]
let heap = Heap(unsortedList, areSorted: >)
print(heap.elements)
