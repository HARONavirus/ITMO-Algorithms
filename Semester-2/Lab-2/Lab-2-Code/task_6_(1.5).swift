import Foundation

// Считываем количество узлов из первой строки
let n = Int(readLine()!)!

// Создаем массив для хранения узлов
var nodes = Array(repeating: Node(key: 0, left: -1, right: -1), count: n)

// Считываем данные узлов из следующих n строк
for i in 0..<n {
    let line = readLine()!.split(separator: " ")
    nodes[i].key = Int(line[0])!
    nodes[i].left = Int(line[1])!
    nodes[i].right = Int(line[2])!
}

// Проверяем, является ли дерево правильным двоичным деревом поиска
if isBinarySearchTree(nodes: nodes, root: 0) {
    print("CORRECT")
} else {
    print("INCORRECT")
}

// Функция для проверки, является ли дерево правильным двоичным деревом поиска
func isBinarySearchTree(nodes: [Node], root: Int) -> Bool {
    // Если это пустое дерево
    if root == -1 {
        return true
    }
    
    // Проверяем левое поддерево
    if nodes[root].left != -1 && nodes[nodes[root].left].key >= nodes[root].key {
        return false
    }
    
    // Проверяем правое поддерево
    if nodes[root].right != -1 && nodes[nodes[root].right].key <= nodes[root].key {
        return false
    }
    
    // Рекурсивно проверяем левое и правое поддеревья
    return isBinarySearchTree(nodes: nodes, root: nodes[root].left) && isBinarySearchTree(nodes: nodes, root: nodes[root].right)
}

// Структура для представления узла дерева
struct Node {
    var key: Int
    var left: Int
    var right: Int
}
