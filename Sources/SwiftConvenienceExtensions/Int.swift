import Foundation
extension Int: DataConvertible {
    // MARK: - 64 bit
    public var int64: Int64 {
        return Int64(truncatingIfNeeded: self)
    }
    
    public var uInt64: UInt64 {
        return UInt64(truncatingIfNeeded: self)
    }
    
    // MARK: - 32 Bit
    public var int32: Int32 {
        return Int32(truncatingIfNeeded: self)
    }
    
    public var uInt32: UInt32 {
        return UInt32(truncatingIfNeeded: self)
    }
    
    // MARK: - 16 Bit
    public var int16: Int16 {
        return Int16(truncatingIfNeeded: self)
    }
    
    public var uInt16: UInt16 {
        return UInt16(truncatingIfNeeded: self)
    }

    // MARK: - 8 Bit
    public var int8: Int8 {
        return Int8(truncatingIfNeeded: self)
    }
    
    public var uInt8: UInt8 {
        return UInt8(truncatingIfNeeded: self)
    }    
}
