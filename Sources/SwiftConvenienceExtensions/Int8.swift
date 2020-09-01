import Foundation

extension Int8: DataConvertible {
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int8>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }
}
