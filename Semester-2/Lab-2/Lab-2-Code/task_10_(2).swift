import Foundation

class Node {
    var key: Int
    var left: Node?
    var right: Node?

    init(key: Int, left: Node? = nil, right: Node? = nil) {
        self.key = key
        self.left = left
        self.right = right
    }
}

func isBinarySearchTree(_ root: Node?) -> Bool {
    guard let root = root else { return true }

    if let left = root.left, left.key >= root.key {
        return false
    }

    if let right = root.right, right.key <= root.key {
        return false
    }

    return isBinarySearchTree(root.left) && isBinarySearchTree(root.right)
}

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]

var nodes = [Node]()
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let key = input[0]
    let left = input[1]
    let right = input[2]

    let node = Node(key: key)
    nodes.append(node)

    if left != 0 && left - 1 < nodes.count {
        node.left = nodes[left - 1]
    }

    if right != 0 && right - 1 < nodes.count {
        node.right = nodes[right - 1]
    }
}

let root = nodes[0]

if isBinarySearchTree(root) {
    print("YES")
} else {
    print("NO")
}
