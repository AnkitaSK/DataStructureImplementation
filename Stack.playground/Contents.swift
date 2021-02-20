import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        "\(storage.map{"\($0)"}.reversed().joined(separator: "\n"))"
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

var stackTest = Stack<Int>()
stackTest.push(1)
stackTest.push(2)
stackTest.push(3)
stackTest.push(4)
print(stackTest)



// 1. reverse an array
var stackTest2: Stack = [1,2,3,4]
//print(stackTest2)

// 2. balance the parenthesis
public func isStringBalanced(_ text: String) -> Bool {
    var stack = Stack<Character>()
    for character in text {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            stack.pop()
        }
    }
    
    return stack.isEmpty
}

//let testString = "h((e))llo(world)()"
let testString = "(hello world"
print(isStringBalanced(testString))
