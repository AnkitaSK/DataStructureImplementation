print("Binary Search Tree")



var bst = BinarySearchTree<Int>()
//for i in 0..<5 {
//    bst.insert(i)
//}
bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)
//print(bst)

//print(bst.contains(6))


// 1. check if the tree is binary search tree or binary tree. isBinary search tree time complexity O(n); space complexity is O(n) - because of recurssion

extension BinaryNode where Value: Comparable {
    
    var isBinaryTree: Bool {
        isBinarySearchTree(self, min: nil, max: nil)
    }
    
    func isBinarySearchTree(_ node: BinaryNode<Value>?, min: Value?, max: Value?) -> Bool {
        guard let rootNode = node else {
            return true // nil node is binary search tree
        }
        if let min = min, rootNode.value <= min {
            return false
        } else if let max = max, rootNode.value >= max {
            return false
        }
        
        return isBinarySearchTree(rootNode.leftChild, min: min, max: rootNode.value) && isBinarySearchTree(rootNode.rightChild, min: rootNode.value, max: max)
    }
}

// create a tree
// example 1
let root = BinaryNode(1)
let two = BinaryNode(2)
let three = BinaryNode(3)
let four = BinaryNode(4)
let five = BinaryNode(5)
let six = BinaryNode(6)
//
root.leftChild = two
root.rightChild = three

two.leftChild = four
two.rightChild = five

three.leftChild = six
//print(root.isBinaryTree)

// example 2
let root2 = BinaryNode(5)
let two2 = BinaryNode(3)
let three2 = BinaryNode(9)
//let four2 = BinaryNode(2)
//let five2 = BinaryNode(7)
//let six2 = BinaryNode(10)
//
root2.leftChild = two2
root2.rightChild = three2

//two2.leftChild = four2
//two2.rightChild = five2
//
//three2.leftChild = six2
print(root2.isBinaryTree)

// 2. check if 2 trees are equal using equitable protocol
extension BinarySearchTree: Equatable {
    public static func == (lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool {
        isEqual(lhs.root, rhs.root)
    }
    
    private static func isEqual(_ node1: BinaryNode<Element>?, _ node2: BinaryNode<Element>?) -> Bool {
     
        guard let leftNode = node1, let rightNode = node2 else {
            return node1 == nil && node2 == nil
        }
        return leftNode.value == rightNode.value && isEqual(leftNode.leftChild, rightNode.rightChild) && isEqual(leftNode.rightChild, rightNode.rightChild)
    }
}
