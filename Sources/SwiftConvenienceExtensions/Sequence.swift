import Foundation

extension Sequence where Element: BinaryInteger {
    
    /// converts data to a string of hex values for printing and debugging
    func hexadecimal() -> String {
        return lazy.map({ String($0, radix: 16) }).joined(separator: " ")
    }
}
