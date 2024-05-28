import Foundation

// Чтение входных данных из консоли
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let d = input[1]
let v = input[2]
let r = input[3]

// Инициализация переменной, представляющей минимальное время для прибытия в деревню v
var minArrivalTime = Int.max

// Считываем описания автобусных рейсов
for _ in 0..<r {
    let route = readLine()!.split(separator: " ").map { Int($0)! }
    // Проверяем, является ли этот рейс подходящим для Марии Ивановны
    if route[0] == d && route[2] == v {
        // Обновляем минимальное время прибытия
        minArrivalTime = min(minArrivalTime, route[3])
    }
}

// Вывод результата в консоль
if minArrivalTime == Int.max {
    print("-1")
} else {
    print(minArrivalTime)
}
