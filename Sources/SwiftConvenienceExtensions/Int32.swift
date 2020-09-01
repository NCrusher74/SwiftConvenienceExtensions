import Foundation

extension Int32: DataConvertible {
    var beData: Data {
        var int = self.bigEndian
        return Data(bytes: &int, count: MemoryLayout<Int32>.size)
    }
    
    var toInt: Int {
        return Int(self)
    }
}
