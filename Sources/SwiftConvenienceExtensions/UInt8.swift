import Foundation
public extension UInt8 {
    /// Converts `UInt8` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt8>.size)
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
