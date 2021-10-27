////
//
//import Foundation
//
//print("Hello, World!")

//
//

import Foundation



enum Color: String {
    case red = "красного",
         blue = "синего",
         white = "белого",
         black = "черного",
         green = "зеленого"
}

enum ActionWindow {
    case open, close
}

enum ActionEngine {
    case start, stop
}

protocol Car {
    var brand: String { get set }
    var capacityFuel: Int { get set }
    var color: Color { get set }
}

extension Car {
    
    func actionWindow(action: ActionWindow) {
        switch action {
        case .open:
            print("Окно открыто")
        case .close:
            print("Окно закрыто")
        }
    }
    
    func actionEngine(action: ActionEngine) {
        switch action {
        case .start:
            print("Двигатель работает")
        case .stop:
            print("Двигатель выключен")
        }
    }
}

class TrunkCar: Car {
    
    enum Trailer: String {
        case yes = "есть", no = "отстутствует"
    }
    
    var brand: String
    var capacityFuel: Int
    var color: Color
    
    var gotTrailer: Trailer
    
    init(brand: String, capacityFuel: Int, color: Color, gotTrailer: Trailer) {
        self.brand = brand
        self.capacityFuel = capacityFuel
        self.color = color
        self.gotTrailer = gotTrailer
    }
    
}

extension TrunkCar: CustomStringConvertible {
        var description : String {
            return "Грузовик \(self.brand) в кузове \(self.color.rawValue) цвета, имеет емкость топливного бака размером \(self.capacityFuel) литров. Прицеп - \(self.gotTrailer.rawValue)"
    }
}

class SportCar: Car {
    
    enum EngineType: String {
        case gas = "двигатель внутреннего сгорания", electro = "электрический двигатель"
    }
    
    var brand: String
    var capacityFuel: Int
    var color: Color
    var engineType: EngineType
    
    init(brand: String, capacityFuel: Int, color: Color, engineType: EngineType) {
        self.brand = brand
        self.capacityFuel = capacityFuel
        self.color = color
        self.engineType = engineType
    }
    
}

extension SportCar: CustomStringConvertible {
    var description : String {
        return "Спорткар \(self.brand) в кузове \(self.color.rawValue) цвета, имеет емкость топливного бака размером \(self.capacityFuel) литров. Силовая установка - \(self.engineType.rawValue)"
    }
}

let trunkMan = TrunkCar(brand: "MAN", capacityFuel: 760, color: .white, gotTrailer: .yes)
print(trunkMan)

let trunkKamaz = TrunkCar(brand: "Kamaz", capacityFuel: 350, color: .red, gotTrailer: .no)
print(trunkKamaz)

let sportCarBmw = SportCar(brand: "BMW M5", capacityFuel: 68, color: .black, engineType: .gas)
print(sportCarBmw)

let sportCarAudi = SportCar(brand: "Audi RS6", capacityFuel: 82, color: .blue, engineType: .gas)
print(sportCarAudi)

let sportCarPorsche = SportCar(brand: "Porsche Taycan", capacityFuel: 0, color: .green, engineType: .electro)
print(sportCarPorsche)
