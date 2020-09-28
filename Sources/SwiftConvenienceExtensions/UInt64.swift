import Foundation

public extension UInt64 {
    /// Converts `UInt64` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt64>.size)
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
