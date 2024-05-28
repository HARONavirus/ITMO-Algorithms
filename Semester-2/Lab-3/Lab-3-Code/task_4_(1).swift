import Foundation

func topologicalSort(_ graph: [[Int]]) -> [Int] {
    var inDegree = [Int](repeating: 0, count: graph.count)
    for neighbors in graph {
        for neighbor in neighbors {
            inDegree[neighbor] += 1
        }
    }
    
    var queue = [Int]()
    for i in 0..<graph.count {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }
    
    var result = [Int]()
    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node)
        for neighbor in graph[node] {
            inDegree[neighbor] -= 1
            if inDegree[neighbor] == 0 {
                queue.append(neighbor)
            }
        }
    }
    
    return result
}

func calculateExecutionTime(block: () -> Void) {
    let startTime = Date()
    block()
    let endTime = Date()
    let executionTime = endTime.timeIntervalSince(startTime)
    print("Время выполнения алгоритма: \(executionTime) секунд")
}

func main() {
    guard let input = readLine() else { return }
    let values = input.split(separator: " ").compactMap { Int($0) }
    let n = values[0]
    let m = values[1]
    
    var graph = [[Int]](repeating: [], count: n)
    
    for _ in 0..<m {
        guard let edgeInput = readLine() else { return }
        let edge = edgeInput.split(separator: " ").compactMap { Int($0) }
        if edge.count == 2 {
            graph[edge[0] - 1].append(edge[1] - 1)
        }
    }
    
    calculateExecutionTime {
        let result = topologicalSort(graph)
        print("")
        print(result.map { String($0 + 1) }.joined(separator: " "))
    }
}

main()
