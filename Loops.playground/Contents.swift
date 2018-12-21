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
var j = 10
repeat {
    print("hello")
    j -= 2
} while j > 0

// use break
var k = 16
while k > 0 {
    if k % 3 == 0 {
        break
    } else {
        print(k)
    }
    k -= 1
}

// use stride
for i in stride(from: 1, to: 10, by: 3) {
    print(i)
}
