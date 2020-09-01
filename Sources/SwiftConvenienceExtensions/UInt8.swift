import Foundation
extension UInt8: DataConvertible {
    /// Converts `UInt8` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt8>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
