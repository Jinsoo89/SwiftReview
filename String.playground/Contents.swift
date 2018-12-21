import UIKit

// practice string in Swift
let playground = "Hello, playground"

// mutable string using var
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground {
    print("\(c)")
}

// unicode
let firstUni = "\u{1F60E}"
let secondUni = "\u{1F436}"

let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)

print(catString)
print(catCharacters)

// string concat
let s1 = "Hi"
let s2 = " there"
var welcome = s1 + s2
print(welcome)

welcome.append("!")
print(welcome)

// index
welcome[welcome.startIndex]
welcome[welcome.index(before: welcome.endIndex)]

for index in welcome.indices {
    print("\(welcome[index]) ", terminator: "")
}

// suffix, prefix
if welcome.hasPrefix("Hi") {
    print("Hi")
} else if welcome.hasSuffix("there") {
    print("there")
}
