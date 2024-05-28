import Foundation

// Считываем входные данные
print("Введите количество объявлений")
let n = Int(readLine()!)!
print("Введите прибыль за клик")
var a = readLine()!.split(separator: " ").map { Int($0)! }
print("Введите среднее количество кликов в день")
var b = readLine()!.split(separator: " ").map { Int($0)! }

// Сортируем массивы в порядке убывания
a.sort(by: >)
b.sort(by: >)

// Запускаем таймер
let startTime = Date()

// Вычисляем максимальный доход
var maxIncome = 0
for i in 0..<n {
    maxIncome += a[i] * b[i]
}

// Останавливаем таймер
let endTime = Date()

// Выводим максимальный доход и время выполнения алгоритма
print("\nМаксимальный доход:")
print(maxIncome)
print("Время выполнения алгоритма:")
print(String(endTime.timeIntervalSince(startTime)) + " секунд")

