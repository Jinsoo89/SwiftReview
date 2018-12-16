import UIKit

// print out max and min values of Int (64-bit)
print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")
// print out max and min values of Int (32-bit) by explicitly casting
print("The maximum Int value for 32-bit is \(Int32.max).")
print("The minimum Int value for 32-bit is \(Int32.min).")
// print out max and min values of Unsigned Int (64-bit)
print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")
// print out max and min values of Unsigned Int (32-bit)
print("The maximum UInt value for 32-bit is \(UInt32.max).")
print("The maximum UInt value for 32-bit is \(UInt32.min).")

// declare Int explicitly and implicitly
let numberOfPages: Int = 32
let numberOfChapters = 8
let numberOfPeople: UInt = 100
let volumeAdjustment: Int32 = -1000

// Integer overflow!!!
// let firstOverflow: UInt = -1
// let secondOverflow: Int8 = 1000

// Operations
print(0 + 1)
print(1 - 1)
print(1 * 1)
print(5 - 1 * 5)
print(5 / 5 - 1)
print((5 - 5) * 1)
print(5 % 3)

// Integer division --> always throw decimals away
print(11 / 3)
print(-11 / 3)

// Overflow operator
let y: Int8 = 120
let z = y &+ 10
print("120 &+ 10 is \(z)")
// what happens in this case is that Int8 accepts -128 to 127
// 120 + 7 -> 127, 120 + 8 -> -128, 120 + 9 -> -127 and 120 + 10 -> -126
// this is called "wrap-around"

// convert Integer types
let a: Int16 = 200
let b: Int8 = 50
let c = a + Int16(b) // need casting

// floating-Point Numbers
// Float: 32-bit floating-point number
// Double: 64-bit floating-point number in Swift
let d1 = 1.1 // Implicitly Double
let d2: Double = 1.1
let f1: Float = 1.2

if (d1 == d2) {
    print("d1 and d2 are the same!")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if ((d1 + 0.1) == 1.2) {
    print("d1 + 0.1 is equal to 1.2")
}

// to find -1 using signed Int8
let num: Int8 = 127
print(num + -128)
