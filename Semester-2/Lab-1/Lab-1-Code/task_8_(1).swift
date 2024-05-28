import Foundation

// Чтение входных данных
print("Введите количество лекций")
let n = Int(readLine()!)!
print("Введите интервалы лекций")
var intervals = [(Int, Int)]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    intervals.append((line[0], line[1]))
}

// Измерение времени выполнения алгоритма
let startTime = Date()

// Сортировка интервалов по времени окончания
intervals.sort { $0.1 < $1.1 }

// Вычисление максимального количества лекций
var maxCount = 0
var currentEnd = 0
for interval in intervals {
    if interval.0 >= currentEnd {
        maxCount += 1
        currentEnd = interval.1
    }
}

// Вывод результата
print("\nМаксимальное количество заявок:")
print(maxCount)

// Измерение времени выполнения алгоритма
let endTime = Date()
let timeInterval = endTime.timeIntervalSince(startTime)
print("Время выполнения алгоритма: \(timeInterval) секунд")

