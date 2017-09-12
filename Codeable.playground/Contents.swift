//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

// The original idea of this playground is to divide things into "Tests". Uncomment one, and run the playground. However, Xcode9b isn't playing nicely today, and sometimes runs these, and sometimes does not. So, for now, they are all included below. Someday if this works we'll remove all the code from the main playground and just use the `Test*.run`'s.
//Test1.run
//Test2.run
//Test3.run

//print("Creating models and will convert them to JSON and show the JSON")
//let mustangGT:Model = Model(name: "GT")
//let mustangLX:Model = Model(name: "LX")
//let ford:Manufacturer = Manufacturer(name: "Ford")
//let option1:Option = Option(name: "Air Conditioning", optionId: 1)
//let vehicle:Automobile = Automobile(name: "Mustang", manufacturer: ford, models: [mustangGT, mustangLX], options: [option1])
//
//let encoder = JSONEncoder()
//if let encoded = try? encoder.encode(vehicle) {
//    if let json = String(data: encoded, encoding: .utf8) {
//        print(json)
//    }
//}
//
//let jsonString = """
//{
//"name": "F-150",
//"manufacturer": { "manufac_name" : "Ford" },
//"models": [{
//"name": "XLT"
//}, {
//"name": "King Ranch"
//}],
//"options": [{
//"name": "Power Windows",
//"optionId": 1
//}, {
//"name": "Power TailGate",
//"optionId": 2
//}]
//}
//"""
//
//convertASingleJSONRepresentation(jsonString)
//
//let arrayOfJSON = """
//[
//{
//"name": "F-150",
//"manufacturer": {
//"manufac_name": "Ford"
//},
//"models": [{
//"name": "XLT"
//}, {
//"name": "King Ranch"
//}],
//"options": [{
//"name": "Power Windows",
//"optionId": 1
//}, {
//"name": "Power TailGate",
//"optionId": 2
//}]
//},
//{
//"name": "Malibu",
//"manufacturer": {
//"manufac_name": "Chevy"
//},
//"models": [{
//"name": "Base"
//}, {
//"name": "GT"
//}],
//"options": [{
//"name": "Power Windows",
//"optionId": 1
//}, {
//"name": "Power TailGate",
//"optionId": 2
//}]
//}
//]
//"""
//convertAnArrayOfJONRepresentations(arrayOfJSON)

let tesla:Manufacturer = Manufacturer(name: "Telsa")
if let encoded = try? JSONEncoder().encode(tesla) {
    if let json = String(data: encoded, encoding: .utf8) {
        print(json)
    }
}


