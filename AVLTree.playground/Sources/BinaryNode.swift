import Foundation

// Binary tree is a tree which has atmost 2 children (left and right)
public class BinaryNode<Value> {
    public var value: Value
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public var height = 0 // need for AVL tree
    
    public init(_ value: Value) {
        self.value = value
    }
}

// TODO
extension BinaryNode: CustomStringConvertible {
    public var description: String {
//        guard let left = leftChild else { return "\(value)" }
//        guard let right = rightChild else { return "\(value)" }
//        return "\(value) -> " + String(describing: left) + " + " + String(describing: right) + " "
        
        return "\(value)"
    }
}
