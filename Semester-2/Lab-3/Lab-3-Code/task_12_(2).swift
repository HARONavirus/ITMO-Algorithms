import Foundation

// Structure to represent a corridor
struct Corridor {
    let room1: Int
    let room2: Int
    let color: Int
}

// Main function to check the validity of the path
func checkPathValidity(n: Int, m: Int, corridors: [Corridor], pathLength: Int, path: [Int]) {
    var currentRoom = 1

    for color in path {
        var foundCorridor = false

        for corridor in corridors {
            if corridor.room1 == currentRoom && corridor.color == color {
                currentRoom = corridor.room2
                foundCorridor = true
                break
            } else if corridor.room2 == currentRoom && corridor.color == color {
                currentRoom = corridor.room1
                foundCorridor = true
                break
            }
        }

        if !foundCorridor {
            print("")
            print("INCORRECT")
            return
        }
    }

    print("")
    print(currentRoom)
}

// Read input
if let input = readLine() {
    let parts = input.components(separatedBy: " ")
    let n = Int(parts[0]) ?? 0
    let m = Int(parts[1]) ?? 0

    var corridors = [Corridor]()
    for _ in 0..<m {
        if let corridorInput = readLine() {
            let corridorParts = corridorInput.components(separatedBy: " ")
            let room1 = Int(corridorParts[0]) ?? 0
            let room2 = Int(corridorParts[1]) ?? 0
            let color = Int(corridorParts[2]) ?? 0
            corridors.append(Corridor(room1: room1, room2: room2, color: color))
        }
    }

    if let pathLengthInput = readLine() {
        let pathLength = Int(pathLengthInput) ?? 0

        if let pathInput = readLine() {
            let path = pathInput.components(separatedBy: " ").compactMap { Int($0) }
            
            checkPathValidity(n: n, m: m, corridors: corridors, pathLength: pathLength, path: path)
        }
    }
}
