import UIKit

var toDoDic: Dictionary<Int, String> = [3: "Graduate", 4: "Work", 7: "Marry"]
//var toDoDic: ["3": "Graduate", "4": "Work", "7": "Marry"]

toDoDic[3]
print(toDoDic)

toDoDic.removeValue(forKey: 3)
print(toDoDic)

for (key, value) in toDoDic {
    print("key: \(key), value: \(value)")
}

for key in toDoDic.keys {
    print(key)
}

for value in toDoDic.values {
    print(value)
}

toDoDic.removeAll()
print(toDoDic)
