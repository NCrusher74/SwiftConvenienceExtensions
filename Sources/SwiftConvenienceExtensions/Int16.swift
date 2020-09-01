import Foundation

extension Int16: DataConvertible {
    public var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int16>.size)
    }
    
    public var toInt: Int {
        return Int(self)
    }

    public var toDouble: Double {
        return Double(self)
    }
}
