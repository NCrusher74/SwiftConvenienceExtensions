
import Foundation
public extension Array where Element == String {
    /// Convenience Extension. Divides string in components separated by `"; "`
    var toString: String {
        return self.joined(separator: "; ")
    }
    
    var toData: Data {
        var data = Data()
        for element in self {
            data.append(element.encodedUtf8)
        }
        return data
    }

    mutating func extractFirst() -> String {
        let first = self[0]
        self = Array<String>(self.dropFirst())
        return first
    }
    
    mutating func millisecondsFromMMSSFF() -> Int {
        guard self.count == 3 else {
            return 0
        }
        
        let minutesString = self.extractFirst()
        let minutes: Int
        if let int = Int(minutesString)  {
            minutes = int
        } else {
            minutes = 0
        }
        
        let secondsString = self.extractFirst()
        var seconds = minutes * 60
        if let int = Int(secondsString) {
            seconds += int
        }
        
        var milliseconds = seconds * 1000
        let milliString = self.extractFirst()
        if let int = Int(milliString) {
            let millis = Double(int) / 0.075
            milliseconds += Int(millis)
        }
        
        return milliseconds
    }
}

public extension Array where Element == Int {
    mutating func extractFirst() -> Int? {
        let extraction = self.first
        self = Array<Int>(self.dropFirst())
        return extraction
    }
}

public extension Array where Element == Double {
    mutating func extractFirst() -> Double? {
        let extraction = self.first
        self = Array<Double>(self.dropFirst())
        return extraction
    }
}
