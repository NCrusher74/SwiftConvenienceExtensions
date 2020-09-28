import Foundation

extension Data.SubSequence {
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
                return self.extractFirst(1).int8BE.toInt
            case 2:
                return self.extractFirst(2).int16BE.toInt
            case 4:
                return self.extractFirst(4).int32BE.toInt
            case 8:
                return self.extractFirst(8).int64BE.toInt
            default:
                return self.extractFirst(4).int32BE.toInt
        }
    }

    /// Removes and returns the first *k* bytes from the subsequence as a double (which only mutates the subsequence’s bounds, not the underlying `Data` instance). Assumes big endianness.
    mutating func extractToDouble(_ k: Int) -> Double {
        switch k {
            case 1:
                return self.extractFirst(1).int8BE.toDouble
            case 2:
                return self.extractFirst(2).int16BE.toDouble
            case 4:
                return self.extractFirst(4).int32BE.toDouble
            case 8:
                return self.extractFirst(8).int64BE.toDouble
            default:
                return self.extractFirst(4).int32BE.toDouble
        }
    }
}
