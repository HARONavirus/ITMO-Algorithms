import Foundation

// Структура для представления графа
struct Graph {
    let vertices: Int
    var adjList: [[Int]]

    init(vertices: Int) {
        self.vertices = vertices
        adjList = Array(repeating: [], count: vertices)
    }

    mutating func addEdge(_ u: Int, _ v: Int) {
        adjList[u].append(v)
    }

    // Функция для проверки цикла
    func hasCycle() -> Bool {
        var visited = Array(repeating: false, count: vertices)
        var recursionStack = Array(repeating: false, count: vertices)

        func isCyclic(_ v: Int) -> Bool {
            if !visited[v] {
                visited[v] = true
                recursionStack[v] = true

                for neighbour in adjList[v] {
                    if !visited[neighbour] && isCyclic(neighbour) {
                        return true
                    } else if recursionStack[neighbour] {
                        return true
                    }
                }
            }

            recursionStack[v] = false
            return false
        }

        for vertex in 0..<vertices {
            if isCyclic(vertex) {
                return true
            }
        }

        return false
    }
}

// Ввод графа
func inputGraph() -> Graph? {
    if let input = readLine() {
        let params = input.split(separator: " ").compactMap { Int($0) }
        let vertices = params[0]
        let edges = params[1]
        var graph = Graph(vertices: vertices)

        for _ in 0..<edges {
            if let edgeInput = readLine() {
                let edgeParams = edgeInput.split(separator: " ").compactMap { Int($0) }
                graph.addEdge(edgeParams[0] - 1, edgeParams[1] - 1)
            }
        }

        return graph
    }

    return nil
}

if let graph = inputGraph() {
    let startTime = DispatchTime.now()
    let hasCycle = graph.hasCycle()
    let endTime = DispatchTime.now()
    let timeInterval = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / 1_000_000_000
    print("")

    if hasCycle {
        print("1")
    } else {
        print("0")
    }
    print("Время работы алгоритма: \(timeInterval) секунд")
}
