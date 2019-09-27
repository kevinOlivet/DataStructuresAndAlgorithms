import Foundation

let numbers = [1,5,15,17,19,22,24,31,105,150]

var lowerBound = 0
var upperBound = numbers.count - 1
var middle = 0
var found = false
let valueToSearchFor = 17 // This is the value we are searching for

while lowerBound <= upperBound {
    // find the middle of the array
    middle = (lowerBound + upperBound) / 2

    if numbers[middle] == valueToSearchFor {
        found = true
        break
    } else if numbers[middle] < valueToSearchFor {
        lowerBound = middle + 1
    } else {
        upperBound = middle - 1
    }
}

print(found)

extension Array where Element == Int {
    func containsUsingBinarySearch(_ value: Element) -> Bool {
        var found = false
        var lowerBound = 0
        var upperBound = self.count - 1
        var middle = 0

        while lowerBound <= upperBound {
            // find the middle of the array
            middle = (lowerBound + upperBound) / 2

            if self[middle] == value {
                found = true
                break
            } else if self[middle] < value {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        return found
    }
}

let result = numbers.containsUsingBinarySearch(22)
print(result)
