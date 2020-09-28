import Foundation

public extension UInt16: DataConvertible {
    /// Converts `UInt16` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt16>.size)
    }
    
    var leData: Data {
        var int = self.littleEndian
        return Data(bytes: &int, count: MemoryLayout<Int8>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }

    var toDouble: Double {
        return Double(self)
    }
}
