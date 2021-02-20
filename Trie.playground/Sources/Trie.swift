import Foundation

// for all types that adopts Collection protocol + each element inside the collection must be Hashable
public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    public init() {}
    
    // time complexity O(k) - k, is elements in collection
    public func insert(_ collection: CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                // create a new node
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    // contains - to test if the given collection is part of the trie (subset or the whole trie)
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                print("does not contain")
                return false
            }
            current = child
        }
        
        return current.isTerminating
    }
    
    // remove
    public func remove(_ collection: CollectionType) {
//        guard let isCollectionInTrie = self.contains(collection) else { return } can't use this bcz you need a reference to the node
        
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else { return }
            current = child
        }
        
        guard current.isTerminating else { return }
        
        current.isTerminating = false
        
        while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
        
    }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else { return [] }
            current = child
        }
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        var results: [CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
        }
        
        return results
    }
}
