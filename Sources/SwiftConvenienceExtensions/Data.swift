
import Foundation
public extension Data {
    // MARK: - Int conversion
    /// Converts `Data` instance to `Int`, assuming big endianness
    var toIntBE: Int {
        let signedInt = self.int64BE
        return Int(signedInt)
    }

    /// Converts `Data` instance to `Int`
    var toIntLE: Int {
        let signedInt = self.int64LE
        return Int(signedInt)
    }

    /// Converts `Data` instance to `Int64`, assuming big endianness
    var int64BE: Int64 {
        return Int64(self.uInt64BE)
    }
    
    /// Converts `Data` instance to `Int64`
    var int64LE: Int64 {
        return Int64(self.uInt64LE)
    }
    
    /// Converts `Data` instance to `Int32`, assuming big endianness
    var int32BE: Int32 {
        return Int32(self.uInt32BE)
    }
    
    /// Converts `Data` instance to `Int32`
    var int32LE: Int32 {
        return Int32(self.uInt32LE)
    }
    
    /// Converts `Data` instance to `Int16`, assuming big endianness
    var int16BE: Int16 {
        return Int16(self.uInt16BE)
    }
    
    /// Converts `Data` instance to `Int16`
    var int16LE: Int16 {
        return Int16(self.uInt16LE)
    }
    
    /// Converts `Data` instance to `Int8`, assuming big endianness
    var int8BE: Int8 {
        return Int8(self.uInt8BE)
    }
    
    /// Converts `Data` instance to `Int8`
    var int8LE: Int8 {
        return Int8(self.uInt8LE)
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
