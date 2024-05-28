import Foundation

struct Node {
    var key: Int
    var left: Int
    var right: Int
}

var nodes: [Node] = []
var deleted: Set<Int> = []
var sizes: [Int] = []

func main() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        nodes.append(Node(key: line[0], left: line[1], right: line[2]))
    }

    let _ = Int(readLine()!)!
    let keys = readLine()!.split(separator: " ").map { Int($0)! }

    for key in keys {
        delete(key)
        sizes.append(getSize())
    }

    for size in sizes {
        print(size)
    }
}

func delete(_ key: Int) {
    if deleted.contains(key) {
        return
    }

    var stack: [Int] = [1]
    while !stack.isEmpty {
        let node = stack.removeLast()
        if nodes[node - 1].key == key {
            if nodes[node - 1].left != 0 {
                stack.append(nodes[node - 1].left)
            }

            if nodes[node - 1].right != 0 {
                stack.append(nodes[node - 1].right)
            }

            nodes[node - 1].key = -1
            deleted.insert(key)
            return
        } else {
            if nodes[node - 1].key < key && nodes[node - 1].right != 0 {
                stack.append(nodes[node - 1].right)
            } else if nodes[node - 1].key > key && nodes[node - 1].left != 0 {
                stack.append(nodes[node - 1].left)
            }
        }
    }
}

func getSize() -> Int {
    var size = 0
    for node in nodes {
        if node.key != -1 {
            size += 1
        }
    }

    return size
}

main()
