import Foundation

func prefixFunction(_ input: String) -> [Int] {
    var result = [Int](repeating: 0, count: input.count)
    let s = Array(input)

    var i = 1
    var j = 0

    while i < s.count {
        if s[i] == s[j] {
            j += 1
            result[i] = j
            i += 1
        } else {
            if j != 0 {
                j = result[j - 1]
            } else {
                result[i] = 0
                i += 1
            }
        }
    }

    return result
}

func main() {
    print("Введите строку:")
    if let input = readLine() {
        // Засекаем время начала
        let startTime = Date()

        let pf = prefixFunction(input)
        print("\nВывод:")
        for value in pf {
            print("\(value)", terminator: " ")
        }

        // Рассчитываем прошедшее время и выводим его в секундах
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(startTime)
        print("\nВремя выполнения: \(elapsedTime) секунд")
    }
}

// Вызов основной функции
main()
