import Foundation

struct Node {
    let key: Int
    let left: Int?
    let right: Int?
}

func getHeight(_ node: Int, _ tree: [Node]) -> Int {
    guard node != 0 else { return 0 }
    return 1 + max(getHeight(tree[node].left ?? 0, tree), getHeight(tree[node].right ?? 0, tree))
}

func getBalance(_ node: Int, _ tree: [Node]) -> Int {
    return getHeight(tree[node].right ?? 0, tree) - getHeight(tree[node].left ?? 0, tree)
}

func printBalances(_ tree: [Node]) {
    for i in 1...tree.count {
        print(getBalance(i, tree))
    }
}

let n = Int(readLine()!)!
var tree: [Node] = Array(repeating: Node(key: 0, left: nil, right: nil), count: n + 1)
for i in 1...n {
    let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
    tree[i] = Node(key: line[0], left: line[1], right: line[2])
}

printBalances(tree)
