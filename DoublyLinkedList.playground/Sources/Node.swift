import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node<Value>?
    public weak var previous: Node<Value>?
    
    public init(_ value: Value) {
        self.value = value
    }
}

//extension Node: CustomStringConvertible {
//    guard let nextNode = self.next && let previousNode = self.previous else {
//        return \(value)
//    }
//    
//    public var description: String {
//        return String(describing: previousNode) + \(value) + String(description: nextNode)
//    }
//}
