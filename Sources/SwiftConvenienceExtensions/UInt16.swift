import Foundation

extension UInt16: DataConvertible {
    /// Converts `UInt16` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt16>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
