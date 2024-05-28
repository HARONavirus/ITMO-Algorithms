import Foundation

func findOptimalRepresentation(inputString: String) -> String {
    var compressedString = ""
    var currentPosition = inputString.startIndex
    
    while currentPosition < inputString.endIndex {
        let currentChar = inputString[currentPosition]
        var substring = String(currentChar)
 var count = 1
        var tempPosition = inputString.index(after: currentPosition)
        
        while tempPosition < inputString.endIndex && inputString[tempPosition] == currentChar {
            substring += String(currentChar)
            count += 1
            tempPosition = inputString.index(after: tempPosition)
        }
        
        currentPosition = tempPosition
        
        if count > 1 {
            compressedString += "\(substring)*\(count)+"
        } else {
            compressedString += "\(currentChar)+"
        }
    }
    
    // Remove the extra '+' at the end of the string
    compressedString.removeLast()
    
    return compressedString
}

// Timer to measure program execution time
let startTime = Date()

// User input via console
print("")
if let inputString = readLine() {
    let optimalRepresentation = findOptimalRepresentation(inputString: inputString)
    print("")
    print("Оптимальное представление: \(optimalRepresentation)")
    
    // Calculate and print program execution time
    let endTime = Date()
    let timeInterval = endTime.timeIntervalSince(startTime)
    print("Время работы программы: \(timeInterval) секунд")
}
