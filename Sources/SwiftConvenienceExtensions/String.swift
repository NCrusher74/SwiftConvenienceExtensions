import Foundation

extension String: DataConvertible {
    /// Initializes a utf8 string from data
    public init?(data: Data) {
        self.init(data: data, encoding: .utf8)
    }
    
    /// Encodes an `utf8` string to `Data`
    public var encodedUtf8: Data {
        // Note: a conversion to UTF-8 cannot fail.
        return Data(self.utf8)
    }
    
    /// Encodes an `utf8` string to `Data`, adding a single null-character terminator
    public var encodedUtf8WithNullTerminator: Data {
        var data = self.encodedUtf8
        data.append(0x00)
        return data
    }

    /// Encodes an `isoLatin1` string to `Data`
    public var encodedISOLatin1: Data {
        return self.data(using: .isoLatin1) ?? Data()
    }

    /// Encodes an `ASCII` string to `Data`
    public var encodedASCII: Data {
        return self.data(using: .ascii) ?? Data()
    }
    
    /// Divides the string separated by a semicolon character (`"; "`) into a string array.
    public var arrayValue: [String] {
        return self.components(separatedBy: "; ")
    }
}
