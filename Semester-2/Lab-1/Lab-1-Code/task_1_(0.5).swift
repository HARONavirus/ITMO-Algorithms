import Foundation

// Структура для хранения информации о предмете
struct Item {
    let weight: Int
    let value: Int
}

// Функция для сортировки предметов по убыванию отношения ценности к весу
func sortByValueToWeightRatio(_ items: [Item]) -> [Item] {
    return items.sorted { (item1, item2) -> Bool in
        let ratio1 = Double(item1.value) / Double(item1.weight)
        let ratio2 = Double(item2.value) / Double(item2.weight)
        return ratio1 > ratio2
    }
}

// Функция для решения задачи о дробном рюкзаке
func fractionalKnapsack(_ items: [Item], capacity: Int) -> Double {
    // Сортируем предметы по убыванию отношения ценности к весу
    let sortedItems = sortByValueToWeightRatio(items)
    
    // Инициализируем переменную для хранения текущего веса рюкзака
    var currentWeight = 0
    
    // Инициализируем переменную для хранения максимальной стоимости
    var maxValue = 0.0
    
    // Перебираем предметы в отсортированном порядке
    for item in sortedItems {
        // Если текущий вес рюкзака плюс вес предмета не превышает вместимость рюкзака,
        // то добавляем предмет в рюкзак
        if currentWeight + item.weight <= capacity {
            currentWeight += item.weight
            maxValue += Double(item.value)
        }
        // Иначе добавляем в рюкзак только часть предмета, которая помещается
        else {
            let remainingCapacity = capacity - currentWeight
            maxValue += Double(item.value) * Double(remainingCapacity) / Double(item.weight)
            break
        }
    }
    
    return maxValue
}

// Считываем входные данные
print("Введите количество предметов и вместимость сумки через пробел")
let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]
let capacity = input[1]

// Создаем массив предметов
print("Введите вес и стоимость предметов через пробел")
var items: [Item] = []
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    items.append(Item(weight: input[1], value: input[0]))
}

// Запускаем таймер
let startTime = Date()

// Вычисляем максимальную стоимость
let maxValue = fractionalKnapsack(items, capacity: capacity)

// Останавливаем таймер
let endTime = Date()

// Выводим результат
print("\nМаксимальное значение стоимости доли добычи:")
print(String(format: "%.4f", maxValue))

// Выводим время работы алгоритма
let timeInterval = endTime.timeIntervalSince(startTime)
print("Время работы алгоритма: \(timeInterval) секунд")

