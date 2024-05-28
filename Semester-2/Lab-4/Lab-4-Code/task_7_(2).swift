import Foundation

// Function to the longest common substring using binary search
func longestCommonSubstring(_ s: String, _ t: String) -> (Int, Int, Int) {
    var maxLength = 0
    var startS = 0
    var startT = 0
    
    // Function to calculate the hash of a string substring
    func hash(str: String, start: Int, length: Int) -> Int {
        var hashValue = 0
        for i in start..<(start + length) {
            let char = str[str.index(str.startIndex, offsetBy: i)]
            hashValue = hashValue * 31 + Int(char.asciiValue ?? 0)
        }
        return hashValue
    }
    
    // Binary search to find the longest common substring
    func binarySearch(s: String, t: String, len: Int) -> (Int, Int) {
        var hashTable = Set<Int>()
        let base = 31
        var power = 1
        for _ in 0..<len - 1 {
            power *= base
        }
        
        for i in 0...(s.count - len) {
            let h = hash(str: s, start: i, length: len)
            hashTable.insert(h)
        }
        
        for j in 0...(t.count - len) {
            let h = hash(str: t, start: j, length: len)
            if hashTable.contains(h) {
                return (j, h)
            }
        }
        return (-1, -1)
    }
    
    var left = 1
    var right = min(s.count, t.count) + 1
    
    while left < right {
        let mid = left + (right - left) / 2
        let res = binarySearch(s: s, t: t, len: mid)
        if res.0 != -1 {
            maxLength = mid
            startS = res.1
            startT = res.0
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return (startS, startT, maxLength)
}

// Reading input from console
if let input = readLine() {
    let inputs = input.split(separator: " ")
    let s = String(inputs[0])
    let t = String(inputs[1])
    
    // Measure the execution time
    let start = DispatchTime.now()
    
    // Finding the longest common substring
    let result = longestCommonSubstring(s, t)
    
    // Calculating the elapsed time
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    
    // Output the result along with the elapsed time
    print("")
    print("\(result.0) \(result.1) \(result.2) - Время работы алгоритма: \(timeInterval) секунд")
}
