//import UIKit
//
//struct Point {
//    var x = 0.0
//    var y = 0.0
//}
//
//struct Size {
//    var wight = 0.0
//    var height = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.wight / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.wight / 2)
//            origin.x = newCenter.y - (size.height / 2)
//        }
//    }
//}
//
//var square = Rect(origin: Point(x: 55.0, y: 25.0),
//                  size: Size(wight: 100.0, height: 10.0))
//let initialSquareCenter = square.center
//
//square.center = Point(x: 15.0, y: 15.0)




                  
//
//class Person {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) init")
//    }
//
//    deinit {
//        print("\(name) deinit")
//    }
//}
//
//var per1: Person?
//var per2: Person?
//var per3: Person?
//
//per1 = Person(name: "Name")
//per2 = per1
//per3 = per1
//
//per1 = nil
//per2 = nil
//per3 = nil




//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) деініціалізується") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    weak var tenant: Person?
//    deinit { print("Помешкання \(unit) деініціалізується") }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
//john!.apartment = unit4A
//unit4A!.tenant = john
//
//john = nil
//unit4A = nil




//class Customer {
//    let name: String
//    var card: CreditCard?
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("\(name) деініціалізується") }
//}
//
//class CreditCard {
//    let number: UInt64
//    unowned let customer: Customer
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//    }
//    deinit { print("Картка #\(number) деініціалізується") }
//}
//
//var john: Customer?
//
//john = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
//
//john = nil







//class Country {
//    let name: String
//    var capitalCity: City!
//    init(name: String, capitalName: String) {
//        self.name = name
//        self.capitalCity = City(name: capitalName, country: self)
//    }
//}
//
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//}
//
//var country = Country(name: "Україна", capitalName: "Київ")
//print("Столиця країни \(country.name) має назву \(country.capitalCity.name).")




//
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = {
//        [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) деініціалізовується")
//    }
//}
//
//let heading = HTMLElement(name: "h1")
//let defaultText = "якийсь текст за замовчанням"
//heading.asHTML = {
//    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
//}
//print(heading.asHTML())
//
//var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
//print(paragraph!.asHTML())
//
//paragraph = nil




//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    func stepForward(input: Int) -> Int { return input + 1 }
//    func stepBackward(input: Int) -> Int { return input - 1 }
//    return backward ? stepBackward : stepForward
//}
//var currentValue = -4
//let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
//
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveNearerToZero(currentValue)
//}


let nameArray: [String] = ["Anec", "fbrtb", "FRevg", "efeevev"]

let sortNameArray = nameArray.sorted { $0 > $1 }
sortNameArray

