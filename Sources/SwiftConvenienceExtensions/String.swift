import Foundation

public extension String {
    var delimitedArray: [String] {
        var nameDelimiters = NSCharacterSet.newlines
        nameDelimiters.formUnion(NSCharacterSet(charactersIn: ",;&") as CharacterSet)
        return self.components(separatedBy: nameDelimiters)
    }
    
    var delimitedGenre: [String] {
        var genreDelimiters = NSCharacterSet.newlines
        genreDelimiters.formUnion(NSCharacterSet(charactersIn: ":|") as CharacterSet)
        return self.components(separatedBy: genreDelimiters)
    }

    /// Initializes a utf8 string from data
    private init?(data: Data) {
        self.init(data: data, encoding: .utf8)
    }
    
    /// Encodes an `utf8` string to `Data`
    var encodedUtf8: Data {
        // Note: a conversion to UTF-8 cannot fail.
        return Data(self.utf8)
    }
    
    /// Encodes an `utf8` string to `Data`, adding a single null-character terminator
    var nullTerminatedUtf8: Data {
        var data = self.encodedUtf8
        data.append(0x00)
        return data
    }

    /// Encodes an `isoLatin1` string to `Data`
    var encodedISOLatin1: Data {
        return self.data(using: .isoLatin1) ?? Data()
    }

    /// Encodes an `utf8` string to `Data`, adding a single null-character terminator
    var nullTerminatedISOLatin1: Data {
        var data = self.encodedISOLatin1
        data.append(0x00)
        return data
    }

    /// Encodes an `ASCII` string to `Data`
    var encodedASCII: Data {
        return self.data(using: .ascii) ?? Data()
    }

    /// Encodes an `utf8` string to `Data`, adding a single null-character terminator
    var nullTerminatedASCII: Data {
        var data = self.encodedASCII
        data.append(0x00)
        return data
    }

    /// Divides the string separated by a semicolon character (`"; "`) into a string array.
    var toArray: [String] {
        return self.components(separatedBy: "; ")
    }

    func convertCamelToUpperCase() -> String {
        return self
            .replacingOccurrences(of: "([A-Z])",
                                  with: " $1",
                                  options: .regularExpression,
                                  range: range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
    }
    
    init(withInt int: Int, leadingZeros: Int = 2) {
        self.init(format: "%0\(leadingZeros)d", int)
    }
    
    func leadingZeros(_ zeros: Int) -> String {
        if let int = Int(self) {
            return String(withInt: int, leadingZeros: zeros)
        }
        print("Warning: \(self) is not an Int")
        return ""
    }
}

extension DefaultStringInterpolation {
    mutating func appendInterpolation(pad value: Int, toWidth width: Int, using paddingCharacter: Character = "0") {
        appendInterpolation(String(format: "%\(paddingCharacter)\(width)d", value))
    }
}
