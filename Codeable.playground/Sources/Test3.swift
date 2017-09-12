import Foundation

public class Test3 {
    
    public init() {}
    
    public static func run() {
        
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
    }
}
