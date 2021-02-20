import Foundation


// 8.1 - 134
// how many ways a child could reach the top of the stairs if she hops in 1, 2 or 3 steps
// O(3 pow n)
public func countWays(_ stairCount: Int) -> Int {
    if stairCount < 0 {
        return 0
    } else if stairCount == 0 {
        return 1
    }
    return countWays(stairCount - 1) + countWays(stairCount - 2) + countWays(stairCount - 3)
}

// now optimise (memoization)
public func countWaysOptimised(_ stairCount: Int) -> Int {
    var array = Array(repeating: -1, count: stairCount + 1)
    return countWays(stairCount, &array)
}

private func countWays(_ n: Int, _ array: inout [Int]) -> Int {
    if n < 0 {
        return 0
    } else if n == 0 {
        return 1
    } else if array[n] != -1 {
        return array[n]
    } else {
        array[n] = countWays(n-1, &array) + countWays(n-2, &array) + countWays(n-3, &array)
        return array[n]
    }
}


// 8.3 magic index
// if range: Range<Int>? then ..<, middle (without -1)
public func magicFast(_ array: [Int], in range: Range<Int>? = nil) -> Int {
    let range = range ?? array.startIndex..<array.endIndex

    let size = array.distance(from: range.lowerBound, to: range.upperBound)
    let middle = array.index(range.lowerBound, offsetBy: size / 2)

    guard range.lowerBound < range.upperBound else { return -1 }

    if array[middle] == middle {
        return middle
    } else if array[middle] < middle {
        // search right
        return magicFast(array, in: array[middle]..<range.upperBound)
    } else {
        // search left
        return magicFast(array, in: range.lowerBound..<array[middle])
    }

}


// 8.4 subset of sets
public func subsets(_ array: [Int]) {
    var subset = Array(repeating: -1, count: array.count)
    helper(array, &subset, 0)
}

func helper(_ array: [Int], _ subset: inout [Int], _ index: Int) {
    if index == array.count {
        print(subset.filter{$0 != -2})
        return
    }
    subset[index] = -2
    helper(array, &subset, index + 1)
    
    subset[index] = array[index]
    helper(array, &subset, index + 1)
}

// 8.5 multiply 2 positive numbers without "*"
public func multiply(_ a: Int, _ b: Int) -> Int {
    let smaller = min(a, b)
    let bigger = max(a, b)
    
    return multiplyHelper(smaller, bigger)
}

private func multiplyHelper(_ smaller: Int, _ bigger: Int) -> Int {
    if smaller == 0 {
        return 0
    } else if smaller == 1 {
        return bigger
    }
    
    let s = smaller / 2
    let halfProd = multiplyHelper(s, bigger)
    
    if smaller % 2 == 0 {
        return halfProd + halfProd
    } else {
        return halfProd + halfProd + halfProd
    }
}

// 8.6 integer permutation O(n * n!)

public func permute(_ nums: [Int], _ setArray: inout [Int], _ answers: inout [[Int]]) -> [[Int]] {
    guard nums.count != 0 else {
        answers.append(setArray)
        return answers
    }
    
    for value in nums {
        let newNums = nums.filter({$0 != value})
        setArray.append(value)
        let _ = permute(newNums, &setArray, &answers)
        setArray.removeAll()
    }
    
    return answers
}
