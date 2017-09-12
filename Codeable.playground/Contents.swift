//: Playground - noun: a place where people can play

import Foundation

public struct Manufacturer: Codable {
    public let name: String
    
    public enum CodingKeys: String, CodingKey {
        case name = "manufac_name"
    }
    
    public func toDict() -> [String: Any] {
        return [ "manufac_name:" : self.name]
    }
}

struct Model: Codable {
    let name: String
    
    func toDict() -> [String: Any] {
        return [ "name:" : self.name]
    }
    
    static func fromDict(_ dict: [String: Any]) -> Model? {
        guard let name = dict["name"] as? String else { return nil }
        
        return Model(name: name)
    }
    
    static func fromDicts(_ dicts: [[String: Any]]) -> [Model] {
        
        var models:[Model] = []
        for dict in dicts {
            if let model = Model.fromDict(dict) {
                models.append(model)
            }
        }
        
        return models
    }
}

struct Option: Codable {
    let name: String
    let optionId: Int
    
    static func fromDict(_ dict: [String: Any]) -> Option? {
        guard let name = dict["name"] as? String,
            let optionId = dict["optionId"] as? Int
            else { return nil }
        
        return Option(name: name, optionId: optionId)
    }
}

public enum AutomobileKeys: String, CodingKey {
    case name
    case manufacturer
    case models
    case options
    
    static func paths() -> [AutomobileKeys] {
        return [.name, .manufacturer, .models, .options]
    }
}

struct Automobile: Codable {
    let name: String
    let manufacturer: Manufacturer
    let models: [Model]
    var options: [Option] = []
    
//    private enum CodingKeys : String, CodingKey {
//        case name
//        case manufacturer
//        case models
//        case options
//    }
//
//     public static let codingPath: [CodingKey] = [Automobile.CodingKeys.name, Automobile.CodingKeys.manufacturer, Automobile.CodingKeys.models, Automobile.CodingKeys.options]
    
    func toDict() -> [String: Any] {
        
        var dictModels: [[String: Any]] = [[:]]
        for m in self.models {
            dictModels.append(m.toDict())
        }
        return [ "name:" : self.name, "manufacturer" : manufacturer.toDict(), "models": dictModels ]
    }
}

extension Automobile {
    init?(withJSON json: [String: Any]) {
        guard
            let name:String = json["name"] as? String,
            let manufacturerDict = json["manufacturer"] as? [String: Any],
            let manufacturer:Manufacturer = Manufacturer(withJSON: manufacturerDict),
            let modelDicts:[[String:Any]] = json["models"] as? [[String : Any]]
            else {
                print("cannot convert from JSON")
                return nil
        }
        
        let models:[Model] = Model.fromDicts(modelDicts)
        
        var options:[Option] = []
        if let dictOptions:[[String :Any]] = json["options"] as? [[String : Any]] {
            for dict in dictOptions {
                if let opt = Option.fromDict(dict) {
                    options.append(opt)
                }
            }
        }
        
        self.init(name: name, manufacturer: manufacturer, models: models, options: options)
    }
    
}

extension Manufacturer {
    init?(withJSON json: [String: Any]) {
        guard let name:String = json["manufac_name"] as? String else {
            return nil
        }
        
        self.init(name: name)
    }
}

//extension Automobile {
//
//    // In order to use this, the `Automobile` must conform to the Codingkey Protocol, above.
//    public init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: AutomobileKeys.self)
//
//        let name:String = try values.decode(String.self, forKey: AutomobileKeys.name)
//        let manufacturer:Manufacturer = try values.decode(Manufacturer.self, forKey: AutomobileKeys.manufacturer)
//        let models:[Model] = try values.decode([Model].self, forKey: AutomobileKeys.models)
//        let options:[Option] = try values.decode([Option].self, forKey: AutomobileKeys.options)
//
//        self.init(name: name, manufacturer: manufacturer, models: models, options: options)
//    }
//}

//extension Manufacturer {
//
//    public init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: Manufacturer.self)
//
//        let name:String = try values.decode(String.self, forKey: "name")
//        self.init(name: name)
//    }
//}

// MARK: - JSON

let mustangGT = Model(name: "GT")
let mustangLX = Model(name: "LX")
let ford = Manufacturer(name: "Ford")
let option1 = Option(name: "Air Conditioning", optionId: 1)
let vehicle = Automobile(name: "Mustang", manufacturer: ford, models: [mustangGT, mustangLX], options: [option1])

let encoder = JSONEncoder()
if let encoded = try? encoder.encode(vehicle) {
    if let json = String(data: encoded, encoding: .utf8) {
        print(json)
    }
}

func convertASingleJSONRepresentation(_ jsonString: String) {
    let data = jsonString.data(using: .utf8)! // our data in native (JSON) format
    
    print("Converting from JSON manually")
    do {
        guard let something:[String : Any] = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
            let truck:Automobile = Automobile.init(withJSON: something)
            else { fatalError() }
        print(truck)
        
    } catch let error {
        print("conversion failed: \(error.localizedDescription)")
    }
    
    print("Converting from single dict JSON with Codable")
    
    let decoder = JSONDecoder()
    do {
        guard let truck:Automobile = try decoder.decode(Automobile.self, from: data) else { fatalError() }
        print(truck) // decoded!!!!!
    } catch let error {
        print("conversion failed: \(error.localizedDescription)")
    }
}

func convertAnArrayOfJONRepresentations(_ jsonString: String) {
    let data = jsonString.data(using: .utf8)! // our data in native (JSON) format
    
    print("Converting from JSON ARRAY with Codable")
    do {
//        guard let truck = try? JSONDecoder().decode([String:Automobile].self, from: data) else { fatalError() }
        let truck = try? JSONDecoder().decode([Automobile].self, from: data)
        print(truck) // decoded!!!!!

    } catch let error {
        print("conversion failed: \(error.localizedDescription)")
    }
}

let jsonString = """
{
"name": "F-150",
"manufacturer": { "manufac_name" : "Ford" },
"models": [{
"name": "XLT"
}, {
"name": "King Ranch"
}],
"options": [{
"name": "Power Windows",
"optionId": 1
}, {
"name": "Power TailGate",
"optionId": 2
}]
}
"""
convertASingleJSONRepresentation(jsonString)

let arrayOfJSON = """
[
{
"name": "F-150",
"manufacturer": {
"manufac_name": "Ford"
},
"models": [{
"name": "XLT"
}, {
"name": "King Ranch"
}],
"options": [{
"name": "Power Windows",
"optionId": 1
}, {
"name": "Power TailGate",
"optionId": 2
}]
},
{
"name": "Malibu",
"manufacturer": {
"manufac_name": "Chevy"
},
"models": [{
"name": "Base"
}, {
"name": "GT"
}],
"options": [{
"name": "Power Windows",
"optionId": 1
}, {
"name": "Power TailGate",
"optionId": 2
}]
}
]
"""
convertAnArrayOfJONRepresentations(arrayOfJSON)



