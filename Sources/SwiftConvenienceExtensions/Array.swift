
import Foundation
public extension Array where Element == String {
    /// Convenience Extension. Divides string in components separated by `"; "`
    var toString: String {
        return self.joined(separator: "; ")
    }
    
    var toData: Data {
        var data = Data()
        for element in self {
            data.append(element.data)
        }
        return data
    }
}
