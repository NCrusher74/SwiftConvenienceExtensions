
import Foundation
extension Data {
    // MARK: - Int conversion
    /// Converts `Data` instance to `Int`, assuming big endianness
    var intValue: Int {
        let int = Int(data: self)
        return Int(bigEndian: int)
    }

    /// Converts `Data` instance to `Int`
    var intValueLittleEndian: Int {
        let int = Int(data: self)
        return Int(littleEndian: int)
    }

    /// Converts `Data` instance to `Int64`, assuming big endianness
    public var int64: Int64 {
        let int = Int64(data: self)
        return Int64(bigEndian: int)
    }
    
    /// Converts `Data` instance to `In64`
    public var int64LittleEndian: Int64 {
        let int = Int64(data: self)
        return Int64(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int32`, assuming big endianness
    public var int32: Int32 {
        let int = Int32(data: self)
        return Int32(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int32`
    public var int32LittleEndian: Int32 {
        let int = Int32(data: self)
        return Int32(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int16`, assuming big endianness
    public var int16: Int16 {
        let int = Int16(data: self)
        return Int16(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int16`
    public var int16LittleEndian: Int16 {
        let int = Int16(data: self)
        return Int16(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int8`, assuming big endianness
    public var int8: Int8 {
        let int = Int8(data: self)
        return Int8(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int8`
    public var int8LittleEndian: Int8 {
        let int = Int8(data: self)
        return Int8(littleEndian: int)
    }
    
    // MARK: - uInt Conversion
    /// Converts `Data` instance to `UInt64`, assuming big endianness
    public var uInt64: UInt64 {
        return UInt64(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt64`
    public var uInt64LittleEndian: UInt64 {
        return UInt64(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt32`, assuming big endianness
    public var uInt32: UInt32 {
        return UInt32(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt32`
    public var uInt32LittleEndian: UInt32 {
        return UInt32(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt16`, assuming big endianness
    public var uInt16: UInt16 {
        return UInt16(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt16`
    public var uInt16LittleEndian: UInt16 {
        return UInt16(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt32`, assuming big endianness
    public var uInt8: UInt8 {
        return UInt8(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt8`
    public var uInt8LittleEndian: UInt8 {
        return UInt8(parsing: self, .littleEndian)
    }

    // MARK: - String conversion
    /// Converts data to a `utf8`-encoded string
    public var stringValue: String? {
        return String(data: self)
    }
    
    /// Converts data to an `ascii`-encoded string
    public var stringASCII: String? {
        return String(data: self, encoding: .ascii)
    }
    
    /// Converts data to an `isoLatin1`-encoded string
    public var stringISO88591: String? {
        return String(data: self, encoding: .isoLatin1)
    }
    
    /// Removes and returns a null‐terminated string from the beginning of the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
    ///
    /// If there is no null‐termination, the string will be constructed from the entire subsequence.
    public mutating func extractNullTerminatedString() -> String {
        var remainder = self
        search: while let null = remainder.firstIndex(of: 0) {
            remainder = self[null...].dropFirst()
        }
        
        var stringBytes: Data.SubSequence
        if remainder.startIndex == self.startIndex {
            // No null found.
            stringBytes = self
            self = self[self.endIndex...]
        } else {
            // Null found.
            stringBytes = self[..<remainder.startIndex]
            self = remainder
            stringBytes = stringBytes.dropLast()
        }
        return String(decoding: Data(stringBytes), as: UTF8.self)
    }
}
