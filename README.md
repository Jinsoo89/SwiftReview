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
