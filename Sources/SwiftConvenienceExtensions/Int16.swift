import Foundation

public extension Int16 {
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int16>.size)
    }
    
    var leData: Data {
        var int = self.littleEndian
        return Data(bytes: &int, count: MemoryLayout<Int16>.size)
    }
    
    var int: Int {
        return Int(self)
    }

    var double: Double {
        return Double(self)
    }
}
