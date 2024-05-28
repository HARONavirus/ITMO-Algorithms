import Foundation

// Считываем количество сувениров
print("Введите количество сувениров")
let n = Int(readLine()!)!

// Считываем значения сувениров
print("Введите стоимости каждого сувенира ")
let souvenirs = readLine()!.split(separator: " ").map { Int($0)! }

// Проверяем, можно ли разделить сувениры поровну
var sum = 0
for souvenir in souvenirs {
    sum += souvenir
}

print("\nОтвет:")
if sum % 3 != 0 {
    print(0)
} else {
    let targetSum = sum / 3
    var subsetSums = [0, 0, 0]
    var used = Array(repeating: false, count: n)
    
    // Запускаем таймер
    let startTime = Date()
    
    func backtrack(_ index: Int) {
        if index == n {
            if subsetSums[0] == targetSum && subsetSums[1] == targetSum && subsetSums[2] == targetSum {
                print(1)
                
                // Останавливаем таймер и выводим время выполнения
                let endTime = Date()
                let timeElapsed = endTime.timeIntervalSince(startTime)
                print("Время выполнения: \(timeElapsed) секунд")
                
                exit(0)
            }
            return
        }
        
        for i in 0..<3 {
            if used[index] {
                continue
            }
            
            used[index] = true
            subsetSums[i] += souvenirs[index]
            backtrack(index + 1)
            subsetSums[i] -= souvenirs[index]
            used[index] = false
        }
    }
    
    backtrack(0)
    print(0)
}

