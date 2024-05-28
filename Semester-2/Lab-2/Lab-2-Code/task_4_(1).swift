import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int) {
        self.value = value
    }
}

class BST {
    var root: Node?

    func insert(value: Int) {
        var current = root

        while current != nil {
            if value < current!.value {
                if current!.left == nil {
                    current!.left = Node(value: value)
                    return
                } else {
                    current = current!.left
                }
            } else if value > current!.value {
                if current!.right == nil {
                    current!.right = Node(value: value)
                    return
                } else {
                    current = current!.right
                }
            } else {
                return
            }
        }

        root = Node(value: value)
    }

    func findKth(k: Int) -> Int? {
        var current = root
        var count = 0

        while current != nil {
            if count < k {
                if current!.left != nil {
                    current = current!.left
                } else {
                    count += 1
                    if count == k {
                        return current!.value
                    }
                    current = current!.right
                }
            } else {
                return current!.value
            }
        }

        return nil
    }
}

var bst = BST()

while let line = readLine() {
    let parts = line.components(separatedBy: " ")

    switch parts[0] {
    case "+":
        bst.insert(value: Int(parts[1])!)
    case "?":
        if let kth = bst.findKth(k: Int(parts[1])!) {
            print(kth)
        }
    default:
        break
    }
}
