import Foundation

public extension Sequence where Element: BinaryInteger {    
    /// converts data to a string of hex values for printing and debugging
    func hexadecimal() -> String {
        return lazy.map({ String($0, radix: 16) })
            .joined(separator: " ")
    }
}

public extension Sequence where Element: AdditiveArithmetic {
    /// Adds the element of a sequence together to get the sum of all the elements
    func sum() -> Element { reduce(.zero, +) }
}
