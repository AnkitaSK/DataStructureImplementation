import Foundation

public extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        // check if range was not nil
        let range = range ?? startIndex..<endIndex
        
        // check if range has atleast 1 value
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        // find the middle index
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size/2)
        
        // check if the value is in middle, left or right
        if value == self[middle] {
            return middle
        } else if value < self[middle] {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}
