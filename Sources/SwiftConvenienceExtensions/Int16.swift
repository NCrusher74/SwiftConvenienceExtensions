import Foundation

extension Int16: DataConvertible {
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int16>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
