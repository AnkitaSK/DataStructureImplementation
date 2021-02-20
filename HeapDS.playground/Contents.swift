print("Heap data structure")

var heap = Heap(sort: >, elements: [1, 12, 3, 4, 1, 6, 8, 7, 1])
while !heap.isEmpty {
    print(heap.remove()!)
}
