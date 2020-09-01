import Foundation
extension Int: DataConvertible {
    // MARK: - 64 bit
    public var int64: Int64 {
        return Int64(truncatingIfNeeded: self)
    }
    
    public var beData64BitSigned: Data {
        return self.int64.beData
    }
    
    public var uInt64: UInt64 {
        return UInt64(truncatingIfNeeded: self)
    }
    
    public var beData64BitUnsigned: Data {
        return self.uInt8.beData
    }

    // MARK: - 32 Bit
    public var int32: Int32 {
        return Int32(truncatingIfNeeded: self)
    }
    
    public var beData32BitSigned: Data {
        return self.int32.beData
    }
    
    public var uInt32: UInt32 {
        return UInt32(truncatingIfNeeded: self)
    }
    
    public var beData32BitUnsigned: Data {
        return self.uInt32.beData
    }
    
    // MARK: - 16 Bit
    public var int16: Int16 {
        return Int16(truncatingIfNeeded: self)
    }
    
    public var beData16BitSigned: Data {
        return self.int16.beData
    }
    
    public var uInt16: UInt16 {
        return UInt16(truncatingIfNeeded: self)
    }
    
    public var beData16BitUnsigned: Data {
        return self.uInt16.beData
    }
    
    // MARK: - 8 Bit
    public var int8: Int8 {
        return Int8(truncatingIfNeeded: self)
    }
    
    public var beData8BitSigned: Data {
        return self.int8.beData
    }
    
    public var uInt8: UInt8 {
        return UInt8(truncatingIfNeeded: self)
    }
    
    public var beData8BitUnsigned: Data {
        return self.uInt8.beData
    }
}
