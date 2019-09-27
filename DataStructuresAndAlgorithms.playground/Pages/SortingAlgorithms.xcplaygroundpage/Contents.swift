import Foundation

let array = [9,5,2,1,6,8,3,7,4]

// BUBBLE SORT
func bubbleSort<T: Comparable>(input: [T]) -> [T] {
    var arrayToReturn = input

    for i in 0..<arrayToReturn.count {
        for j in 0..<arrayToReturn.count where arrayToReturn[i] < arrayToReturn[j] {
            arrayToReturn.swapAt(i, j)
        }
    }
    return arrayToReturn
}

let bubbleSorted = bubbleSort(input: array)
print(bubbleSorted)

// SELECTION SORT
func selectionSort<T: Comparable>(input: [T]) -> [T] {
    var arrayToReturn = input
    var minIndex = 0

    for i in 0..<arrayToReturn.count {
        minIndex = i
        for j in (i+1)..<arrayToReturn.count where arrayToReturn[j] < arrayToReturn[minIndex] {
            minIndex = j
        }
        arrayToReturn.swapAt(i, minIndex)
    }
    return arrayToReturn
}

let selectionSorted = selectionSort(input: array)
print(selectionSorted)

// INSERTION SORT
func insertionSort<T: Comparable>(input: [T]) -> [T] {
    var arrayToReturn = input

    for i in 0..<arrayToReturn.count{

        let key = arrayToReturn[i]
        var j = i - 1

        while j >= 0 && arrayToReturn[j] > key {
            arrayToReturn[j+1] = arrayToReturn[j]
            j -= 1
        }
        arrayToReturn[j + 1] = key
    }
    return arrayToReturn
}

let insertionSorted = insertionSort(input: array)
print(insertionSorted)
