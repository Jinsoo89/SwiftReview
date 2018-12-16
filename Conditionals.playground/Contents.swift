import UIKit

var population: Int = 5422
var message: String?
var hasPostOffice: Bool = true

// if statement
//if population < 10000 {
//    message = "\(population) is a small town!"
//} else {
//    message = "\(population) is a pretty big!"
//}

// another version of if statement for 'message'
//a ? b : c  ---> if a is true then b, otherwise c
//message = population < 10000 ? "\(population) is a small town!" : "\(population) is a pretty big!"

// nested ifs
//if population < 10000 {
//    message = "\(population) is a small town!"
//} else {
//    if population >= 10000 && population < 50000 {
//        message = "\(population) is a medium town!"
//    } else {
//        message = "\(population) is pretty big!"
//    }
//}

if (population < 10000) {
    message = "\(population) is a small town!"
} else if (population >= 10000 && population < 50000) {
    message = "\(population) is a medium town!"
} else {
    message = "\(population) is pretty big!"
}

// print out message
print(message!)

// if statement using logical operator
if !hasPostOffice {
    print("Where do we buy stamps?")
}

