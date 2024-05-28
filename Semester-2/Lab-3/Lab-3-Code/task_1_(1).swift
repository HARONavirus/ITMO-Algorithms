import Foundation

func DFS(graph: [[Int]], visited: inout [Bool], start: Int, end: Int) -> Bool {
    visited[start] = true

    if start == end {
        return true
    }

    for i in 0..<graph.count {
        if graph[start][i] == 1 && !visited[i] {
            if DFS(graph: graph, visited: &visited, start: i, end: end) {
                return true
            }
        }
    }
    return false
}

func hasPath(graph: [[Int]], start: Int, end: Int) -> Bool {
    var visited = Array(repeating: false, count: graph.count)
    return DFS(graph: graph, visited: &visited, start: start - 1, end: end - 1)
}

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]

var graph = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0] - 1
    let v = edge[1] - 1
    graph[u][v] = 1
    graph[v][u] = 1
}

let vertices = readLine()!.split(separator: " ").map { Int($0)! }
let u = vertices[0]
let v = vertices[1]

print("")
let startTime = Date()
if hasPath(graph: graph, start: u, end: v) {
    print("1")
} else {
    print("0")
}
let endTime = Date()

let timeElapsedInSeconds = endTime.timeIntervalSince(startTime)
print("Время работы алгоритма: \(timeElapsedInSeconds) секунд")



