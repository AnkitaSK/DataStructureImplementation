import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}


extension TreeNode: CustomStringConvertible {
    public var description: String {
        guard children.count > 0 else {
            return "\(value)"
        }
        return "\(value) --> " + String(describing: children) + ""
    }
}
