import Foundation

extension Int64: DataConvertible {
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int64>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }
}
