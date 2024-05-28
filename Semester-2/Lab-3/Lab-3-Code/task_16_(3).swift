import Foundation

var recursionDictionary: [String: Bool] = [:]
var procedures: [String] = []

func isPotentiallyRecursive(_ procedure: String, _ graph: inout [String: [String]]) -> Bool {
    if recursionDictionary.keys.contains(procedure) {
        return recursionDictionary[procedure] ?? false
    }
    
    if let proceduresToCall = graph[procedure] {
        for proc in proceduresToCall {
            if proc == procedures[0] {
                recursionDictionary[procedure] = true
                return true
            } else {
                if isPotentiallyRecursive(proc, &graph) {
                    recursionDictionary[procedure] = true
                    return true
                }
            }
        }
    }
    
    recursionDictionary[procedure] = false
    return false
}

func checkRecursion(_ numOfProcedures: Int, _ procedureDetails: [[String]]) {
    var graph: [String: [String]] = [:]
    
    for detail in procedureDetails {
        let currentProcedure = detail[0]
        let numCalls = Int(detail[1]) ?? 0
        var calls: [String] = []
        
        for i in 2...numCalls + 1 {
            calls.append(detail[i])
        }
        
        graph[currentProcedure] = calls
    }
    
    for procedure in procedures {
        let result = isPotentiallyRecursive(procedure, &graph)
        if result {
            print("YES")
        } else {
            print("NO")
        }
    }
}

if let input = readLine() {
    if let numberOfProcedures = Int(input) {
        for _ in 0..<numberOfProcedures {
            if let procedureID = readLine(), let numToCall = readLine() {
                let num = Int(numToCall) ?? 0
                var procedureDetails: [String] = [procedureID, numToCall]
                for _ in 0..<num {
                    if let proc = readLine() {
                        procedureDetails.append(proc)
                    }
                }
                procedures.append(procedureID)
                checkRecursion(numberOfProcedures, [procedureDetails])
            }
        }
    }
}
