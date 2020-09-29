import Foundation

public extension Int8 {
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int8>.size)
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
