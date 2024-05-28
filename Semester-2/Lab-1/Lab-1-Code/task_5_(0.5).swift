import Foundation

func findMaxK(_ n: Int) -> (Int, [Int]) {
    var sum = 0
    var k = 0
    var numbers: [Int] = []

    while sum < n {
        k += 1
        sum += k
        numbers.append(k)
    }

    if sum > n {
        let diff = sum - n
        if diff != k {
            if let index = numbers.firstIndex(of: diff) {
                numbers.remove(at: index)
            }
        }
    }

    return (numbers.count, numbers)
}

func readInput() -> Int? {
    print("Введите число n:")
    if let input = readLine(), let n = Int(input) {
        return n
    } else {
        return nil
    }
}

func printOutput(_ k: Int, _ numbers: [Int]) {
    print("\nКоличество чисел k: \(k)")
    print("Натуральные числа, которые в сумме дают n:")
    print(numbers.map { String($0) }.joined(separator: " "))
}

if let n = readInput() {
    let startTime = Date()
    let result = findMaxK(n)
    let endTime = Date()
    let timeElapsed = endTime.timeIntervalSince(startTime)
    
    printOutput(result.0, result.1)
    print("Время выполнения программы: \(timeElapsed) секунд")
}
