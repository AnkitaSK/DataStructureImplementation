
public struct Heap<Element: Equatable> {
    var elements: [Element] = []
    var sort: (Element, Element) -> Bool
    
    public init(sort: @escaping(Element, Element) -> Bool,  elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                shiftDown(from: i)
            }
        }
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
}

extension Heap {
    // remove at the top
    public mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        
        defer {
            shiftDown(from: 0)
        }
        
        return elements.removeLast()
    }
    
    mutating func shiftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
//            print("left \(left), right \(right)")
            
            var candidate = parent
            
            if left < count, sort(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count, sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if parent == candidate {
//                print("parent \(parent), candidate \(candidate)")
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    // insert
    mutating func insert(element: Element) {
        elements.append(element)
        shiftUp(from: count - 1)
    }
    
    mutating func shiftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0, sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    // arbitary remove
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else { return nil }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                shiftDown(from: index)
                shiftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    // searching
    func index(of element: Element, startingAt i: Int) -> Int? {
        guard i < count else { return nil }
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: (leftChildIndex(ofParentAt: i))) {
            return j
        }
        if let j = index(of: element, startingAt: (rightChildIndex(ofParentAt: i))) {
            return j
        }
        return nil
    }
}
