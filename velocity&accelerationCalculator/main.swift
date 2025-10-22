import Foundation

struct Unit {
    var distance: Double
    var time: Double
    var velocity: Double
    var acceleration: Double
}

enum CalculationError: Error {
    case invalidOperation
}


extension Unit {
    mutating func calculate() throws -> Double {
        if time != 0 && distance != 0 {
            velocity = distance / time
            return velocity
        } else if time != 0 && velocity != 0 {
            acceleration = velocity / time
            return acceleration
        } else {
            throw CalculationError.invalidOperation
        }
    }
}
print ("Enter distance: ")
let distanceInput = readLine()
let distance = Double(distanceInput ?? "") ?? 0

print ("Enter time: ")
let timeInput = readLine()
let time = Double(timeInput ?? "") ?? 0


var unit = Unit(distance: distance, time: time, velocity: 0, acceleration: 0)

do {
    let result = try unit.calculate()
    print("Result: \(result)")
} catch {
    print("Error: \(error)")
}




