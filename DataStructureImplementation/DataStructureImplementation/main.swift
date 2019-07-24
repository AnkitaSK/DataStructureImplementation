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
//let unsortedList = [6, 12, 2, 26, 8, 18, 21, 9, 5]
//let heap = Heap(unsortedList, areSorted: >)
//print(heap.elements)

// Binary tree


let node1 = BinaryTree.node(.empty, 5, .empty)
let node2 = BinaryTree.node(.empty, 10, .empty)
let parentNode = BinaryTree.node(node1, 15, node2)

print(parentNode)

var stack = Stack<Int>()
parentNode.traversePostOrder { (a) in
    stack.push(a)
}

print(stack)

print("............. Operations .............")

var stack2 = Stack<Any>()

let oNode1 = BinaryTree.node(.empty, "", .empty)
let oNode2 = BinaryTree.node(.empty, "5", .empty)
let oParent = BinaryTree.node(oNode1, "*", oNode2)

print(oParent)

func equationSimplification() -> Any {
    oParent.traversePostOrder { (a) in
        switch a {
        case String(Int(a) ?? -1) :
            stack2.push(Int(a) ?? -1)
        case "*":
            if let value1 = stack2.pop() as? Int, let value2 = stack2.pop() as? Int, value1 != -1, value2 != -1 {
                stack2.push(value1 * value2)
            }
        case "-":
            if let value1 = stack2.pop() as? Int, let value2 = stack2.pop() as? Int {
                if value1 > value2 {
                    stack2.push(value1 - value2)
                } else {
                    stack2.push(value2 - value1)
                }
            }
        default:
            break
        }
    }
    
    return stack2.peek()
}




print(equationSimplification())
