import Foundation

extension Data.SubSequence {
    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
    public mutating func extractFirst(_ k: Int) -> Data.SubSequence {
        let extraction = self.prefix(k)
        self = self.dropFirst(k)
        return extraction
    }
    
    /// Removes the first 8 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `Int64` value, assumes big endianness
    public mutating func extractToInt64() -> Int64 {
        let extraction = self.extractFirst(8)
        return extraction.int64
    }

    public mutating func extractInt64ToInt() -> Int {
        return Int(self.extractToInt64())
    }

    /// Removes the first 8 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `UInt64` value, assumes big endianness
    public mutating func extractToUInt64() -> UInt64 {
        let extraction = self.extractFirst(8)
        return extraction.uInt64
    }

    public mutating func extractUInt64ToInt() -> Int {
        return Int(self.extractToUInt64())
    }

    /// Removes the first 4 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `Int32` value
    public mutating func extractToInt32() -> Int32 {
        let extraction = self.extractFirst(4)
        return extraction.int32
    }

    public mutating func extractInt32ToInt() -> Int {
        return Int(self.extractToInt32())
    }

    /// Removes the first 8 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `UInt32` value, assumes big endianness
    public mutating func extractToUInt32() -> UInt32 {
        let extraction = self.extractFirst(4)
        return extraction.uInt32
    }

    public mutating func extractUInt32ToInt() -> Int {
        return Int(self.extractToUInt32())
    }
    
    /// Removes the first 2 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `Int16` value
    public mutating func extractToInt16() -> Int16 {
        let extraction = self.extractFirst(2)
        return extraction.int16
    }

    public mutating func extractUInt16ToInt() -> Int {
        return Int(self.extractToUInt16())
    }
    
    /// Removes the first 8 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `UInt16` value, assumes big endianness
    public mutating func extractToUInt16() -> UInt16 {
        let extraction = self.extractFirst(2)
        return extraction.uInt16
    }

    /// Removes the first byte from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `Int8` value
    public mutating func extractToInt8() -> Int8 {
        let extraction = self.extractFirst(1)
        return extraction.int8
    }
    
    public mutating func extractInt8ToInt() -> Int {
        return Int(self.extractToInt8())
    }
    
    /// Removes the first 8 bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and returns an `UInt8` value, assumes big endianness
    public mutating func extractToUInt8() -> UInt8 {
        let extraction = self.extractFirst(1)
        return extraction.uInt8
    }
    
    public mutating func extractUInt8ToInt() -> Int {
        return Int(self.extractToUInt8())
    }
}
