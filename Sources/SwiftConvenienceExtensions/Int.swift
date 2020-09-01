import Foundation
extension Int: DataConvertible {
    var double: Double {
        return Double(self)
    }
    
    // MARK: - 64 bit
    /// Converts integer to 64-bit signed integer
    public var int64: Int64 {
        return Int64(truncatingIfNeeded: self)
    }
    
    /// Converts int to 64-bit unsigned integer
    public var uInt64: UInt64 {
        return UInt64(truncatingIfNeeded: self)
    }
    
    // MARK: - 32 Bit
    /// Converts integer to 32-bit signed integer
    public var int32: Int32 {
        return Int32(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 32-bit unsigned integer
    public var uInt32: UInt32 {
        return UInt32(truncatingIfNeeded: self)
    }


    // MARK: - 16 Bit
    /// Converts integer to 16-bit signed integer
    public var int16: Int16 {
        return Int16(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 16-bit unsigned integer
    public var uInt16: UInt16 {
        return UInt16(truncatingIfNeeded: self)
    }
    // MARK: - 8 Bit
    /// Converts integer to 8-bit unsigned integer
    public var int8: Int8 {
        return Int8(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 8-bit unsigned integer
    public var uInt8: UInt8 {
        return UInt8(truncatingIfNeeded: self)
    }    
}
