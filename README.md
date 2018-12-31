# A repository to review Swift programming

### interesting features of Swift programming language

##### Types

- Type Annotation
- Type Identifier
- Function Type
- Optional Type

##### Struct - Class

- Struct -> no inheritance
- Struct -> value type (get copied)
- Class -> reference type (passing pointer)

##### Countable Range

for i in stride(from: 0.5, through: 15.25, by: 0.3) {

}

##### Tuple

let x: (String, Int, Double) = ("hello", 5, 0.85) // x is a tuple
let (word, number, value) = x // assign names to tuple values 
print(word) // print hello
print(number) // print 5
print(value) // print 0.85

better version:

let x: (w: String, n: Int, v: Double) = ("hello", 5, 0.85)
print(x.w) // print hello
print(x.n) // print 5
print(x.v) // print 0.85
