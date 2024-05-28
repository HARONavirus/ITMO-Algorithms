import Foundation

// Ввод данных через консоль
print("Введите строку p:")
if let p = readLine() {
    print("Введите строку t:")
    if let t = readLine() {
        let startTime = Date()
        var occurrences: [Int] = []
        
        // Поиск всех вхождений строки p в строку t
        let tLength = t.count
        let pLength = p.count
        for i in 0...(tLength - pLength) {
            let range = t.index(t.startIndex, offsetBy: i)..<t.index(t.startIndex, offsetBy: i + pLength)
            if t[range] == p {
                occurrences.append(i + 1)
            }
        }
        
        let endTime = Date()
        let timeElapsed = endTime.timeIntervalSince(startTime)
        
        // Вывод результатов
        print("")
        print(occurrences.count)
        print(occurrences.map { String($0) }.joined(separator: " "))
        print("Время выполнения: \(timeElapsed) секунд")
    }
}
