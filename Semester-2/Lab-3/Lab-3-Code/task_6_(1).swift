import Foundation

func shortestPath(vertices: Int, edges: Int, u: Int, v: Int, graph: [[Int]]) -> Int {
    var queue: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: vertices + 1)
    var distance: [Int] = Array(repeating: 0, count: vertices + 1)

    queue.append(u)
    visited[u] = true

    while queue.count > 0 {
        let node = queue.removeFirst()

        for neighbor in graph[node] {
            if !visited[neighbor] {
                queue.append(neighbor)
                visited[neighbor] = true
                distance[neighbor] = distance[node] + 1
            }
        }
    }

    return visited[v] ? distance[v] : -1
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var graph = Array(repeating: [Int](), count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

let uv = readLine()!.split(separator: " ").map { Int($0)! }
let u = uv[0]
let v = uv[1]

let startTime = Date()

let result = shortestPath(vertices: n, edges: m, u: u, v: v, graph: graph)

let endTime = Date()

print("")
print(result)
print("Время работы алгоритма: \(endTime.timeIntervalSince(startTime))  секунд")
