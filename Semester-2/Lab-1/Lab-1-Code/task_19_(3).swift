import Foundation

// Структура для хранения информации о матрице
struct Matrix {
    let rows: Int
    let columns: Int
}

// Функция для вычисления оптимального заключения в круглые скобки
func optimalParenthesization(_ matrices: [Matrix]) -> (String, Int) {
    // Создание таблицы для хранения результатов
    var dp = Array(repeating: Array(repeating: 0, count: matrices.count), count: matrices.count)

    // Создание таблицы для хранения времени, затраченного на вычисление каждой подзадачи
    var time = Array(repeating: Array(repeating: 0.0, count: matrices.count), count: matrices.count)

    // Инициализация таблицы
    for i in 0..<matrices.count {
        dp[i][i] = 0
        time[i][i] = 0.0
    }

    // Вычисление оптимальной формы заключения в круглые скобки
    for l in 1..<matrices.count {
        for i in 0..<matrices.count - l {
            var minCost = Int.max
            var minTime = Double.greatestFiniteMagnitude

            for j in i..<i + l {
                let cost = dp[i][j] + dp[j + 1][i + l] + matrices[i].rows * matrices[j].columns * matrices[i + l].columns
                let t = time[i][j] + time[j + 1][i + l]
                if cost < minCost || (cost == minCost && t < minTime) {
                    minCost = cost
                    minTime = t
                }
            }

            dp[i][i + l] = minCost
            time[i][i + l] = minTime
        }
    }

    // Возвращение оптимальной формы заключения в круглые скобки
    return (restoreParenthesization(matrices, dp, 0, matrices.count - 1), Int(time[0][matrices.count - 1]))
}

// Функция для возвращения оптимальной постановки в скобки
func restoreParenthesization(_ matrices: [Matrix], _ dp: [[Int]], _ i: Int, _ j: Int) -> String {
    if i == j {
        return "A\(i + 1)"
    }

    // Использование значения minIndex, для нахождения оптимальной формы заключения в круглые скобки
    let minIndex = findMinIndex(dp, i, j)

    return "(\(restoreParenthesization(matrices, dp, i, minIndex)))(\(restoreParenthesization(matrices, dp, minIndex + 1, j)))"
}

// Функция для определения индекса точки разделения минимальной стоимости
func findMinIndex(_ dp: [[Int]], _ i: Int, _ j: Int) -> Int {
    for k in i..<j {
        if dp[i][j] == dp[i][k] + dp[k + 1][j] + matrices[i].rows * matrices[k].columns * matrices[j].columns {
            return k
        }
    }

    return -1
}

// Получение входных данных
print("Введите количество матриц")
let n = Int(readLine()!)!
var matrices = [Matrix]()

print("Введите количество строк и столбцов в матрицах")
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrices.append(Matrix(rows: line[0], columns: line[1]))
}

// Вычисление оптимальной формы заключения в круглые скобки
let (result, time) = optimalParenthesization(matrices)

// Вывод результата в консоль
print("\nОптимальная расстановка в скобках:")
print("(" + result + ")")
print("Время работы программы: \(time) секунд")
