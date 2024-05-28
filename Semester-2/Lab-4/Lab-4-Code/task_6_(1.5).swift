import Foundation

func calculateZArray(_ string: String) -> [Int] {
    let n = string.count
    var z = [Int](repeating: 0, count: n)
    var l = 0, r = 0
    
    for i in 1..<n {
        if i <= r {
            z[i] = max(0, min(r - i + 1, z[i - l]))
        }
        while i + z[i] < n, string[string.index(string.startIndex, offsetBy: z[i])] == string[string.index(string.startIndex, offsetBy: i + z[i])] {
            z[i] += 1
        }
        if i + z[i] - 1 > r {
            l = i
            r = i + z[i] - 1
        }
    }
    return z
}

func main() {
    if let input = readLine() {
        let zValues = calculateZArray(input)
        print("")
        print(zValues.map{ String($0) }.joined(separator: " "))
    }
}

let startDate = Date()
main()
let endDate = Date()
let executionTime = endDate.timeIntervalSince(startDate)
print("Время работы алгоритма \(executionTime) секунд")
