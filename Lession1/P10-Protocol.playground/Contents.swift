//: Playground - noun: a place where people can play

import UIKit

protocol CanRun{
    var legCount : Int {get set}
    func canRun() -> Bool
}
protocol CanBark : class {
    func canBark() -> Bool
}
class Chicken : CanRun, CanBark{
    var legCount: Int = 2
    func canRun() -> Bool {
        return true
    }
    
    func canBark() -> Bool {
        return false
    }
}
