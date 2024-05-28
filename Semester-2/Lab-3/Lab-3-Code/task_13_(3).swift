import Foundation

// Read input from console
func readInput() -> (Int, Int, [[Character]]) {
    guard let input = readLine()?.split(separator: " ") else {
        fatalError("Invalid input")
    }
    
    let N = Int(input[0])!
    let M = Int(input[1])!
    
    var garden: [[Character]] = []
    for _ in 0..<N {
        guard let row = readLine()?.map({$0}) else {
            fatalError("Invalid input")
        }
        garden.append(row)
    }
    
    return (N, M, garden)
}

// Count the number of beds in the garden
func countBeds(N: Int, M: Int, garden: [[Character]]) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    var bedsCount = 0
    
    func dfs(_ i: Int, _ j: Int) {
        if i < 0 || i >= N || j < 0 || j >= M || garden[i][j] == "." || visited[i][j] {
            return
        }
        
        visited[i][j] = true
        
        // Check all four surrounding cells
        dfs(i+1, j)
        dfs(i-1, j)
        dfs(i, j+1)
        dfs(i, j-1)
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if garden[i][j] == "#" && !visited[i][j] {
                bedsCount += 1
                dfs(i, j)
            }
        }
    }
    
    return bedsCount
}

func main() {
    let (N, M, garden) = readInput()
    
    let startTime = Date()
    
    let bedsCount = countBeds(N: N, M: M, garden: garden)
    
    let endTime = Date()
    let timeElapsed = endTime.timeIntervalSince(startTime)
    
    // Print the number of beds and the time taken
    print("")
    print("Количество грядок: \(bedsCount)")
    print("Время работы алгоритма: \(timeElapsed) секунд")
}

// Run the program
main()
