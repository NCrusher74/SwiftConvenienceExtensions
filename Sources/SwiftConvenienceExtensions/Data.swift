
import Foundation
extension Data {
    // MARK: - Int conversion
    /// Converts `Data` instance to `Int`, assuming big endianness
    var toIntBE: Int {
        let int = Int(data: self)
        return Int(bigEndian: int)
    }

    /// Converts `Data` instance to `Int`
    var toIntLE: Int {
        let int = Int(data: self)
        return Int(littleEndian: int)
    }

    /// Converts `Data` instance to `Int64`, assuming big endianness
    var int64BE: Int64 {
        let int = Int64(data: self)
        return Int64(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int64`
    var int64LE: Int64 {
        let int = Int64(data: self)
        return Int64(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int32`, assuming big endianness
    var int32BE: Int32 {
        let int = Int32(data: self)
        return Int32(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int32`
    var int32LE: Int32 {
        let int = Int32(data: self)
        return Int32(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int16`, assuming big endianness
    var int16BE: Int16 {
        let int = Int16(data: self)
        return Int16(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int16`
    var int16LE: Int16 {
        let int = Int16(data: self)
        return Int16(littleEndian: int)
    }
    
    /// Converts `Data` instance to `Int8`, assuming big endianness
    var int8BE: Int8 {
        let int = Int8(data: self)
        return Int8(bigEndian: int)
    }
    
    /// Converts `Data` instance to `Int8`
    var int8LE: Int8 {
        let int = Int8(data: self)
        return Int8(littleEndian: int)
    }
    
    // MARK: - uInt Conversion
    /// Converts `Data` instance to `UInt64`, assuming big endianness
    var uInt64BE: UInt64 {
        return UInt64(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt64`
    var uInt64LE: UInt64 {
        return UInt64(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt32`, assuming big endianness
    var uInt32BE: UInt32 {
        return UInt32(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt32`
    var uInt32LE: UInt32 {
        return UInt32(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt16`, assuming big endianness
    var uInt16BE: UInt16 {
        return UInt16(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt16`
    var uInt16LE: UInt16 {
        return UInt16(parsing: self, .littleEndian)
    }
    
    /// Converts `Data` instance to `UInt32`, assuming big endianness
    var uInt8BE: UInt8 {
        return UInt8(parsing: self, .bigEndian)
    }

    /// Converts `Data` instance to `UInt8`
    var uInt8LE: UInt8 {
        return UInt8(parsing: self, .littleEndian)
    }

    // MARK: - String conversion
    /// Converts data to a `utf8`-encoded string
    var stringUtf8: String? {
        return String(data: self)
    }
    
    /// Converts data to an `ascii`-encoded string
    var stringASCII: String? {
        return String(data: self, encoding: .ascii)
    }
    
    /// Converts data to an `isoLatin1`-encoded string
    var stringISO88591: String? {
        return String(data: self, encoding: .isoLatin1)
    }
    
    /// Removes and returns a null‐terminated string from the beginning of the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
    ///
    /// If there is no null‐termination, the string will be constructed from the entire subsequence.
    mutating func extractNullTerminatedString() -> String {
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
