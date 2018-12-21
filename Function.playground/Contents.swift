import UIKit

// basic function structure
func first(name: String) -> String {
    return "Hello, " + name
}

let message = first(name: "Jinsoo")

// second parameter is already set
func addTwoNumbers(num1: Int, num2: Int = 100) -> Int {
    return num1 + num2
}

addTwoNumbers(num1: 3, num2: 4)
addTwoNumbers(num1: 0)

// parameter that takes multiple int values
func addNumbers(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1, 2, 3, 4, 5)

// no parameter but return dictionary
func myInfo() -> (name: String, height: Int) {
    return ("Jinsoo", 184)
}

let info = myInfo()
print(info)
