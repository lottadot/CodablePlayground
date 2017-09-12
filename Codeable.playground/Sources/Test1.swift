import Foundation

public class Test1 {
    
    public init() {}
    
    public static func run() {
        
        print("Creating models and will convert them to JSON and show the JSON")
        let mustangGT:Model = Model(name: "GT")
        let mustangLX:Model = Model(name: "LX")
        let ford:Manufacturer = Manufacturer(name: "Ford")
        let option1:Option = Option(name: "Air Conditioning", optionId: 1)
        let vehicle:Automobile = Automobile(name: "Mustang", manufacturer: ford, models: [mustangGT, mustangLX], options: [option1])
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(vehicle) {
            if let json = String(data: encoded, encoding: .utf8) {
                print(json)
            }
        }
    }
}
