import Foundation

protocol DataConvertible {
}

public extension DataConvertible where Self: ExpressibleByIntegerLiteral {
    /// Converts data to integer, assuming little endianness
    init(data: Data) {
        var value: Self = 0
        guard data.count == MemoryLayout.size(ofValue: value) else { fatalError("The number of bytes provided does not match the number required for conversion.") }
        _ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0)} )
        self = value
    }
    
    /// Converts conforming integers to data, assuming little endianness
    var data: Data {
        return withUnsafeBytes(of: self) { Data($0) }
    }
}

public extension DataConvertible where Self: ExpressibleByStringLiteral {
    /// converts data to string
    init?(data: Data) {
        var string: Self = ""
        guard data.count == MemoryLayout.size(ofValue: string) else { return nil }
        _ = withUnsafeMutableBytes(of: &string, { data.copyBytes(to: $0)} )
        self = string
    }
    
    /// converts string to data
    var data: Data {
        return withUnsafeBytes(of: self) { Data($0) }
    }
}
