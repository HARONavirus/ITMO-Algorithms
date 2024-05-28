import Foundation

// Считываем входные данные
print("Введите количество отрезков")
let n = Int(readLine()!)!
var segments = [(Int, Int)]()
print("Введите координаты концов отрезков")
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    segments.append((line[0], line[1]))
}

// Запускаем таймер
let startTime = Date()

// Сортируем отрезки по правому концу
segments.sort { $0.1 < $1.1 }

// Вычисляем минимальное количество точек
var points = [Int]()
var right = -1
for segment in segments {
    if segment.0 > right {
        points.append(segment.1)
        right = segment.1
    }
}

// Останавливаем таймер
let endTime = Date()

// Выводим результат
print("\nМинимальное количество точек")
print(points.count)
print("Целочисленные координаты этих точек")
print(points.map { String($0) }.joined(separator: " "))

// Выводим время работы алгоритма
let timeInterval = endTime.timeIntervalSince(startTime)
print("Время работы алгоритма: \(timeInterval) секунд")

