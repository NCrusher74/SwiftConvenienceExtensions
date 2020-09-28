import Foundation

public extension String {
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
}
