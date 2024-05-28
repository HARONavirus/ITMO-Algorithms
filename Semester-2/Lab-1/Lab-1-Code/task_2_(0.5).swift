import Foundation


func minRefills(d: Int, m: Int, n: Int, stops: [Int]) -> Int {
    let startTime = Date() // Записываем время начала выполнения алгоритма
    
    var numRefills = 0
    var currentRefill = 0
    var stops = stops
    stops.insert(0, at: 0)
    stops.append(d)
    
    while currentRefill <= n {
        let lastRefill = currentRefill
        
        while currentRefill <= n && stops[currentRefill + 1] - stops[lastRefill] <= m {
            currentRefill += 1
        }
        
        if currentRefill == lastRefill {
            return -1
        }
        
        if currentRefill <= n {
            numRefills += 1
        }
    }
    
    let endTime = Date() // Записываем время окончания выполнения функции
    let executionTime = endTime.timeIntervalSince(startTime) // Вычисляем время выполнения функции
    print("\nВремя выполнени алгоритма: \(executionTime) секунд")
    
    return numRefills
}

print("Введите полную дистанцию (d):")
if let distanceInput = readLine(), let d = Int(distanceInput) {
    print("Введите расстояние, которое может преодалет автомобиль без остановок (m):")
    if let maxDistanceInput = readLine(), let m = Int(maxDistanceInput) {
        print("Введите количество остановок:")
        if let stopsCountInput = readLine(), let stopsCount = Int(stopsCountInput) {
            var stops = [Int]()
            for i in 1...stopsCount {
                print("Введите километр, на котором находится остановка \(i):")
                if let stopInput = readLine(), let stopPosition = Int(stopInput) {
                    stops.append(stopPosition)
                } else {
                    print("Ошибка при считывании расположения остановки. Пожалуйста, введите допустимое целочисленное значение.")
                    break
                }
            }
            
            let stopsNeeded = minRefills(d: d, m: m, n: stopsCount, stops: stops)
            
            if stopsNeeded == -1 {
                print("Невозможно проехать всю дистанцию.\nОтвет: \(stopsNeeded)")
            } else {
                print("Нужно: \(stopsNeeded) остановок")
            }
        } else {
            print("Ошибка при считывании количества остановок. Пожалуйста, введите допустимое целое значение.")
        }
    } else {
        print("Ошибка при показании максимального расстояния между остановками. Пожалуйста, введите допустимое целочисленное значение.")
    }
} else {
    print("Ошибка при считывании общего расстояния. Пожалуйста, введите допустимое целочисленное значение.")
}
