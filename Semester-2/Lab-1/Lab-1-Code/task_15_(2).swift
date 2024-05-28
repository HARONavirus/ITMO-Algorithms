import Foundation

// Функция для проверки правильности скобочной последовательности
func isBalanced(_ str: String) -> Bool {
    var stack = [Character]()
    for char in str {
        switch char {
        case "(":
            stack.append(")")
        case "[":
            stack.append("]")
        case "{":
            stack.append("}")
        case ")", "]", "}":
            if stack.isEmpty || stack.removeLast() != char {
                return false
            }
        default:
            continue
        }
    }
    return stack.isEmpty
}

// Функция для удаления минимального количества символов, чтобы получить правильную скобочную последовательность
func minDeletions(_ str: String) -> String {
    var dp = Array(repeating: -1, count: str.count)

    // Заполнение таблицы динамического программирования
    for i in 0..<str.count {
        if str[str.index(str.startIndex, offsetBy: i)] == "(" || str[str.index(str.startIndex, offsetBy: i)] == "[" || str[str.index(str.startIndex, offsetBy: i)] == "{" {
            dp[i] = 1
        } else {
            for j in 0..<i {
                if dp[j] != -1 && (str[str.index(str.startIndex, offsetBy: j)] == "(" && str[str.index(str.startIndex, offsetBy: i)] == ")") || (str[str.index(str.startIndex, offsetBy: j)] == "[" && str[str.index(str.startIndex, offsetBy: i)] == "]") || (str[str.index(str.startIndex, offsetBy: j)] == "{" && str[str.index(str.startIndex, offsetBy: i)] == "}") {
                    dp[i] = max(dp[i], dp[j] + 2)
                }
            }
        }
    }

    // Восстановление правильной скобочной последовательности
    var result = ""
    var i = str.count - 1
    while i >= 0 {
        if dp[i] != -1 {
            for j in 0..<i {
                if dp[j] != -1 && (str[str.index(str.startIndex, offsetBy: j)] == "(" && str[str.index(str.startIndex, offsetBy: i)] == ")") || (str[str.index(str.startIndex, offsetBy: j)] == "[" && str[str.index(str.startIndex, offsetBy: i)] == "]") || (str[str.index(str.startIndex, offsetBy: j)] == "{" && str[str.index(str.startIndex, offsetBy: i)] == "}") {
                    result = String(str[str.index(str.startIndex, offsetBy: j)]) + result + String(str[str.index(str.startIndex, offsetBy: i)])
                    i = j - 1
                    break
                }
            }
        }
        i -= 1
    }
    return result
}

// Получение входной строки из консоли
print("Введите строку скобок:")
let input = readLine()!

// Измерение времени выполнения программы
let startTime = Date()
if isBalanced(input) {
    print("Строка уже является правильной скобочной последовательностью.")
} else {
    // Удаление минимального количества символов
    let result = minDeletions(input)

    // Вывод результата в консоль
    print("\nМинимальное количество удалений:", input.count - result.count)
    print("Правильная скобочная последовательность:", result)
}
let endTime = Date()
let timeInterval = endTime.timeIntervalSince(startTime)

// Вывод времени выполнения программы
print("\nВремя выполнения программы:", timeInterval, "секунд")
