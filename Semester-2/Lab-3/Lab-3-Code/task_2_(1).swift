import Foundation

class Graph {
    var vertices: Int
    var edges: Int
    var adjList: [[Int]]
    var visited: [Bool]

    init(vertices: Int, edges: Int) {
        self.vertices = vertices
        self.edges = edges
        self.adjList = Array(repeating: [], count: vertices + 1)
        self.visited = Array(repeating: false, count: vertices + 1)
    }

    func addEdge(_ u: Int, _ v: Int) {
        adjList[u].append(v)
        adjList[v].append(u)
    }

    func dfs(_ v: Int) {
        visited[v] = true
        for u in adjList[v] {
            if !visited[u] {
                dfs(u)
            }
        }
    }

    func countConnectedComponents() -> Int {
        var count = 0
        for v in 1...vertices {
            if !visited[v] {
                count += 1
                dfs(v)
            }
        }
        return count
    }
}

func readInput() -> (Int, Int) {
    guard let input = readLine() else { fatalError("Failed to read input") }
    let values = input.split(separator: " ").map { Int($0)! }
    return (values[0], values[1])
}

let (n, m) = readInput()
let graph = Graph(vertices: n, edges: m)

for _ in 0..<m {
    let edge = readInput()
    graph.addEdge(edge.0, edge.1)
}

let startTime = Date().timeIntervalSince1970
let connectedComponents = graph.countConnectedComponents()
let endTime = Date().timeIntervalSince1970
let elapsedTime = endTime - startTime

print("")
print("Количество компонент связности: \(connectedComponents)")
print("Время выполнения программы: \(elapsedTime) секунд")
