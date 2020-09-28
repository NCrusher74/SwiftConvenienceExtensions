import Foundation

public extension String {
    /// Initializes a utf8 string from data
    init?(data: Data) {
        self.init(data: data, encoding: .utf8)
    }
    
    /// Encodes an `utf8` string to `Data`
    var encodedUtf8: Data {
        // Note: a conversion to UTF-8 cannot fail.
        return Data(self.utf8)
    }
    
    /// Encodes an `utf8` string to `Data`, adding a single null-character terminator
    var encodedUtf8WithNullTerminator: Data {
        var data = self.encodedUtf8
        data.append(0x00)
        return data
    }

    /// Encodes an `isoLatin1` string to `Data`
    var encodedISOLatin1: Data {
        return self.data(using: .isoLatin1) ?? Data()
    }

    /// Encodes an `ASCII` string to `Data`
    var encodedASCII: Data {
        return self.data(using: .ascii) ?? Data()
    }
    
    /// Divides the string separated by a semicolon character (`"; "`) into a string array.
    var toArray: [String] {
        return self.components(separatedBy: "; ")
    }
}
