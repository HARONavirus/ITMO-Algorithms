import Foundation

// Структура для представления узла дерева
struct Node {
    var key: Int
    var left: Int?
    var right: Int?
}

// Функция для создания дерева из входных данных
func createTree(n: Int) -> [Node] {
    var tree = [Node]()
    for _ in 0..<n {
        let line = readLine()!.components(separatedBy: " ")
        let key = Int(line[0])!
        let left = Int(line[1])!
        let right = Int(line[2])!
        tree.append(Node(key: key, left: left == 0 ? nil : left - 1, right: right == 0 ? nil : right - 1))
    }
    return tree
}

// Функция для поиска высоты дерева
func findHeight(root: Int?, tree: [Node]) -> Int {
    guard let root = root else { return 0 }
    return 1 + max(findHeight(root: tree[root].left, tree: tree), findHeight(root: tree[root].right, tree: tree))
}

// Получение входных данных
let n = Int(readLine()!)!
let tree = createTree(n: n)

// Вывод результата
print(findHeight(root: 0, tree: tree))
