

extension BinaryNode {
    public var balancedFactor: Int {
        leftHeight - rightHeight
    }
    
    public var leftHeight: Int {
        leftChild?.height ?? -1
    }
    
    public var rightHeight: Int {
        rightChild?.height ?? -1
    }
    
}

extension BinarySearchTree {
    // when series of right children are causing imbalance
    private func leftRotation(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        let pivote = node.rightChild!
        node.rightChild = pivote.leftChild
        pivote.leftChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivote.height = max(pivote.leftHeight, pivote.rightHeight) + 1
        
        return pivote
    }
    
    // when series of left children are causing imbalance
    private func rightRotation(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        let pivote = node.leftChild!
        node.leftChild = pivote.rightChild
        pivote.rightChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivote.height = max(pivote.leftHeight, pivote.rightHeight) + 1
        
        return pivote
    }
    
    // node where balance factor = -2
    private func rightLeftRotate(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotation(rightChild)
        return leftRotation(node)
    }
    
    // node where balanced factor = 2
    private func leftRightRotate(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotation(leftChild)
        return rightRotation(node)
    }
    
    private func balanced(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        switch node.balancedFactor {
        case 2:
            if let leftChild = node.leftChild, leftChild.balancedFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotation(node)
            }
        case -2:
            if let rightChild = node.rightChild, rightChild.balancedFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotation(node)
            }
        default:
            return node
        }
    }
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            // if its a leaf node
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value // replace(assign) with the smallest value of the right subtree
            node.rightChild = remove(from: node.rightChild, value: node.value)
            
        }
        if value < node.value {
            node.leftChild = remove(from: node.leftChild, value: value)
        } else {
            node.rightChild = remove(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}
