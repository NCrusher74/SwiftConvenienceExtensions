import Foundation

public extension Data.SubSequence {
    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance).
    mutating func extractFirst(_ k: Int) -> Data.SubSequence {
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
    mutating func extractToStringUtf8(_ k: Int) -> String? {
        return extractToString(k, encoding: .utf8)
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a ascii-encoded string
    mutating func extractToStringASCII(_ k: Int) -> String? {
        return extractToString(k, encoding: .ascii)
    }

    /// Removes and returns the first *k* bytes from the subsequence (which only mutates the subsequence’s bounds, not the underlying `Data` instance) and converts to a isoLatin1 string
    mutating func extractToStringISOLatin1(_ k: Int) -> String? {
        return extractToString(k, encoding: .isoLatin1)
    }

    /// Removes and returns the first *k* bytes from the subsequence as an integer (which only mutates the subsequence’s bounds, not the underlying `Data` instance). Assumed big endianness.
    mutating func extractToInt(_ k: Int) -> Int {
        switch k {
            case 1:
                return self.extractFirst(1).uInt8BE.int
            case 2:
                return self.extractFirst(2).uInt16BE.int
            case 4:
                return self.extractFirst(4).uInt32BE.int
            case 8:
                return self.extractFirst(8).uInt64BE.int
            default:
                return self.extractFirst(4).uInt32BE.int
        }
    }

    /// Removes and returns the first *k* bytes from the subsequence as a double (which only mutates the subsequence’s bounds, not the underlying `Data` instance). Assumes big endianness
    mutating func extractToDouble(_ k: Int) -> Double {
        switch k {
            case 1:
                return self.extractFirst(1).uInt8BE.double
            case 2:
                return self.extractFirst(2).uInt16BE.double
            case 4:
                return self.extractFirst(4).uInt32BE.double
            case 8:
                return self.extractFirst(8).uInt64BE.double
            default:
                return self.extractFirst(4).uInt32BE.double
        }
    }
}
