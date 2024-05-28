import Foundation

// Чтение ввода с консоли
print("Введите кол-во чисел")
let n = Int(readLine()!)!
print("Введите сами числа через пробел")
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

// Функция для сравнения двух чисел
func compare(a: Int, b: Int) -> Bool {
    // преобразование Интов в строки
    let aString = String(a)
    let bString = String(b)

    // Создание двух разных строк путем соединения двух строк в разном порядке
    let ab = aString + bString
    let ba = bString + aString

    // Сравнивание двух новых строк
    return ab > ba
}

// Запуск таймера
let startTime = Date()

// Сортировка чисел в порядке убывания
numbers.sort(by: compare)

// Остановка таймера
let endTime = Date()

// Вычисление затраченного на работу алгоритма времени
let elapsedTime = endTime.timeIntervalSince(startTime)

// Вывод наибольшего числа и затраченного времени
print("\nНаибольшее число из ваших чисел:")
print(numbers.map { String($0) }.joined())
print("Затраченное время: \(elapsedTime) секунд")
