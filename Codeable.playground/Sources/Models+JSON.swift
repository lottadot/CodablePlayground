import Foundation

extension Automobile {
    
    public init?(withJSON json: [String: Any]) {
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
    
    public init?(withJSON json: [String: Any]) {
        guard let name:String = json["manufac_name"] as? String else {
            return nil
        }
        
        self.init(name: name)
    }
}

extension Manufacturer {
    
    public func toDict() -> [String: Any] {
        return [ "manufac_name:" : self.name]
    }
}

extension Model {
    
    public func toDict() -> [String: Any] {
        return [ "name:" : self.name]
    }
    
    public static func fromDict(_ dict: [String: Any]) -> Model? {
        guard let name = dict["name"] as? String else { return nil }
        
        return Model(name: name)
    }
    
    public static func fromDicts(_ dicts: [[String: Any]]) -> [Model] {
        
        var models:[Model] = []
        for dict in dicts {
            if let model = Model.fromDict(dict) {
                models.append(model)
            }
        }
        
        return models
    }
}

extension Option {
    
    public static func fromDict(_ dict: [String: Any]) -> Option? {
        guard let name = dict["name"] as? String,
            let optionId = dict["optionId"] as? Int
            else { return nil }
        
        return Option(name: name, optionId: optionId)
    }
}

extension Automobile {
    public func toDict() -> [String: Any] {
        
        var dictModels: [[String: Any]] = [[:]]
        for m in self.models {
            dictModels.append(m.toDict())
        }
        return [ "name:" : self.name, "manufacturer" : manufacturer.toDict(), "models": dictModels ]
    }
}


