import Foundation


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let node = next else { return "\(val)" }
        return "\(val) ->" + String(describing: node)
    }
}

extension ListNode {
    
    public func reverse() -> ListNode {
        var prev = self
        var current = self.next
        prev.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current!
            current = next
        }
        return prev
    }
    
    public func appendNode(_ value: Int) {
        let new = ListNode(value)
        new.next = nil
        
        var head = self
        while head.next != nil {
            head = head.next!
        }
        head.next = new
    }
}

public func reverseList(_ head: ListNode?) -> ListNode? {
    var prev = head
    var current = head?.next
    prev?.next = nil
    while current != nil {
        let next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return prev
}
//class Solution {

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?)  -> ListNode? {
    
    var revl1 = l1?.reverse()
    var revl2 = l2?.reverse()
    var newNode: ListNode?
    var currentNode: ListNode?
    var carry = 0
    while revl1 != nil || revl2 != nil {
        
        let sum = carry + (revl1?.val ?? 0) + (revl2?.val ?? 0)
        carry = Int(sum / 10)
        
        if newNode == nil {
            newNode = ListNode(sum % 10)
            currentNode = newNode
        }
//        } else {
//            newNode?.appendNode(sum % 10)
            currentNode?.next = ListNode(sum % 10)
            currentNode = currentNode?.next
//        }
        
        
        revl1 = revl1?.next
        revl2 = revl2?.next
    }
    if carry != 0 {
        currentNode?.next = ListNode(carry)
        carry = 0
    }
    return newNode
}

// 3. longest string without repeating
func lengthOfLongestSubstring(_ s: String) -> Int {
 
    var left = s.startIndex
    var right = s.startIndex
    var dict: [Character: Int] = [:]
    var subStringLength = 0
    
    while right < s.endIndex {
        let value = s[right]
        
        if let present = dict[value], present > 0 {
            if  s[s.index(before: right)] != s[right] {
                left = s.index(before: right)
            } else {
                left = right
            }
            
        }
        
        dict[value] = 1
        subStringLength = max(subStringLength, s.distance(from: left, to: right) + 1)
        right = s.index(after: right)
    }
    
    return subStringLength
}

// 5. Longest Palindromic Substring
func longestPalindrome(_ s: String) -> String {
    var longest = 0
    var palindrom = ""
    var left = s.startIndex
    var right = s.startIndex
    
    var i = s.startIndex
    while i <= s.index(before: s.endIndex) {
        left = i
        right = i
        // odd
        while left >= s.startIndex && right < s.endIndex, s[left] == s[right] {
            let range = left..<right
            let size = s.distance(from: range.lowerBound, to: range.upperBound) + 1
            if size > longest {
                longest = size
                palindrom = String(s[left...right])
            }
            
            left = left > s.startIndex ? s.index(before: left) : left
            right = s.index(after: right) //right < s.index(before: s.endIndex) ? s.index(after: right) : right
        }
        
        // for even
        left = i
        right = right < s.index(before: s.endIndex) ? s.index(after: i) : right
        while left >= s.startIndex && right < s.endIndex, s[left] == s[right] {
            let range = left..<right
            let size = s.distance(from: range.lowerBound, to: range.upperBound) + 1
            if size > longest {
                longest = size
                palindrom = String(s[left...right])
            }

            left = left > s.startIndex ? s.index(before: left) : left
            right = s.index(after: right)
        }
        
        i = s.index(after: i)
    }
    return palindrom
}

// 6
func reverse(_ x: Int) -> Int {
    var mainValue = x
    var result = 0
    while mainValue != 0 {
        let pop = mainValue % 10
        mainValue /= 10
        result = result * 10 + pop
        if result > Int32.max || result < Int32.min {
            return 0
        }
    }
    return result
}


// 12 Roman to int
/*values = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}*/
let dict: [String: Int] = ["I": 1,
                           "V": 5,
                           "X" : 10,
                           "L": 50,
                           "C": 100,
                           "D": 500,
                           "M": 1000]

func romanToInt(_ s: String) -> Int {
    var result = 0
    
    var i = s.startIndex
    while i < s.endIndex {//s.index(before: s.endIndex) {
        guard let val1 = dict[String(s[i])] else { return result }// 0th index
        
        guard let val2 = i < s.index(before: s.endIndex) ? dict[String(s[s.index(after: i)])] : 0 else {
            (result += val1)
            return result
        }
        if val1 < val2 {
            result -= val1
        } else {
            result += val1
        }
        i = s.index(after: i)
    }
    
    return result
}

// 19. Remove Nth Node From End of List
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var rightPointer = head
    var n = n
    while n > 0 {
        rightPointer = rightPointer?.next
        n -= 1
    }
    
    let dummy = ListNode(0)
    dummy.next = head
    var leftPointer = dummy
    
    while rightPointer != nil {
        leftPointer = leftPointer.next!
        rightPointer = rightPointer?.next
    }
    
    leftPointer.next = leftPointer.next?.next
    
    return dummy.next
    
}

// 21.
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var tempHead = ListNode(0)
    var current = tempHead
    
    var l1 = l1
    var l2 = l2
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            current.next = l1
            l1 = l1!.next
        } else {
            current.next = l2
            l2 = l2!.next
        }
        current = current.next!
    }
    
    if l1 != nil {
        current.next = l1
        l1 = l1!.next
    }
    
    if l2 != nil {
        current.next = l2
        l2 = l2!.next
    }
    
    return tempHead.next
}

// 23.
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else { return nil }
    return mergeKLists(lists, 0, lists.count - 1)
}

private func mergeKLists(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
    guard start != end else { return lists[start]}
    let mid = (start + end) / 2//start + (end - start) / 2
    var left = mergeKLists(lists, start, mid)
    var right = mergeKLists(lists, mid + 1, end)
    return merge(&left, &right)
}

private func merge(_ l1: inout ListNode?, _ l2: inout ListNode?) -> ListNode? {
    let tempNode = ListNode(0)
    var current = tempNode
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            current.next = l1
            l1 = l1?.next
        } else {
            current.next = l2
            l2 = l2?.next
        }
        current = current.next!
    }
    
    if l1 != nil {
        current.next = l1
        l1 = l1?.next
    }
    
    if l2 != nil {
        current.next = l2
        l2 = l2?.next
    }
    return tempNode.next
}
