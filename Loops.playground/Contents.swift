import UIKit

// for-in loop
var num: Int = 0

for i in 1...5 {
    num += i
    print(num)
}

// using _
num = 0
for _ in 1...5 {
    num += 1
    print(num)
}

// for-in loop with case
for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

// classic for loop
var i = 1
while i < 6 {
    print(i)
    i += 1
}

// repeat-while loop

