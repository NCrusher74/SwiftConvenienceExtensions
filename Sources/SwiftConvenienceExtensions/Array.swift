
import Foundation
extension Array where Element == String {
    /// Convenience Extension. Divides string in components separated by `"; "`
    public var stringValue: String {
        return self.joined(separator: "; ")
    }
}
