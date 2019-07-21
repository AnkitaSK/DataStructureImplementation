//
//  Heap.swift
//  DataStructureImplementation
//
//  Created by Ankita Kalangutkar on 21/07/19.
//  Copyright © 2019 Ankita Kalangutkar. All rights reserved.
//

import Foundation

struct Heap<Element: Equatable> {
//    fileprivate var elements: [Element] = []
    var elements: [Element] = []
    let areSorted: (Element, Element) -> Bool // to determine min or max heap
    
    init(_ elements: [Element], areSorted: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.areSorted = areSorted
        
        guard !elements.isEmpty else {
            return
        }
        
        for index in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: index, upto: elements.count)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func getChildIndices(ofParentAt parentIndex: Int) -> (left: Int, right: Int) {
        let leftIndex = (2 * parentIndex + 1)
        return (leftIndex, leftIndex + 1)
    }
    
    func getParentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2 // as for left child will be odd number, and divide by 2 will always make it a even so parent is calculated from an even number
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func removeRoot() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        elements.swapAt(0, count - 1)
        let originalRoot = elements.removeLast()
        siftDown(from: 0, upto: count)
        return originalRoot
    }
    
    mutating func siftDown(from index: Int, upto size: Int) {
        var parentIndex = index
        while true {
            let (leftIndex, rightIndex) = getChildIndices(ofParentAt: parentIndex)
            var optionalParentSwapIndex: Int?
            if leftIndex < size && areSorted(elements[leftIndex], elements[parentIndex]) {
                optionalParentSwapIndex = leftIndex
            }
            
            if rightIndex < size && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? leftIndex]) {
                optionalParentSwapIndex = rightIndex
            }
            
            guard let parentSwapIndex = optionalParentSwapIndex else {
                return
            }
            elements.swapAt(parentIndex, parentSwapIndex)
            parentIndex = parentSwapIndex
        }
    }
}

extension Heap {
    func sorted() -> [Element] {
        var heap = Heap(elements, areSorted: areSorted)
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upto: index)
        }
        return heap.elements
    }
}
