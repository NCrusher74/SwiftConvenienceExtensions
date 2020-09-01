import Foundation

extension UInt32:DataConvertible {
    /// Converts `UInt32` to bigEndian `Data`
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt32>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
