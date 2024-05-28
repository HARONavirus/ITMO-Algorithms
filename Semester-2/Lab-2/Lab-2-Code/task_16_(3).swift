import Foundation

struct Element: Comparable {
    let key: Int
    let index: Int
    
    static func < (lhs: Element, rhs: Element) -> Bool {
        return lhs.key < rhs.key
    }
    
    static func == (lhs: Element, rhs: Element) -> Bool {
        return lhs.key == rhs.key
    }
}

class MaxHeap {
    private var heap: [Element] = []
    private var indexMap: [Int: Int] = [:]
    
    var count: Int {
        return heap.count
    }
    
    func add(_ element: Element) {
        heap.append(element)
        indexMap[element.key] = heap.count - 1
        heapifyUp(index: heap.count - 1)
    }
    
    func remove(_ key: Int) {
        guard let index = indexMap[key] else { return }
        
        heap.swapAt(index, heap.count - 1)
        indexMap[heap[index].key] = index
        heap.removeLast()
        indexMap.removeValue(forKey: key)
        
        heapifyDown(index: index)
    }
    
    func findMax(at index: Int) -> Element {
        return heap[index - 1]
    }
    
    private func heapifyUp(index: Int) {
        var index = index
        while index > 0 {
            let parentIndex = (index - 1) / 2
            if heap[index] > heap[parentIndex] {
                heap.swapAt(index, parentIndex)
                indexMap[heap[index].key] = index
                indexMap[heap[parentIndex].key] = parentIndex
                index = parentIndex
            } else {
                break
            }
        }
    }
    
    private func heapifyDown(index: Int) {
        var index = index
        while 2 * index + 1 < heap.count {
            let leftChildIndex = 2 * index + 1
            let rightChildIndex = 2 * index + 2
            var maxChildIndex = index
            if heap[leftChildIndex] > heap[maxChildIndex] {
                maxChildIndex = leftChildIndex
            }
            if rightChildIndex < heap.count && heap[rightChildIndex] > heap[maxChildIndex] {
                maxChildIndex = rightChildIndex
            }
            if index == maxChildIndex {
                break
            } else {
                heap.swapAt(index, maxChildIndex)
                indexMap[heap[index].key] = index
                indexMap[heap[maxChildIndex].key] = maxChildIndex
                index = maxChildIndex
            }
        }
    }
}

let input = readLine()!
let n = Int(input)!

var heap = MaxHeap()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let command = Int(input[0])!
    let key = Int(input[1])!
    
    switch command {
    case 1:
        heap.add(Element(key: key, index: heap.count))
    case 0:
        print(heap.findMax(at: key).key)
    case -1:
        heap.remove(key)
    default:
        break
    }
}
