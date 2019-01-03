# A repository to review Swift programming

### interesting features of Swift programming language

#### Types

- Type Annotation
- Type Identifier
- Function Type
- Optional Type

#### Struct - Class

- Struct -> no inheritance
- Struct -> value type (get copied)
- Class -> reference type (passing pointer)

#### Class
- Supports object-oriented design
- Single inheritance of both functionality and data
- Reference type (classes are stored in the heap and are passed via pointers)
- Heap is automatically "kept clean" by Swift (via reference counting, not garbage collection)

#### Struct
- Value type (structs don't live in the heap and are passed by copying them
- Very efficient "copy on write" is automatic in Swift
- This copy on write behavior requires you to mark mutating methods
- No inheritance (of data)
- Mutability controoled via let
- Supports functional programming design

#### Memory Management

Automatic Reference Counting (ARC)
- Reference types (classes) are stored in the heap
- It 'counts references' to each of them and when there are zero references, they get tossed
- This is done automatically

Influencing ARC
- You can influence ARC by how you declare a reference-type var with these keywords
- string
- weak
- unowned

##### strong

- strong is "normal" reference counting
- as long as anyone, anywhere has a strong pointer to an instance, it will stay in the heap

##### weak

- weak means "if no one else is interested in this, then neither am I, set me to nil in that case"
- weak only applies to Optional pointers to reference types
- A week pointer will never keep an object in the heap

##### unowned

- unowned means "don't reference count this; crash if I'm wrong"
- usually only to break memory cycles between objects


#### Countable Range

```
for i in stride(from: 0.5, through: 15.25, by: 0.3) {

}
```
#### Tuple

```
let x: (String, Int, Double) = ("hello", 5, 0.85) // x is a tuple
let (word, number, value) = x // assign names to tuple values 
print(word) // print hello
print(number) // print 5
print(value) // print 0.85
```

- better version:

```
let x: (w: String, n: Int, v: Double) = ("hello", 5, 0.85)
print(x.w) // print hello
print(x.n) // print 5
print(x.v) // print 0.85
```

- Tuple as return value

```
func getSize() -> (weight: Double, height: Double) {
    return (81, 180)
}

let x = getSize()

print("weight is: \(x.weight)") // weight is: 81
```

#### Access Control

- internal: this is the default, and meaning "usable by any object in the app or framework"
- private: this means "only callable from within the project"
- private(set): this means "this property is readable outside this object, but not settable"
- fileprivate - accessible by any code in the source file
- public: (for frameworks only) this can be used by objects outside my framework- open: (for frameworks only) public and objects outside my framework can subclass this

Good strategy is to just make everything private by default, then change it by usage.

#### Extensions

- add methods/properties to a class/struct/enum
- can't re-implement methods/properties that are already exist (only add new ones)

```
extension Int {
    var arc4random: Int {
	if self > 0 {
	    return Int(arc4random_uniform(UInt32(self)))
	} else if self < 0 {
	    return -Int(arc4random_uniform(UInt32(abs(self))))
	} else {
	    return 0
	}
    }
}
```

#### Enumeration (enum)

- Another variety of data structure in addition to struct and class
- It can only have discrete states
- Enum is a value type (like struct), it is copied as it is passed

```
enum FastFoodMenuItem {
    case hamburger
    case fries
    case drink
    case cookie
}
```

- Each state can (doesn't have to) have its own "associated data"
```
enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(String, ounces: Int)
    case cookie
}

enum FryOrderSize {
    case large
    case small
}
```

- Setting the value of an enum
```
let menuItem: FastFoodMenuItem = FastFoodMenuItem.hamburger(patties: 2)
var otherItem: FastFoodMenuItem = FastFoodMenuItem.cookie

// another version

let menuItem: FastFoodMenuItem.hamburger(patties: 2)
var otherItem: FastFoodMenuItem = .cookie
```

- checking an enum's state
```
var menuItem = FastFoodMenuItem.hamburger(patties: 2)

switch menuItem {
    case FastFoodMenuItem.hamburger: print("burger")
    case FastFoodMenuItem.fries: print("fries")
    case FastFoodMenuItem.drink: print("drink")
    case FastFoodMenuItem.cookie: print("cookie")
}

// Swift can infer the FastFoodMenuItem

switch menuItem {
    case .hamburger: print("burger")
    case .fries: print("fries")
    case .drink: print("drink")
    case .cookie: print("cookie")
}

// use break

switch menuItem {
    case .hamburger: break
    case .fries: print("fries")
    case .drink: print("drink")
    case .cookie: print("cookie")
}

// use default

switch menuItem {
    case .hamburger: break
    case .fries: print("fries")
    default: print("other")
}


// access associated data

var menuItem = FastFoodMenuItem.drink("Coke', ounces: 32)
switch menuItem {
    case .hamburger(let pattyCount): print("a burger with \(pattyCount) patties")
    case .fries(let size): print("a \(size) order of fries")
    case .drink(let brand, let ounces): print("a \(ounces)oz \(brand)")
    case .cookie: print("cookie")
}
```

- enum can have methods

```
enum FastFoodMenuItem {
    case hamburger(numberOfPatties: Int)
    case fries(size: FryOrderSize)
    case drink(String, ounces: Int)
    case cookie

    func isIncludedInSpecialOrder(number: Int) -> Bool {
	switch self {
	    case .hamburger(let pattyCount): return pattyCount == number
	    case .fries, .cookie: return true
	    case .drink(_, let ounces): return ounces == 16
	}
    }
    var calories: Int { // calculate calories }
}
```

- modifying self in an enum

```
enum FastFoodMenuItem {
    ...
    mutating func switchToBeingACookie() {
	self = .cookie
    }
}
```

#### Optional (!!!!!)

- The 'not set' case has a special keyword: nil
- The character ? is used to declare an Optional, ex) var isOptional: Bool?
- The character ! is used to unwrap the associated data if an Optional is in the "set" state
- The keyword if can also be used to conditionally get the associated data
  ex) if let index = cardButtons.index(of: button) { ... }
- An Optional declared with ! (instead of ?) will implicitly unwrap when accessed
- You can use ?? to create an expression which "defaults" to a value if an Optional is not set
- You can also use ? when accessing an Optional to bail out of an expression midstream
  this is called Optional Chaining (!!!)

```
// Optional Chaining

let x: String? = ...
let y = x?.foo()?.bar?.z

// this equivalent to

switch x {
    case .none: y = nil
    case .some(let data1):
	switch data1.foo() {
	    case .none: y = nil
	    case .some(let data2):
		switch data2.bar {
		    case .none: y = nil
		    case .some(let data3): y = data3.z
		}
	}
}
```

#### Protocols

- The protocol declaration (which properties and methods are in the protocol)
- A class, struct or enum declaration that makes the claim to implement the protocol
- The code in said class, struct, or enum (or extension) that implements the protocol
- Similar to Interface in Java

Declaration of the protocol itself

```
// Anyone that implements someProtocol must also implement
// InheritedProtocol1 and 2
// You must specify whether a property is get only or both get and set
protocol someProtocol : InheritedProtocol1, InheritedProtocol2 {
    var someProperty: Int { get set }
    func aMethod(arg1: Double, anotherArgument: String) -> SomeType
    mutating func changeIt()
    init(arg: Type)
}
// Protocol is declaration only, not code
// Any functions that are expected to mutate the receiver should be marked mutating
```

How an implementer says "I implement that protocol"

```
// super class first, then protocols
class SomeClass : SuperclassOfSomeClass, SomeProtocol, AnotherProtocol {
    // implementation of SomeClass here
    // which must include all the properties and methods in SomeProtocol & AnotherProtocol

    // In a class, inits must be marked required
    required init(...)
}

struct SomeStruct : SomeProtocol, AnotherProtocol {
    // implementation of SomeStruct here
    // which must include all the properties and methods in SomeProtocol & AnotherProtocol
}

extension Something : SomeProtocol {
    // implementation of SomeProtocol here
    // no stored properties though
}
```

Using protocols like the type that they are

```
protocol Moveable {
    mutating func move(to point: CGPoint)
}

class Car : Moveable {
    func move(to point: CGPoint) { ... }
    func changeOil()
}

struct Shape : Moveable {
    mutating func move(to point: CGPoint) { ... }
    func draw()
}

let prius: Car = Car()
let square: Shape = Shape()

var thingToMove: Moveable = prius
thingToMove.move(to: ...)
thingToMove = square
let thingsToMove: [Moveable] = [prius, square]

// this is illegal
thingToMove.changeOil()
```

Another use of Protocols

- Being a key in a dictionary

```
protocol Hashable: Equatable {
    var hashValue: Int { get }
}

protocol Equatable {
    static func ==(lhs: Self, rhs: Self) -> Bool
}

Dictionary<Key: Hashable, Value>
```
