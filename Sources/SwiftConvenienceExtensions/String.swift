import Foundation
fileprivate let badChars = CharacterSet.alphanumerics.inverted

public extension DefaultStringInterpolation {
    mutating func appendInterpolation(pad value: Int, toWidth width: Int, using paddingCharacter: Character = "0") {
        appendInterpolation(String(format: "%\(paddingCharacter)\(width)d", value))
    }
}

public extension StringProtocol {
    func distance(of element: Element) -> Int? { firstIndex(of: element)?.distance(in: self) }
    func distance<S: StringProtocol>(of string: S) -> Int? { range(of: string)?.lowerBound.distance(in: self) }
}

public extension String.Index {
    func distance<S: StringProtocol>(in string: S) -> Int { string.distance(to: self) }
}


public extension String {
    func padLeft(_ k: Int, with character: Character = " ") -> String {
        return String(repeating: character, count: k) + self
    }

    func padRight(_ k: Int, with character: Character = " ") -> String {
        return self + String(repeating: character, count: k)
    }

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
            .uppercased()
    }
    
    init(withInt int: Int, leadingZeros: Int = 2) {
        self.init(format: "%0\(leadingZeros)d", int)
    }
    
    func leadingZeros(_ zeros: Int = 2) -> String {
        if let int = Int(self) {
            return String(withInt: int, leadingZeros: zeros)
        }
        print("Warning: \(self) is not an Int")
        return ""
    }

    private func attemptAAXDate() -> Date? {
        let calendar = Calendar(identifier: .iso8601)
        let timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.timeZone = timeZone
        
        let stringComponents: [String] = self.components(separatedBy: "-")
        
        guard stringComponents.count == 3 && ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"].contains(stringComponents[1]) else {
            return nil
        }
        
        if let dayInt = Int(stringComponents[0]) {
            dateComponents.day = dayInt
        } else {
            dateComponents.day = nil
        }
        
        let monthAbbreviated = stringComponents[1]
        switch monthAbbreviated {
            case "JAN": dateComponents.month = 01
            case "FEB": dateComponents.month = 02
            case "MAR": dateComponents.month = 03
            case "APR": dateComponents.month = 04
            case "MAY": dateComponents.month = 05
            case "JUN": dateComponents.month = 06
            case "JUL": dateComponents.month = 07
            case "AUG": dateComponents.month = 08
            case "SEP": dateComponents.month = 09
            case "OCT": dateComponents.month = 10
            case "NOV": dateComponents.month = 11
            case "DEC": dateComponents.month = 12
            default: dateComponents.month = nil
        }
        
        if let yearInt = Int(stringComponents[2]) {
            dateComponents.year = yearInt
        }
        
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return nil
        }
    }
    
    
    @available(OSX 10.12, iOS 12.0, *)
    private func attemptOtherDate() -> Date? {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        
        let formats: [String] = ["d MMM yyyy HH:mm:ss", "yyyy-MM-ddTHH:mm", "yyyy-MM-ddTHH:mm:ssZ", "MM-dd-yyyy HH:mm","yyyy-MM-ddTHH", "MMM d, yyyy", "d MMM yyyy", "yyyy-MM-dd", "MM/dd/yyyy", "dd/MM/yyyy", "dd.MM.yy", "dd.MM.yyyy", "dd-MM-yy", "dd-MM-yyyy", "dd-MMM-yyyy", "dd-MMM-yy", "MM-dd-yyyy", "MMMM yyyy", "yyyy-MM"]
        let dateFormatters: [DateFormatter] = formats.map { format in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = format
            return formatter
        }
        
        if let date = isoFormatter.date(from: self) {
            return date
        } else {
            for format in dateFormatters {
                if let date = format.date(from: self) {
                    return date
                } else {
                    return nil
                }
            }; return nil
        }
    }
    
    @available(OSX 10.12, iOS 12.0, *)
    func attemptDateFromYear() -> Date? {
        guard self.count == 4 else {
            return nil
        }
        
        let calendar = Calendar(identifier: .iso8601)
        let timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        
        var dateComponents = DateComponents()
        dateComponents.calendar = calendar
        dateComponents.timeZone = timeZone
        
        if let int = Int(self) {
            dateComponents.year = int
            return calendar.date(from: dateComponents)
        } else {
            return nil
        }
    }
    
    @available(OSX 10.12, iOS 12.0, *)
    func attemptDateFromString() -> Date? {
        if let date = attemptAAXDate() {
            return date
        } else if let date = attemptDateFromYear() {
            return date
        } else if let date = attemptOtherDate() {
            return date
        } else {
            return nil
        }
    }
    
    private var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    private var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    var camelCased: String {
        guard !isEmpty else {
            return ""
        }
        
        let parts = self.components(separatedBy: badChars)
        
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})
        
        return ([first] + rest).joined(separator: "")
    }
    
    mutating func extractFirst(_ k: Int = 0) -> String {
        let extraction = self.prefix(k)
        self = String(self.dropFirst(k))
        return String(extraction)
    }
    
    func convertedCamelCase() -> String {
        return self
            .replacingOccurrences(of: "([A-Z])",
                                  with: " $1",
                                  options: .regularExpression,
                                  range: range(of: self))
            .capitalized
    }

    func millisecondsFromHHMMSSZZZ() -> Int {
        var components = self.components(separatedBy: ":")
        guard components.count == 3 else {
            return 0
        }
        
        let hourString = components.extractFirst()
        var hours = 0
        if let int = Int(hourString) {
            hours = int
        }
        
        let minuteString = components.extractFirst()
        var minutes = hours * 60
        if let int = Int(minuteString) {
            minutes += int
        }
        
        let lastString = components.extractFirst()
        var secondsParts = lastString.components(separatedBy: ".")
        let secondsString = secondsParts.extractFirst()
        
        var seconds = minutes * 60
        if let int = Int(secondsString) {
            seconds += int
        }
        
        var milliseconds = seconds * 1000
        if let milliString = secondsParts.last {
            if let int = Int(milliString) {
                milliseconds += int
            }
        }
        
        return milliseconds
    }
}
