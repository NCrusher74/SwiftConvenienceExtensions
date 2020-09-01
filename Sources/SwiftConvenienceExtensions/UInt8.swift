import Foundation
extension UInt8: DataConvertible {
    /// Converts `UInt8` to bigEndian `Data`
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt8>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }

    public var toDouble: Double {
        return Double(self)
    }
}
