import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Node<Value>? {
        head
    }
    
    public var last: Node<Value>? {
        tail
    }
    
    // 1. add to the list
    // 1.1 push - add from front
    public mutating func push(_ value: Value) {
        let newNode = Node(value)
        newNode.next = head
        head?.previous = newNode
        head = newNode
        
        if tail == nil {
            tail = head
        }
        
    }
    
    // 1.2 append - add at the end
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        let newNode = Node(value)
        newNode.next = nil
        newNode.previous = tail
        tail?.next = newNode
        
        tail = newNode
    }
    
    // 1.3 insertAfter - add after the given node
    // 1.3.1 nodeAt -
    func nodeAt(_ index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        while currentIndex < index, currentNode != nil {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    // 1.3.2 insertAfter
    public mutating func insertAfter(_ value: Value, node: Node<Value>?) {
        guard let node = node else {
            push(value)
            return
        }
        
        let newNode = Node(value)
        newNode.previous = node
        newNode.next = node.next
        node.next?.next = newNode
        node.next = newNode
    }
    
    // 2. remove from list
    // 2.1 pop - remove from front
    
    // 2.2 removeLast - remove the last node
    
    // 2.3 removeAfter - remove after the given node
    
}
