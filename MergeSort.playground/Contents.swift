import Cocoa

print("Merge sort")

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    let middle = array.count / 2
    
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    let result = merge(left, right)
    print(result)
    return result
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    var result: [Element] = []
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
            
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if rightElement < leftElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            // when both the elements are equal
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    } 
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}

print(mergeSort([7, 2, 6, 3, 9]))
