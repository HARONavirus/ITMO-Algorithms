import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinarySearchTree {
    var root: Node?
    
    func insert(_ value: Int) {
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
            } else if value > current!.value {
                if current!.right == nil {
                    current!.right = Node(value: value)
                    return
                } else {
                    current = current!.right
                }
            }
        }
    }
    
    func delete(_ value: Int) {
        if root == nil {
            return
        }
        
        var parent: Node?
        var current = root
        while current != nil && current!.value != value {
            parent = current
            if value < current!.value {
                current = current!.left
            } else {
                current = current!.right
            }
        }
        
        if current == nil {
            return
        }
        
        if current!.left == nil && current!.right == nil {
            if parent == nil {
                root = nil
            } else if parent!.left === current {
                parent!.left = nil
            } else {
                parent!.right = nil
            }
        } else if current!.left == nil {
            if parent == nil {
                root = current!.right
            } else if parent!.left === current {
                parent!.left = current!.right
            } else {
                parent!.right = current!.right
            }
        } else if current!.right == nil {
            if parent == nil {
                root = current!.left
            } else if parent!.left === current {
                parent!.left = current!.left
            } else {
                parent!.right = current!.left
            }
        } else {
            var successor = current!.right
            var successorParent: Node?
            while successor!.left != nil {
                successorParent = successor
                successor = successor!.left
            }
            
            current!.value = successor!.value
            
            if successorParent == nil {
                current!.right = successor!.right
            } else {
                successorParent!.left = successor!.right
            }
        }
    }
    
    func exists(_ value: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var current = root
        while current != nil {
            if value < current!.value {
                current = current!.left
            } else if value > current!.value {
                current = current!.right
            } else {
                return true
            }
        }
        
        return false
    }
    
    func next(_ value: Int) -> Int? {
        if root == nil {
            return nil
        }
        
        var current = root
        var next: Node?
        while current != nil {
            if value < current!.value {
                next = current
                current = current!.left
            } else {
                current = current!.right
            }
        }
        
        return next?.value
    }
    
    func prev(_ value: Int) -> Int? {
        if root == nil {
            return nil
        }
        
        var current = root
        var prev: Node?
        while current != nil {
            if value > current!.value {
                prev = current
                current = current!.right
            } else {
                current = current!.left
            }
        }
        
        return prev?.value
    }
}

let tree = BinarySearchTree()

while let line = readLine() {
    let parts = line.components(separatedBy: " ")
    let operation = parts[0]
    let value = Int(parts[1])!
    
    switch operation {
    case "insert":
        tree.insert(value)
    case "delete":
        tree.delete(value)
    case "exists":
        print(tree.exists(value) ? "true" : "false")
    case "next":
        if let next = tree.next(value) {
            print(next)
        } else {
            print("none")
        }
    case "prev":
        if let prev = tree.prev(value) {
            print(prev)
        } else {
            print("none")
        }
    default:
        break
    }
}

