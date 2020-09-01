import Foundation

extension UInt16: DataConvertible {
    /// Converts `UInt16` to bigEndian `Data`
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<UInt16>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }
}
