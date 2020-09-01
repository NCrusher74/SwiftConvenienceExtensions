import Foundation

extension UInt64: DataConvertible {
    /// Converts `UInt64` to bigEndian `Data`
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt64>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }

    public var toDouble: Double {
        return Double(self)
    }
}
