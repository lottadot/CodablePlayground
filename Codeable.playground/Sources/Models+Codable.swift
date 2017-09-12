import Foundation

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

