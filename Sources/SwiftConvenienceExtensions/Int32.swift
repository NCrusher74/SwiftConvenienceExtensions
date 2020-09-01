import Foundation

extension Int32: DataConvertible {
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int32>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }
}
