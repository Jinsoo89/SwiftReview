import UIKit

// variable cases, var is mutable
// var numberOfStoplights = "Four"
// var numberOfStoplights: Int = 4
var numberOfStoplights = 4
numberOfStoplights += 2

// constant cases, let is not mutable
let number1: Int = 4
// causes an error
// number1 += 2

// declare empty int
let number2: Int = 4
var population: Int?
population = 5000
let townName: String = "Knowhere"
let employment: Int = 1
let townDescription = "\(townName) has a population of \(population) and \(numberOfStoplights) stoplights and level of employment is \(employment)."

print(townDescription)



