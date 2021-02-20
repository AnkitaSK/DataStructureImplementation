import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    // adding to the list
    // 1. Push - add in the beginning
    public mutating func push(_ value: Value) {
        let newNode = Node(value: value, next: head)
        head = newNode
        if tail == nil {
            tail = head
        }
        
    }
    
    // 2. append - add at the end
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    // 3. insert - insert after a given node
    // 1. find the node
    public func node(at index: Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        
        while currentIndex < index, currentNode != nil {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    public mutating func insert(_ value: Value, after node: Node<Value>?) {
        guard let node = node else {
            push(value)
            return
        }
        /// Identical to means that two constants or variables of class type refer to exactly the same class instance. (comparing memory addtesses, if they are equal or not.)
        guard tail !== node else {
            append(value)
            return
        }
        
        let newNode = Node(value: value, next: node.next)
        node.next = newNode
    }
    
    // removing from the list
    // 1. pop - removing 1st item
    
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // 2. remove last
    public mutating func removeLast() -> Value? {
        guard !isEmpty else {
            return nil
        }
        
        guard head !== tail else {
            return pop()
        }
        
        var currentNode = head
        while currentNode?.next !== tail {
            currentNode = currentNode?.next
        }
//        print("debug -> \(currentNode?.value)")
        let nodeTobeRemoved = tail
        currentNode?.next = nil
        tail = currentNode
        
        return nodeTobeRemoved?.value
    }
    
    // 3. remove after
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
//            node.next = nil
        }
        
        return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Linked list is empty"
        }
        return String(describing: head)
    }
}


extension LinkedList: Collection {
    public func index(after i: LinkedList<Value>.Index) -> LinkedList<Value>.Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
            position.node!.value
    }
    
    public var startIndex: LinkedList<Value>.Index {
        Index(node: head)
    }
    
    public var endIndex: LinkedList<Value>.Index {
        Index(node: tail?.next)
    }
    
    public struct Index: Comparable {
        public var node: Node<Value>?
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node, next: {$0?.next})
            return nodes.contains(where: { $0 === rhs.node })
        }
        
        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
    }
}
