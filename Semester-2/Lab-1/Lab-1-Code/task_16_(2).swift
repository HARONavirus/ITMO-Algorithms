import Foundation

// Читаем входные данные
print("Введите количество городов")
let n = Int(readLine()!)!

var distances = Array(repeating: Array(repeating: 0, count: n), count: n)

print("Введите расстояние между городами через пробел")
for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<n {
        distances[i][j] = line[j]
    }
}

// Находим кратчайший гамильтонов цикл, используя алгоритм ближайшего соседа
var visited = Array(repeating: false, count: n)
var tour = [Int]()
var currentCity = 0
var totalDistance = 0

// Запускаем таймер
let startTime = Date()

while visited.filter({ $0 == true }).count < n {
    // Поиск ближайшего непосещенного города
    var nearestCity = -1
    var nearestDistance = Int.max
    for i in 0..<n {
        if !visited[i] && distances[currentCity][i] < nearestDistance {
            nearestCity = i
            nearestDistance = distances[currentCity][i]
        }
    }

    // Добавление ближайший город в тур и отметка его посещенния
    tour.append(nearestCity)
    visited[nearestCity] = true

    // Обновление текущего города и общего расстояния
    currentCity = nearestCity
    totalDistance += nearestDistance
}

// Останавливаем таймер
let endTime = Date()

// Если мы хотим вернуться обратно в первый город, тогда нужно раскомментировать строку ниже
// totalDistance += distances[tour.last!][tour.first!]

// Print the total distance and the tour
print("\nОбщее расстояние:")
print(totalDistance)
print("Маршрут:")
print(tour.map { String($0 + 1) }.joined(separator: " "))

// Выводим время работы алгоритма
let timeInterval = endTime.timeIntervalSince(startTime)
print("\nВремя работы алгоритма: \(timeInterval) секунд")
