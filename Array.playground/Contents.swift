import UIKit

let month = 3
let toDo = "Develop"

var toDoArr: [String] = ["Graduate", "Work", "Marry"]
var num: [Int] = [1, 2, 3, 5, 8]

toDoArr[0]
toDoArr[1] = "Work!"
print(toDoArr)

// append and insert (certain index)
num.append(10)
num.insert(0, at: 0)
print(num)

// remove
num.remove(at: 3)
print(num)

// iterate an Array
for toDo in toDoArr {
    print(toDo)
}
