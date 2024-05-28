import Foundation

struct Node {
    let key: Int
    let left: Int
    let right: Int
}

func readTree() -> [Node] {
    let n = Int(readLine()!)!
    var nodes = [Node]()
    for _ in 0..<n {
        let line = readLine()!.components(separatedBy: " ")
        nodes.append(Node(key: Int(line[0])!, left: Int(line[1])!, right: Int(line[2])!))
    }
    return nodes
}

func inOrder(nodes: [Node], root: Int) {
    if root == -1 {
        return
    }
    inOrder(nodes: nodes, root: nodes[root].left)
    print(nodes[root].key, terminator: " ")
    inOrder(nodes: nodes, root: nodes[root].right)
}

func preOrder(nodes: [Node], root: Int) {
    if root == -1 {
        return
    }
    print(nodes[root].key, terminator: " ")
    preOrder(nodes: nodes, root: nodes[root].left)
    preOrder(nodes: nodes, root: nodes[root].right)
}

func postOrder(nodes: [Node], root: Int) {
    if root == -1 {
        return
    }
    postOrder(nodes: nodes, root: nodes[root].left)
    postOrder(nodes: nodes, root: nodes[root].right)
    print(nodes[root].key, terminator: " ")
}

let nodes = readTree()
inOrder(nodes: nodes, root: 0)
print()
preOrder(nodes: nodes, root: 0)
print()
postOrder(nodes: nodes, root: 0)

