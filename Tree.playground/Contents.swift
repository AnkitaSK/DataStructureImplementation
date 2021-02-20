import Foundation

print("Tree basic and traversals")

//let bevarage = TreeNode("Bevarage")
//let cold = TreeNode("Cold")
//let hot = TreeNode("Hot")
//
//bevarage.add(cold)
//bevarage.add(hot)
//print(bevarage)

// Depth first traversal
// https://algorithms.tutorialhorizon.com/depth-first-searchtraversal-in-binary-tree/

func dfTraversal(_ tree: TreeNode<String>) {
    var stack = Stack<TreeNode<String>>()
    stack.push(tree)
    while !stack.isEmpty {
        guard let popValue = stack.pop() else {
            return
        }
        print(popValue.value)
        for element in popValue.children.reversed() {
            stack.push(element)
        }
    }
}

//dfTraversal(bevarage)


// test dft
let tree = TreeNode("Bevarage")

let hot = TreeNode("Hot")
let cold = TreeNode("Cold")

let tea = TreeNode("Tea")
let coffee = TreeNode("Coffee")
let chocolate = TreeNode("Chocolate")

let blackTea = TreeNode("BlackTea")
let greenTea = TreeNode("GreenTea")
let chai = TreeNode("Chai")

let soda = TreeNode("Soda")
let milk = TreeNode("Milk")

let gingerAle = TreeNode("GingerAle")
let bitterLemon = TreeNode("BitterLemon")

tree.add(hot)
tree.add(cold)

hot.add(tea)
hot.add(coffee)
hot.add(chocolate)

cold.add(soda)
cold.add(milk)

tea.add(blackTea)
tea.add(greenTea)
tea.add(chai)

soda.add(gingerAle)
soda.add(bitterLemon)

print("Depth first traversal")
dfTraversal(tree)


print("\n \n")

// level order traversal
// https://www.geeksforgeeks.org/level-order-traversal-line-line-set-3-using-one-queue/

func levelOrderTraversal(_ tree: TreeNode<String>) {
    var queue = Queue<TreeNode<String>>()
    queue.enqueue(tree)
    while !queue.isEmpty {
        guard let dequedValue = queue.dequeue() else { return }
        print(dequedValue.value)
        for element in dequedValue.children {
            queue.enqueue(element)
        }
    }
}

print("Level order traversal")
levelOrderTraversal(tree)


func levelOrderTraversal2(_ tree: TreeNode<String>) {
    var queue = Queue<TreeNode<String>>()
    queue.enqueue(tree)
    var levelCount = 0
    
    while !queue.isEmpty {
        levelCount += queue.count
        
        while levelCount > 0 {
            guard let dequedValue = queue.dequeue() else { return }
            print(dequedValue.value, separator: ", ", terminator: " ")
            for element in dequedValue.children {
                queue.enqueue(element)
            }
            levelCount -= 1
        }
        print()
    }
}

print()
print()
print()
print("Level order traversal for each level")
levelOrderTraversal2(tree)
