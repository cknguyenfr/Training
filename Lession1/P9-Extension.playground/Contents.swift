//: Playground - noun: a place where people can play

import UIKit

//Extension: add methods
extension Date {
    // Instance Method
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
let now = Date()
print("Time: \(now.toString(format: "dd/MM/yy"))")

