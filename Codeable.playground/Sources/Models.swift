import Foundation

public struct Manufacturer: Codable {
    public let name: String
    
    public enum CodingKeys: String, CodingKey {
        case name = "manufac_name"
    }
    
    public init(name: String) {
        self.name = name
    }
}

public struct Model: Codable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public struct Option: Codable {
    public let name: String
    public let optionId: Int
    
    public init(name: String, optionId: Int) {
        self.name = name
        self.optionId = optionId
    }
}

public enum AutomobileKeys: String, CodingKey {
    case name
    case manufacturer
    case models
    case options
    
    public static func paths() -> [AutomobileKeys] {
        return [.name, .manufacturer, .models, .options]
    }
}

public struct Automobile: Codable {
    public let name: String
    public let manufacturer: Manufacturer
    public let models: [Model]
    public var options: [Option] = []
    
    //    private enum CodingKeys : String, CodingKey {
    //        case name
    //        case manufacturer
    //        case models
    //        case options
    //    }
    //
    //     public static let codingPath: [CodingKey] = [Automobile.CodingKeys.name, Automobile.CodingKeys.manufacturer, Automobile.CodingKeys.models, Automobile.CodingKeys.options]
    
    public init(name: String, manufacturer: Manufacturer, models: [Model], options: [Option]) {
        self.name = name
        self.manufacturer = manufacturer
        self.models = models
        self.options = options
    }
}


