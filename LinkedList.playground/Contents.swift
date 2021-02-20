import Foundation
import PlaygroundSupport

print("Linked list")
//let node1 = Node<Int>(value: 3)
//let node2 = Node<Int>(value: 2)
//let node3 = Node<Int>(value: 1)
//
//node1.next = node2
//node2.next = node3
//
////print(node1)
//
//print("Linked list operations")
//print("Adding")
//print("Push")
//var linkedList = LinkedList<Int>()
//linkedList.push(3)
//linkedList.push(2)
//linkedList.push(1)
//print(linkedList)
//
//print("append")
//linkedList.append(4)
//print(linkedList)
//
//print("insert after")
//let node = linkedList.node(at: 1)
//linkedList.insert(23, after: node)
//print(linkedList)
//
//print("remove from list")
//print("Pop")
//let popedValue = linkedList.pop()
//print(linkedList)
//print(popedValue)
//
//print("remove last")
//let removedValue = linkedList.removeLast()
//print(linkedList)
//print(removedValue)
//
//print("remove after")
//let node10 = linkedList.node(at: 0)
//let removedNode = linkedList.remove(after: node10!)
//print(linkedList)
//print(removedNode)


var list = LinkedList<Int>()

for i in 1...3 {
    list.append(i)
}

print(list)
//print("First element \(list[list.startIndex])")
//print("First 3 elements \(Array(list.prefix(3)))")
//print("Last 3 elements \(Array(list.suffix(3)))")
//print("Sum = \(list.reduce(0, +))")

// 1.
private func reverseList<T>(_ node: Node<T>?) {
    guard let node = node else { return }
    reverseList(node.next)
    print(node.value)
}

//func reverseList<T>(_ list: LinkedList<T>) {
//    reverseList(list.head)
//}

print("reverse list")
reverseList(list.head)

// 2. find the middle node
func findMiddleValue<T>(_ list: LinkedList<T>) -> T? {
    let middleIndex =  (list.count - 1) / 2
    let middleNode = list.node(at: middleIndex)
    return middleNode?.value
}

print("Middle node")
print(findMiddleValue(list) ?? "empty")

// 3. reverse a linkedlist
func reverseLinkedList<T>(_ list: LinkedList<T>) -> LinkedList<T> {
    var reversedList = LinkedList<T>()
    var currentNode = list.head
    while currentNode != nil {
        reversedList.push(currentNode!.value)
        currentNode = currentNode?.next
    }
    return reversedList
}

print("reversed list")
print(reverseLinkedList(list).head ?? "empty")

//
print("reverse without extra list")
extension LinkedList {
    mutating func reverseList() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
}

list.reverseList()
print(list)

// 4. merge 2 lists
func mergeSortedLists<T: Comparable>(list1: LinkedList<T>, list2: LinkedList<T>) -> LinkedList<T> {
    
    guard !list1.isEmpty else {
        return list2
    }
    
    guard !list2.isEmpty else {
        return list1
    }
    
    var newHead: Node<T>?
    var tail: Node<T>?
    
    var currentLeft = list1.head
    var currentRight = list2.head
    
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead
    }
    
    while let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next
    }
    
    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }

    if let rightNodes = currentRight {
        tail?.next = rightNodes
    }
    
    var mergedList = LinkedList<T>()
    mergedList.head = newHead
    mergedList.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    
    return mergedList
}


print("merge lists")
var list1 = LinkedList<Int>()
list1.append(1)
list1.append(4)
list1.append(10)
list1.append(11)

var list2 = LinkedList<Int>()
list2.append(-1)
list2.append(2)
list2.append(3)
list2.append(6)

print(list1)
print(list2)

let mergedList = mergeSortedLists(list1: list1, list2: list2)
print(mergedList)
