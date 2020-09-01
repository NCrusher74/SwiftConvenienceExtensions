import Foundation

extension UInt32:DataConvertible {
    /// Converts `UInt32` to bigEndian `Data`
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt32>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }

    public var toDouble: Double {
        return Double(self)
    }
}
