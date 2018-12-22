import UIKit

class NoteBook {
    var name = ""
    
    func turnOn() {
        print("Booting")
    }
}

class Macbook: NoteBook {
    var hasTouchBar = true
    var macOsVersion = 10.1
    
    func turnOnTouchBar() {
        print("Turning on Touch Bar")
    }
}

let macbook = Macbook()

macbook.name = "Macbook Pro Retina"
macbook.turnOn()
macbook.turnOnTouchBar()
