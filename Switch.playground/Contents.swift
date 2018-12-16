import UIKit

// practice basic switch statement in Swift

// compare HTTP status code and assign error message
// for each case
var statusCode1: Int = 404
var errorString1: String?

switch statusCode1 {
case 400:
    errorString1 = "Bad Request"
    
case 401:
    errorString1 = "Unauthorized"
    
case 403:
    errorString1 = "Forbidden"
    
case 404:
    errorString1 = "Not Found"
    
default:
    errorString1 = "None"
}

// can have multiple values
var statusCode2: Int = 404
var errorString2: String = "The request failed with the error:"

switch statusCode2 {
case 400, 401, 403, 404:
    errorString2 = "There was something wrong with the request."
    // fallthrough for next case to be executed
    fallthrough
    
default:
    errorString2 += " Please review the request and try again."
}

// can also have ranges
var statusCode3: Int = 404
var errorString3: String = "The request failed with the error:"

switch statusCode3 {
case 100, 101:
    errorString3 += " Informational, 1xx."
    
case 204:
    errorString3 += " Successful but no content, 204."
    
// cases between 300, 307 including them.
case 300...307:
    errorString3 += " Redirect, 3xx."
    
case 400...417:
    errorString3 += " Client error, 4xx."
    
case 500...505:
    errorString3 += " Server error, 5xx."
    
default:
    errorString3 = "Unknown. Please review the request and try again."
}
