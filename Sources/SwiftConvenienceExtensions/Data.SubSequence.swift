import Foundation

extension Data.SubSequence {
    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
    public mutating func extractFirst(_ k: Int) -> Data.SubSequence {
        let extraction = self.prefix(k)
        self = self.dropFirst(k)
        return extraction
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a string using the specified encoding
    private mutating func extractToString(_ k: Int, encoding: String.Encoding) -> String? {
        let extraction = self.prefix(k)
        self = self.dropFirst(k)
        return String(data: extraction, encoding: encoding)
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a utf8-encoded string
    public mutating func extractToStringUtf8(_ k: Int) -> String? {
        return extractToString(k, encoding: .utf8)
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a ascii-encoded string
    public mutating func extractToStringASCII(_ k: Int) -> String? {
        return extractToString(k, encoding: .ascii)
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a isoLatin1 string
    public mutating func extractToStringISOLatin1(_ k: Int) -> String? {
        return extractToString(k, encoding: .isoLatin1)
    }

    public mutating func extractToInt(_ k: Int) -> Int {
        switch k {
            case 1:
                return self.extractFirst(1).int8.toInt
            case 2:
                return self.extractFirst(2).int16.toInt
            case 4:
                return self.extractFirst(4).int32.toInt
            case 8:
                return self.extractFirst(8).int64.toInt
            default:
                return self.extractFirst(4).int32.toInt
        }
    }

    private mutating func extractUIntToInt(_ k: Int) -> Int {
        switch k {
            case 1:
                return self.extractFirst(1).uInt8.toInt
            case 2:
                return self.extractFirst(2).uInt16.toInt
            case 4:
                return self.extractFirst(4).uInt32.toInt
            case 8:
                return self.extractFirst(8).uInt64.toInt
            default:
                return self.extractFirst(4).uInt32.toInt
        }
    }
}
