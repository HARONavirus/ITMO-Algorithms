import Foundation

// Читаем входные данные
print("Введите вместимость сумки W и количество золотых слитков n:")
let input = readLine()!.components(separatedBy: " ")
let W = Int(input[0])!
let n = Int(input[1])!
print("Введите вес каждого золотого слитка:")
let weights = readLine()!.components(separatedBy: " ").map { Int($0)! }

// Создаем таблицу для хранения результатов
var dp = Array(repeating: Array(repeating: 0, count: W + 1), count: n + 1)

// Запускаем таймер
let startTime = Date()

// Заполняем таблицу
for i in 1...n {
    let weight = weights[i - 1]
    for j in 0...W {
        if weight <= j {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - weight] + weight)
        } else {
            dp[i][j] = dp[i - 1][j]
        }
    }
}

// Останавливаем таймер
let endTime = Date()

// Выводим результат
print("\nМаксимально возможный вес:")
print(dp[n][W])

// Выводим время работы алгоритма
let timeInterval = endTime.timeIntervalSince(startTime)
print("Время работы алгоритма: \(timeInterval) секунд")
