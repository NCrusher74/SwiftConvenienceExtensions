
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
        guard !self.isEmpty else {
            return String()
        }
        let extraction = self.first!
        self = Array<String>(self.dropFirst())
        return extraction
    }
    
    mutating func interpretTimeStampStrings() -> Int {
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
    mutating func extractFirst() -> Int {
        guard !self.isEmpty else {
            return Int()
        }
        let extraction = self.first!
        self = Array<Int>(self.dropFirst())
        return extraction
    }
}
