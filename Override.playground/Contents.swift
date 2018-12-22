import UIKit

class NoteBook {
    var name = ""
    
    func turnOn() {
        print("Booting")
    }
}

// Macbook intehit Notebook
class Macbook: NoteBook {
    var hasTouchBar = true
    var macOsVersion = 10.1
    
    // override function of notebook
    override func turnOn() {
        // call turnOn function of super class (notebook)
        super.turnOn()
        print("\(name)'s current Mac OS version is \(macOsVersion)")
    }
}

let macbook = Macbook()

macbook.name = "Macbook Pro Retina"
macbook.turnOn()
