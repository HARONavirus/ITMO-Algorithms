import Foundation

func rabinKarp(pattern: String, text: String) {
    let prime: UInt64 = 101 // Простое число для вычислений
    let patternLength = pattern.count
    let textLength = text.count
    var results: [Int] = []

    // Функция хеширования строки
    func hash(_ str: String) -> UInt64 {
        var hashValue: UInt64 = 0
        for char in str.unicodeScalars {
            hashValue = (hashValue * prime + UInt64(char.value))
        }
        return hashValue
    }

    let patternHash = hash(pattern)
    var textHash = hash(String(text.prefix(patternLength)))

    // Пересчитываем хеш и сравниваем подстроки
    for i in 0...(textLength - patternLength) {
        if patternHash == textHash, pattern == String(text[text.index(text.startIndex, offsetBy: i)..<text.index(text.startIndex, offsetBy: i + patternLength)]) {
            results.append(i + 1)
        }
        if i < textLength - patternLength {
            textHash = textHash - UInt64(text.unicodeScalars[text.unicodeScalars.index(text.unicodeScalars.startIndex, offsetBy: i)].value)
            textHash = textHash/prime
            textHash += UInt64(text.unicodeScalars[text.unicodeScalars.index(text.unicodeScalars.startIndex, offsetBy: i + patternLength)].value) * UInt64(pow(Double(prime), Double(patternLength - 1)))
        }
    }

    print(results.count)
    for result in results {
        print(result, terminator: " ")
    }
    print("")
}

// Введите паттерн и текст через консоль
if let pattern = readLine(), let text = readLine() {
    let startTime = Date() // Засекаем начало выполнения программы
    print("")
    rabinKarp(pattern: pattern, text: text)
    let endTime = Date() // Засекаем конец выполнения программы
    let executionTime = endTime.timeIntervalSince(startTime) // Вычисляем время выполнения
    print("Время работы программы: \(executionTime) секунд")
}
