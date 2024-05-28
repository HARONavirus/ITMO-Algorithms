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
    private var root: Node?

    func add(_ value: Int) {
        if root == nil {
            root = Node(value: value)
            return
        }
        var current = root
        while true {
            if value < current!.value {
                if current!.left == nil {
                    current!.left = Node(value: value)
                    return
                } else {
                    current = current!.left
                }
            } else {
                if current!.right == nil {
                    current!.right = Node(value: value)
                    return
                } else {
                    current = current!.right
                }
            }
        }
    }

    func findGreaterThan(_ value: Int) -> Int? {
        var current = root
        var result: Int? = nil
        while current != nil {
            if value < current!.value {
                result = current!.value
                current = current!.left
            } else {
                current = current!.right
            }
        }
        return result
    }
}

let bst = BST()
while let line = readLine() {
    let parts = line.components(separatedBy: " ")
    switch parts[0] {
    case "+":
        bst.add(Int(parts[1])!)
    case ">":
        if let result = bst.findGreaterThan(Int(parts[1])!) {
            print(result)
        } else {
            print(0)
        }
    default:
        break
    }
}
