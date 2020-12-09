import Foundation
public extension Int {
    var double: Double {
        return Double(self)
    }
    
    // startTime is in milliseconds, convert to HH:MM:SS
    var startTimeAsTimeStamp: String {
        let double = self.double
        let seconds: TimeInterval = double / 1000
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        return formatter.string(from: seconds) ?? ""
    }

    // MARK: - 64 bit
    /// Converts integer to 64-bit signed integer
    var int64: Int64 {
        return Int64(truncatingIfNeeded: self)
    }
    
    /// Converts int to 64-bit unsigned integer
    var uInt64: UInt64 {
        return UInt64(truncatingIfNeeded: self)
    }
    
    // MARK: - 32 Bit
    /// Converts integer to 32-bit signed integer
    var int32: Int32 {
        return Int32(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 32-bit unsigned integer
    var uInt32: UInt32 {
        return UInt32(truncatingIfNeeded: self)
    }


    // MARK: - 16 Bit
    /// Converts integer to 16-bit signed integer
    var int16: Int16 {
        return Int16(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 16-bit unsigned integer
    var uInt16: UInt16 {
        return UInt16(truncatingIfNeeded: self)
    }
    // MARK: - 8 Bit
    /// Converts integer to 8-bit unsigned integer
    var int8: Int8 {
        return Int8(truncatingIfNeeded: self)
    }
    
    /// Converts integer to 8-bit unsigned integer
    var uInt8: UInt8 {
        return UInt8(truncatingIfNeeded: self)
    }    
}
