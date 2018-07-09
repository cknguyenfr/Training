enum ScrollDirection{
    case up, down, left, right;
}
var direction = ScrollDirection.up

enum NumberEnum : Int{
    case one = 1
    case two = 2
    case three = 3
    case four = 4
}
print("Number Enum value is \(NumberEnum.one.rawValue)")
//Number Enum value is 1
enum House: String {
    case baratheon = "Ours is the Fury"
    case greyjoy = "We Do Not Sow"
    case martell = "Unbowed, Unbent, Unbroken"
    case stark = "Winter is Coming"
    case tully = "Family, Duty, Honor"
    case tyrell = "Growing Strong"
}
print("Number Enum value is \(House.stark.rawValue)")
//Number Enum value is Winter is Coming

//Associated Enum
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcodeUPC = Barcode.upc(8, 85909, 51226, 3)
var productBarcodeQr = Barcode.qrCode("BARCODEAKJHFDIOE")
switch productBarcodeQr{
case let .qrCode(code):
    print("QR code is \(code)")
default:
    break
}

//Properties, methods and mutating
enum SmartPhone{
    case Iphone5
    case Iphone6
    case IphoneX
    case SamsungGalaxyS8
    
    func getOS() -> String{
        switch self {
        case .SamsungGalaxyS8:
            return "Android"
        default:
            return "IOS"
        }
    }
    
    var description : String{
        switch self {
        case .Iphone5:
            return "Description of IP5"
        case .Iphone6:
            return "Description of IP6"
        case .SamsungGalaxyS8:
            return "Description of SSG8"
        default:
            return "Desscription"
        }
    }
    
    mutating func setIphone6(){
        self = .Iphone6
    }
}
