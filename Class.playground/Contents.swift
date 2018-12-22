import UIKit

class Circle {
    var radius: Double
    let pi = 3.141592
    
    init() {
        radius = 10.0
    }
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return pow(radius, 2) * pi
    }
}

let circle = Circle()

circle.area()

