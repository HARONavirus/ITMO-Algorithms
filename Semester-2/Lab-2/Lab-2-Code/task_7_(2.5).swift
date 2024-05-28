import Foundation

// Структура узла двоичного дерева
struct Node {
    var key: Int
    var left: Int
    var right: Int
}

// Функция проверки корректности двоичного дерева поиска
func checkBST(_ nodes: [Node]) -> Bool {
    // Проверка корректности пустого дерева
    if nodes.isEmpty {
        return true
    }
    
    // Инициализация стека для обхода дерева
    var stack: [(Int, Int)] = [(0, Int.min)]
    
    // Обход дерева с помощью стека
    while !stack.isEmpty {
        let (nodeIndex, minKey) = stack.popLast()!
        let node = nodes[nodeIndex]
        
        // Проверка корректности ключа текущего узла
        if node.key < minKey {
            return false
        }
        
        // Проверка корректности левого поддерева
        if node.left != -1 {
            stack.append((node.left, minKey))
        }
        
        // Проверка корректности правого поддерева
        if node.right != -1 {
            stack.append((node.right, node.key))
        }
    }
    
    // Если все проверки пройдены, дерево является корректным
    return true
}

// Чтение входных данных
let n = Int(readLine()!)!
var nodes: [Node] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ")
    let key = Int(line[0])!
    let left = Int(line[1])!
    let right = Int(line[2])!
    nodes.append(Node(key: key, left: left, right: right))
}

// Проверка корректности дерева
let isCorrect = checkBST(nodes)

// Вывод результата
print(isCorrect ? "CORRECT" : "INCORRECT")
