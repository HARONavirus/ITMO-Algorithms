import Foundation

// Класс для создания графа и поиска компонентов сильной связности
class StronglyConnectedComponents {
    var graph: [[Int]]
    var n: Int
    var visited: [Bool]
    var reverseGraph: [[Int]]
    var finishTimes: [Int]

    init(n: Int, edges: [[Int]]) {
        self.n = n
        self.graph = Array(repeating: [], count: n)
        self.reverseGraph = Array(repeating: [], count: n)
        self.visited = Array(repeating: false, count: n)
        self.finishTimes = []

        for edge in edges {
            let u = edge[0] - 1
            let v = edge[1] - 1
            graph[u].append(v)
            reverseGraph[v].append(u)
        }
    }

    func explore(node: Int, graph: [[Int]], visited: inout [Bool], finishOrder: inout [Int]) {
        visited[node] = true
        for neigh in graph[node] {
            if !visited[neigh] {
                explore(node: neigh, graph: graph, visited: &visited, finishOrder: &finishOrder)
            }
        }
        finishOrder.append(node)
    }

    func finishTimesDFS() {
        for i in 0..<n {
            if !visited[i] {
                explore(node: i, graph: graph, visited: &visited, finishOrder: &finishTimes)
            }
        }
    }

    func countSCCs() -> Int {
        var sccCount = 0
        finishTimesDFS()
        visited = Array(repeating: false, count: n)

        for i in finishTimes.reversed() {
            if !visited[i] {
                explore(node: i, graph: reverseGraph, visited: &visited, finishOrder: &finishTimes)
                sccCount += 1
            }
        }
        return sccCount
    }
}

if let input = readLine() {
    let data = input.split(separator: " ").map{Int($0)!}
    let n = data[0]
    let m = data[1]
    var edges: [[Int]] = []

    for _ in 0..<m {
        if let edge = readLine() {
            edges.append(edge.split(separator: " ").map{Int($0)!})
        }
    }

    let scc = StronglyConnectedComponents(n: n, edges: edges)
    let startTime = Date()
    let sccCount = scc.countSCCs()
    let endTime = Date()
    let executionTime = endTime.timeIntervalSince(startTime)
    print("")
    print(sccCount)
    print("Время выполнения алгоритма: \(executionTime) секунд")
}
