import Foundation

// Структура для представления ребра графа
struct Edge {
    var start: Int
    var end: Int
}

// Функция для проверки двудольности графа с помощью BFS
func isBipartiteGraph(_ n: Int, _ edges: [Edge]) -> Bool {
    var graph = [[Int]](repeating: [], count: n + 1)
    
    // Строим граф
    for edge in edges {
        graph[edge.start].append(edge.end)
        graph[edge.end].append(edge.start)
    }
    
    var colors = [Int](repeating: 0, count: n + 1)
    let visited = [Bool](repeating: false, count: n + 1)
    
    // Функция для BFS
    func bfs(_ node: Int) -> Bool {
        var queue = [Int]()
        queue.append(node)
        colors[node] = 1
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for neighbor in graph[current] {
                if colors[neighbor] == 0 {
                    colors[neighbor] = colors[current] == 1 ? 2 : 1
                    queue.append(neighbor)
                } else if colors[neighbor] == colors[current] {
                    return false
                }
            }
        }
        
        return true
    }
    
    for i in 1...n {
        if !visited[i] {
            if !bfs(i) {
                return false
            }
        }
    }
    
    return true
}

// Ввод данных
print("Введите количество вершин n и количество ребер m:")
if let input = readLine() {
    let values = input.split(separator: " ").map { Int($0)! }
    let n = values[0]
    let m = values[1]
    
    print("Введите ребра графа:")
    var edges = [Edge]()
    for _ in 0..<m {
        if let edgeInput = readLine() {
            let edgeValues = edgeInput.split(separator: " ").map { Int($0)! }
            edges.append(Edge(start: edgeValues[0], end: edgeValues[1]))
        }
    }
    
    // Проверка является ли граф двудольным
    let startTime = Date()
    let isBipartite = isBipartiteGraph(n, edges)
    let endTime = Date()
    let executionTime = endTime.timeIntervalSince(startTime)
    
    // Вывод результата
    print("")
    print(isBipartite ? "1" : "0")
    print("Время выполнения алгоритма: \(executionTime) секунд")
}
