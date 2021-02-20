
print("Binary Search")


let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
//let search31 = array.firstIndex(of: 31) // this is done using a linear search - O(n) - worst case
let binarySearch31 = array.binarySearch(for: 31) // O(logN)

//print("firstIndex(of:): \(search31)")
//print("binarySearch(for:): \(binarySearch31)")

// 1. binary search as free function
func binarySearch<Elements: RandomAccessCollection>(for value: Elements.Element, in collection: Elements, in range: Range<Elements.Index>? = nil) -> Elements.Index? where Elements.Element: Comparable {
    let range = range ?? collection.startIndex..<collection.endIndex
    
    guard range.lowerBound < range.upperBound else { return nil }
//    print("range.lowerBound \(range.lowerBound )")
//    print("range.upperBound \(range.upperBound)")
    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
    let middle = collection.index(range.lowerBound, offsetBy: size / 2)
    
    if value == collection[middle] {
//        print("collection value = \(collection)")
        return middle
    } else if value < collection[middle] {
//        print("collection value < \(collection)")
        return binarySearch(for: value, in: collection, in: range.lowerBound..<middle)
    } else {
//        print("collection value > \(collection)")
        return binarySearch(for: value, in: collection, in: collection.index(after: middle)..<range.upperBound)
    }
}



let array2 = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let binarySearch22 = binarySearch(for: 19, in: array2, in: nil) // O(logN)

//print("binarySearch(for: 22): \(binarySearch22)")


// 2. searching for range
func findIndices(of value: Int, in array: [Int]) -> CountableRange<Int>? {
    guard let firstIndex = startIndex(of: value, array: array, range: 0..<array.count) else {
        return nil
    }
    guard let lastIndex = endIndex(of: value, array: array, range: 0..<array.count) else {
        return nil
    }
    return firstIndex..<lastIndex
}

private func startIndex(of value: Int, array: [Int], range: CountableRange<Int>) -> Int? {
    
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if middleIndex == 0 || middleIndex == array.count - 1 {
        if array[middleIndex] == value {
            return middleIndex
        } else {
            return nil
        }
    }
    
    if array[middleIndex] == value {
        if array[middleIndex - 1] != value {
            return middleIndex
        } else {
            startIndex(of: value, array: array, range: range.lowerBound..<middleIndex)
        }
    } else if value < array[middleIndex] {
        startIndex(of: value, array: array, range: range.lowerBound..<middleIndex)
    } else {
        startIndex(of: value, array: array, range: middleIndex..<range.upperBound)
    }
    return nil
}

private func endIndex(of value: Int, array: [Int], range: CountableRange<Int>) -> Int? {
    
    let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if middleIndex == 0 || middleIndex == array.count - 1 {
        if array[middleIndex] == value {
            return middleIndex + 1
        } else {
            return nil
        }
    }
    
    if array[middleIndex] == value {
        if array[middleIndex + 1] != value { // checks the next value
            return middleIndex + 1
        } else {
            startIndex(of: value, array: array, range: middleIndex..<range.upperBound)
        }
    } else if value < array[middleIndex] {
        startIndex(of: value, array: array, range: range.lowerBound..<middleIndex)
    } else {
        startIndex(of: value, array: array, range: middleIndex..<range.upperBound)
    }
    return nil
}


let array3 = [1, 2, 3, 3, 3, 4, 5, 5]
if let indices = findIndices(of: 3, in: array3) {
    print(indices)
} else {
    print("no indices")
}
