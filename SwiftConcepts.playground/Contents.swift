//
////var str = "Hello, playground"
////
////
////protocol TraversalNode {
////    associatedtype Element
////    var leftChild: Self? {get}
////}
////
////final class Test<Element> {
////
////}
////
////extension Test: TraversalNode {
////    var leftChild: Test<Element>? {
////        return nil
////    }
////
////
////}
//
//
//// for pengram check
//
//let alphabets = "abcdefghijklmnopqrstuvwxyz"
//func isPengram(_ text: String) -> Bool {
//    let filteredText = text.lowercased().filter({alphabets.contains($0)})
//    print(filteredText)
//    let set = filteredText.reduce(into: Set()){$0.insert($1)}
//    print(set)
//    return set.count == 26
//}
//
//print(isPengram("ankitaa1"))
//
//// another example of using reduce
////https://developer.apple.com/documentation/swift/set/3128854-reduce
//func convertToDict() {
//    let alphabets = "abracadabra"
//    let dictionaryFromAlphabet = alphabets.reduce(into: [:]) { counts, letter in
//        counts[letter, default: 0] += 1
//    }
//    print(dictionaryFromAlphabet)
//}
//
//print(convertToDict())
//
//
//func sortTest(_ array: [Int]) {
//    for i in (1..<array.count).reversed() {
//
//    }
//}
//
//func rightAlign(_ array: inout [Int], for value: Int) -> [Int] {
//    var left = array.startIndex
//    var right = array.endIndex - 1
//
//    while left < right {
//        while array[right] == value {
//            right -= 1
//        }
//        if array[left] == value {
//            array.swapAt(left, right)
//            left += 1
//            right -= 1
//        } else {
//            left += 1
//        }
//    }
//    return array
//}
//
//var arr = [1, 2, 3, 5, 6, 2]
//print(rightAlign(&arr, for: 2))
//
//
//// reversing collection
//extension MutableCollection where Self: BidirectionalCollection {
//    mutating func reverseCollection() {
//        var left = startIndex
//        var right = index(before: endIndex)
//
//        while left < right {
//            swapAt(left, right)
//            formIndex(after: &left)
//            formIndex(before: &right)
//        }
//
//    }
//}
//
//
////print(stringTestReverse.reverseCollection())
//
//var reverseArray = [1, 2, 3, 5]
//reverseArray.reverseCollection()
//print(reverseArray)
//
//// swquence check
//extension Sequence where Element: Hashable {
//    func findDuplicate1st() -> Element? {
////        let duplicate1st = reduce(into: [:]) { (result, element) in
////            result[element, default: 0] += 1
////        }.first(where: {$0.value > 1})
////            print(duplicate1st)
//////        let value = duplicate1st.first(where: {$0.value > 1})
////        return duplicate1st?.key
////
//
//        // or
//        var found: Set<Element> = []
//        for element in self {
//            if found.contains(element) {
//                return element
//            } else {
//                found.insert(element)
//            }
//        }
//        return nil
//    }
//}
//
//// reverse string
//func reverseString(_ text: String) -> String {
//    var reversedText = ""
//    for char in text {
//
////        reversedText.insert(char, at: reversedText.startIndex)
//        // or
//        reversedText = String(char) + reversedText
//        print(char)
//    }
//
//    return reversedText
//}
//
//var stringTestReverse = "ankitta"
//print(stringTestReverse.findDuplicate1st())
////stringTestReverse.reverseSequence()
//print(String(stringTestReverse.reversed()))
//
//
//print(reverseString(stringTestReverse))
//
//
//
////func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
////    var superSetArray = [Int]()
////    var subsetArray = [Int]()
////
////if nums1.count > nums2.count {
////    superSetArray = nums1.sorted()
////    subsetArray = nums2
////} else {
////    superSetArray = nums2.sorted()
////    subsetArray = nums1
////}
////    var finalArray: [Int] = []
////
////    for value in subsetArray {
////        if let foundValue = binarySearch(superSetArray, value) {
////            finalArray.append(foundValue)
////
////            // remove found element
////            if let index = superSetArray.firstIndex(of: foundValue) {
////                superSetArray.remove(at: index)
////            }
////
////        }
////    }
////
//////    print("finalArray \(finalArray)")
////    return finalArray
////}
////
//private func binarySearch(_ sortedArray: [Int], _ element: Int) -> Int? {
//    let middle = sortedArray.count / 2
//    if middle == 0,  sortedArray[middle] != element  { return nil }
//    if sortedArray[middle] == element {
//        return element
//    } else if element < sortedArray[middle] {
//        return binarySearch(Array(sortedArray[..<middle]), element)
//    } else {
//        return binarySearch(Array(sortedArray[middle...]), element)
//    }
//}
//
////[9,4,9,8,4]
////[4,9,5]
////let foundArray = intersect([3,1,2], [1,1])
////print(foundArray)
//
//
//// array operation
//func test(_ array: [Int]) {
//    var arr = array
//    modifyArray(&arr)
//    print(arr)
//}
//
//func modifyArray(_ array: inout [Int]) {
//    for (index, value) in array.enumerated() {
//        if value == 1 {
//            array.remove(at: index)
//        }
//    }
//}
//
//print("Array operation")
//test([1,2,3,4])
//
//// Complexity: O(1) if the collection conforms to RandomAccessCollection;
//// otherwise, O(n), where n is the length of the collection.
//extension RandomAccessCollection where Element: Comparable {
//    func intersect(_ nums1: [Element], _ nums2: [Element]) -> [Element] {
//        var superSetArray = nums1
//        var subSetArray = nums2
//
//        if superSetArray.count < subSetArray.count {
//            superSetArray = nums2
//            subSetArray = nums1
//        }
//
////        superSetArray = superSetArray
//
//        var finalArray = [Element]()
//
//        for value in subSetArray {
//            guard let elementIndex = binarySearch(superSetArray.sorted(), value) else { continue }
//            print("superSetArray elementIndex \(superSetArray.sorted()) \(elementIndex)")
//            finalArray.append(superSetArray[elementIndex])
//
//            // remove element
//            superSetArray.remove(at: elementIndex)
//
//        }
//
//        return finalArray
//    }
//
//    private func binarySearch(_ sortedArray: [Element], _ element: Element) -> Int? {
//        print("binary \(sortedArray) element \(element)")
////        let middle = sortedArray.count / 2
//
//        let middle = sortedArray.count / 2
//        if middle == 0, sortedArray[middle] != element { return nil }
//
//        if sortedArray[middle] == element {
//            return middle
//        } else if element < sortedArray[middle] {
//            return binarySearch(Array(sortedArray[..<middle]), element)
//        } else if element > sortedArray[middle] {
//            return binarySearch(Array(sortedArray[middle...]), element)
//        }
//
//        return nil
//    }
//}
//
//
//let array = [1, 2, 3]
////[9,4,9,8,4]
////[4,9,5]
//let values = array.intersect([1,2,2,1], [2,2])
//print(values)
//
//
//// find repeating elements in a given array
//func repeatingElements(_ array: [Int]) -> [Int] {
//    // O(n)
//    let mappedValues = array.reduce(into: [:]) { result, value in
//        result[value, default: 0] += 1
//    }
//    // O(n)
//    let groupedValues = mappedValues.filter { mappedValue in
//        mappedValue.value > 1
//        }.keys.map({$0})
//    // O(n) + O(n) + O(n)
//    return groupedValues
//}
//
//print("repeatingElements")
//print(repeatingElements([1,2,2,1,3,]))
//
//
//
////func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
////    var finalArray: [Int] = []
////    var array = nums.sorted()
////    for value in array {
////        let valueTobeSearched = target - value
////
////        // perform binary search
////        guard let index = binarySearch(for: valueTobeSearched, in: array, in: nil) else { continue }
//////        if value != valueTobeSearched {
////            finalArray.append(nums.firstIndex(of: index)!)
//////        }
////        // remove element
//////        array.remove(at: nums.firstIndex(of: index)!)
////    }
////    return finalArray
////}
//
//func binarySearch<Elements: RandomAccessCollection> (for element: Elements.Element, in collection: Elements, in range: Range<Elements.Index>? = nil) -> Elements.Element? where Elements.Element: Comparable {
//    let range = range ?? collection.startIndex..<collection.endIndex
//    guard range.lowerBound < range.upperBound else { return nil }
//
//    let size = collection.distance(from: range.lowerBound, to: range.upperBound)
//    let middle = collection.index(range.lowerBound, offsetBy: size / 2)
//
//    if element == collection[middle] {
//        return element
//    } else if element < collection[middle] {
//        return binarySearch(for: element, in: collection, in: range.lowerBound..<middle)
//    } else {
//        return binarySearch(for: element, in: collection, in: collection.index(after: middle)..<range.upperBound)
//    }
//}
//
//func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
//       var dict: [Int: Int] = [:]
//
//       for (i, n) in nums.enumerated() {
//           if let index = dict[target - n] {
//               return [i, index]
//           }
//           dict[n] = i
//       }
//
//       return []
//   }
//
//print(twoSum2([3,2, 4], 6))
//
//
///// string repeat
//var str = "abc"//String(repeating: "a", count: 5)
////str.append("c")
//
////func repeatedString(_ str: String, n: Int)  {
////    var text = str
////    let expectedLoopCount = n / str.count
////    for _ in 0..<expectedLoopCount {
////        for c in str {
////            if text.count < n {
////                text.append(c)
////            } else { break }
////        }
////    }
////
//////    let values = text.reduce(into: <#T##Result#>, <#T##updateAccumulatingResult: (inout Result, Character) throws -> ()##(inout Result, Character) throws -> ()#>)
////}
//
////repeatedString(str, n: 10)
//
//
//func alternatingCharacters(s: String) -> Int {
////    guard s != "" else { return 0}
////    var charRepeatCount = 0
////    guard var currentValue = s.first else {return 0}
////    for i in 1..<s.count {
////        let ii = s.index(s.startIndex, offsetBy: i)
//////        print(s[ii])
////        if currentValue == s[ii] {
////            charRepeatCount += 1
////        } else {
////            currentValue = s[ii]
////        }
////    }
////    return charRepeatCount
//
//    var firstPointer = s.startIndex
//    var secondPointer = s.index(s.startIndex, offsetBy: 1)
//
//    var unmatchedCounter = 0
//    while secondPointer < s.endIndex {
//        if s[firstPointer] != s[secondPointer] {
//            unmatchedCounter += 1
//        }
//
//        firstPointer = s.index(firstPointer, offsetBy: 1)
//        secondPointer = s.index(secondPointer, offsetBy: 1)
//    }
////    let groupNonOccurence = unmatchedCounter
//        return unmatchedCounter
//
////    let pointer = s.index(s.startIndex, offsetBy: 0)
////    let test = s[s.startIndex..<pointer]
//}
//
//print("alternatingCharacters")
////print(alternatingCharacters(s: "AAAAA"))
////print(alternatingCharacters(s: "AABAAB"))
//print(alternatingCharacters(s: "AABAA"))
//
//
//func substrCount(n: Int, s: String) -> Int {
//    var groupIndex = s.startIndex
//    var newString: [String] = []
//    var groupIndexCount = 0
//    while groupIndex < s.endIndex {
//        groupIndex = s.index(s.startIndex, offsetBy: groupIndexCount)
//
//        for (i, value) in s.enumerated() {
//            let initialIndex = String(value).startIndex
//            let text = s[initialIndex..<groupIndex]
//            newString.append(String(text))
//            groupIndex = s.index(groupIndex, offsetBy: i)
//        }
//
//
//        groupIndexCount += 1
//    }
////    print(newString)
//    return 1
//
//}
////
//print("substrCount")
//print(substrCount(n: 0, s: "ABC"))
//
//
//func maxProfit(_ prices: [Int]) -> Int {
//
//    // focus is on finding the profit number, therefore
//    var profit = 0
//    var current = 0
//    for i in 1..<prices.endIndex {
//        current = max(0, current + prices[i] - prices[i - 1])
//        profit = max(profit, current)
//    }
//
//    return profit
//}
//
//print("maxProfit")
//print(maxProfit([7,1,5,3,6, 4]))
//
//
//
//func maxSubArray(_ nums: [Int]) -> Int {
//    var maxValue = 0
//    var current = 0
//    for i in 1..<nums.endIndex {
//        current = max(0, nums[i] + nums[i - 1] + current)
//        maxValue = max(maxValue, current)
//    }
//    return maxValue
//}
//
//print("maxSubArray")
//print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
//
//


//print("countWays")
//print(countWaysOptimised(5))
//
//
//public func magicFast(_ array: [Int]) -> Int {
//    return magicFast(array, in: nil)
//}
//
//print("magicFast")
//print(magicFast([-40, -20, -1, 3, 2, 3, 5, 7, 9, 12, 13]))
//
//
//print("subsets")
//subsets([1,2, 3])
//
//print("multiply")
//print(multiply(5, 4))
//
//
//
//
//print("permute")
//var setArray = [Int]()
//var answers = [[Int]]()
//print(permute([1,2,3], &setArray, &answers))
//
//
//// for checking if the number is prime
//let root = Int(13.0.squareRoot())
//print(root)


// Leetcode
//print("add numbers Linked Node")
//let n1 = ListNode(9)
//let n2 = ListNode(8)
//let n3 = ListNode(7)
////
//n1.next = n2
//n2.next = n3
////
//print(n1)
//print(reverseList(n1))
//print(n1.reverse())
//
//let n4 = ListNode(9)
//let n5 = ListNode(9)
////let n6 = ListNode(4)
//
//n4.next = n5
////n5.next = n6
//
//print(n4)


//public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?)  -> ListNode? {
//    
//    var revl1 = l1?.reverse()
//    var revl2 = l2?.reverse()
//    var newNode: ListNode?
//    var carry = 0
//    while revl1 != nil || revl2 != nil {
//        
//        let sum = carry + (revl1?.val ?? 0) + (revl2?.val ?? 0)
//        carry = Int(sum / 10)
//        
//        if newNode == nil {
//            newNode = ListNode(sum % 10)
//        } else {
//            print(sum % 10)
//            newNode?.appendNode(sum % 10)
//        }
//        
//        
//        revl1 = revl1?.next
//        revl2 = revl2?.next
//    }
//    if carry != 0 {
//        newNode?.appendNode(carry)
//        carry = 0
//    }
//    return newNode
//}

//print(addTwoNumbers(n1, n4)!)

//[2,4,3]
//[5,6,4]

// 3.


//print("lengthOfLongestSubstring")
//print(lengthOfLongestSubstring("pwwkew"))


//print("longestPalindrome")
//print(longestPalindrome("babad"))

let myDictionary = [1: 1, 2: 3, 3: 1]
let sortedByValueDictionary = myDictionary.sorted { $0.1 < $1.1 }
print(sortedByValueDictionary)


//class Test {
//    var testVar: String!
//}


protocol Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza
//  func makeMargherita() -> Pizza
}

struct Pizza {
  let ingredients: [String]
}

extension Pizzeria {
  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "mozzarella"])
  }
}


struct Lombardis: Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza {
    return Pizza(ingredients: ingredients)
  }

  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "basil", "mozzarella"])
  }
}

let lombardis1: Pizzeria = Lombardis()
lombardis1.makeMargherita().ingredients


enum KittenError: Error {
  case NoKitten
}


struct Kitten {
}

func showKitten(kitten: Kitten?) throws {
  guard let k = kitten else {
    print("There is no kitten")
//    return // must // or
//    fatalError()// @noreturn or
    throw KittenError.NoKitten
  }
  print(k)
}

do {
    try showKitten(kitten: nil)
} catch {
    print(error)
}
