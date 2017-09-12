import Foundation

public class Test2 {
    
    public init() {}
    
    public static func run() {
        
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
    }
}
