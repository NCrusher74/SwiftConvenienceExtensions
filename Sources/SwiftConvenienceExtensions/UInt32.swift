import Foundation

public extension UInt32 {
    /// Converts `UInt32` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt32>.size)
    }
    
    var leData: Data {
        var int = self.littleEndian
        return Data(bytes: &int, count: MemoryLayout<Int8>.size)
    }
    
    var int: Int {
        return Int(self)
    }

    var double: Double {
        return Double(self)
    }
}
