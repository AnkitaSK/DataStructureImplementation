import Foundation

public struct Queue<Value> {
    private var storage: [Value] = []
    
    public init() {}
    
    public mutating func enqueue(_ value: Value) {
        storage.append(value)
    }
    
    public mutating func dequeue() -> Value? {
        return storage.removeFirst()
    }
    
    public var isEmpty: Bool {
        storage.count == 0
    }
    
    public var count: Int {
        storage.count
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return ""
        }
        return "\(storage.map{"\($0)"}.joined(separator: "\n"))"
    }
}
