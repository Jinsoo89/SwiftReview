import UIKit

// practice complex switch statement
// value binding
var statusCode4: Int = 404
var errorString4: String = "The request failed with the error:"

switch statusCode4 {
case 100, 101:
    errorString4 += " Informational, \(statusCode4)."
    
case 204:
    errorString4 += " Successful but no content, \(statusCode4)."
    
case 300...307:
    errorString4 += " Redirection, \(statusCode4)."
    
case 400...417:
    errorString4 += " Client error, \(statusCode4)."
    
case 500...505:
    errorString4 += " Server error, \(statusCode4)."
    
case let unknownCode:
    errorString4 = "\(unknownCode) is not a known error code."
}

// create a tuple
let error = (code: statusCode4, error: errorString4)
print(error)
print(error.code)
print(error.error)

// tuples and pattern matching
let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found.")
    
case (404, _):
    print("First item not found.")
    
case (_, 404):
    print("Second item not found.")
    
default:
    print("All items found.")
}

// switch vs if/else statement
let age = 25

switch age {
case 18...35:
    print("Young")
    
default:
    break
}

if case 18...35 = age {
    print("Young")
}

// add where clause (in this case ',')
if case 18...35 = age, age >= 20 {
    print("Young, are you in college?")
}
