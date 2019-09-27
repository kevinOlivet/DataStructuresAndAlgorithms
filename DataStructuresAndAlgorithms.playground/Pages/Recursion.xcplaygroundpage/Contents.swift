import Foundation

func factorial(number: Int) -> Int {

    // base case
    if number == 0 {
        return 1
    }

    return number * factorial(number: number - 1)
}

let factorialResult = factorial(number: 5)
print(factorialResult)

func power(number: Int, n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return number * power(number: number, n: n - 1)
    }
}

let powerResult = power(number: 2, n: 3)
print(powerResult)
