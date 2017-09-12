import Foundation

public func convertASingleJSONRepresentation(_ jsonString: String) {
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
        let truck:Automobile = try decoder.decode(Automobile.self, from: data)
        print(truck) // decoded!!!!!
    } catch let error {
        print("conversion failed: \(error.localizedDescription)")
    }
}

public func convertAnArrayOfJONRepresentations(_ jsonString: String) {
    let data = jsonString.data(using: .utf8)! // our data in native (JSON) format
    
    print("Converting from JSON ARRAY with Codable")
    do {
        //        guard let truck = try? JSONDecoder().decode([String:Automobile].self, from: data) else { fatalError() }
        let truck = try JSONDecoder().decode([Automobile].self, from: data)
        print(truck) // decoded!!!!!
        
    } catch let error {
        print("conversion failed: \(error.localizedDescription)")
    }
}

