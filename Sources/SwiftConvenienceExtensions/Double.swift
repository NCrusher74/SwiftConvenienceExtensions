import Foundation
public extension Double {
    var int: Int {
        return Int(self)
    }
    
    // MARK: - 64 bit
    var int64: Int64 {
        return Int64(self)
    }
    
    var uInt64: UInt64 {
        return UInt64(self)
    }
    
    // MARK: - 32 Bit
    var int32: Int32 {
        return Int32(self)
    }
    
    var uInt32: UInt32 {
        return UInt32(self)
    }
    
    // MARK: - 16 Bit
    var int16: Int16 {
        return Int16(self)
    }
    
    var uInt16: UInt16 {
        return UInt16(self)
    }
    
    // MARK: - 8 Bit
    var int8: Int8 {
        return Int8(self)
    }
    
    var uInt8: UInt8 {
        return UInt8(self)
    }
    
    func decimalPlaces(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

public extension Float {
    func decimalPlaces(_ fractionDigits: Int) -> Float {
        let multiplier = pow(10, Float(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
