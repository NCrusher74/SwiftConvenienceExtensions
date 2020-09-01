import Foundation

extension UInt64: DataConvertible {
    /// Converts `UInt64` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt64>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
