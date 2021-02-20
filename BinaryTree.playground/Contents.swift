
print("Binary tree")

// 1. in order traversal
//https://www.geeksforgeeks.org/inorder-tree-traversal-without-recursion/

public func inOrderTraversal(_ tree: BinaryNode<Int>) {
    var stack = Stack<BinaryNode<Int>>()
    var currentNode: BinaryNode<Int>?
    currentNode = tree
    var didEndTraversal = false
     
    while !didEndTraversal {
        while currentNode != nil {
               stack.push(currentNode!)
               currentNode = currentNode!.leftChild
           }
           
           if currentNode == nil && !stack.isEmpty {
               let popedNode = stack.pop()
               print(popedNode ?? "", terminator: " ")
               currentNode = popedNode?.rightChild
           } else {
               didEndTraversal = true
           }
    }
   
}

// create a tree
let root = BinaryNode(1)
let two = BinaryNode(2)
let three = BinaryNode(3)
let four = BinaryNode(4)
let five = BinaryNode(5)
let six = BinaryNode(6)

root.leftChild = two
root.rightChild = three

two.leftChild = four
two.rightChild = five

three.leftChild = six

inOrderTraversal(root)


// 2. preorder traversal
// https://www.youtube.com/watch?v=8ACdQRScO_w

func preOrderTraversal(_ tree: BinaryNode<Int>) {
    var stack = Stack<BinaryNode<Int>>()
    stack.push(tree)
    while !stack.isEmpty {
        guard let popedNode = stack.pop() else { break }
        print(popedNode.value, terminator: " ")
        
        if popedNode.rightChild != nil {
            stack.push(popedNode.rightChild!)
        }
        if popedNode.leftChild != nil {
            stack.push(popedNode.leftChild!)
        }
    }
}

print()
print()
print("Preorder traversal")
preOrderTraversal(root)

// 3. Post order traversal
//https://www.youtube.com/watch?v=xLQKdq0Ffjg

func postOrderTraversal(_ tree: BinaryNode<Int>) {
    var stack = Stack<BinaryNode<Int>>()
    var currentNode: BinaryNode<Int>?
    currentNode = tree
    var didEndTraversal = false
    
    while !didEndTraversal {
        while currentNode != nil {
            stack.push(currentNode!)
            currentNode = currentNode?.leftChild
        }
        
        guard let peekValue = stack.peek() else {
            if currentNode == nil && stack.isEmpty {
                didEndTraversal = true
            }
            return
        }
        
        if currentNode == nil {
            if peekValue.rightChild == nil {
                guard let popNode = stack.pop() else { break }
                print(popNode, terminator: " ")
                if stack.peek()?.rightChild?.value == popNode.value {
                    guard let popNode = stack.pop() else { break }
                    print(popNode, terminator: " ")
                }
            } else {
                currentNode = peekValue.rightChild
            }
        }
    }
    
}

print()
print()
print("Postorder traversal")
postOrderTraversal(root)
