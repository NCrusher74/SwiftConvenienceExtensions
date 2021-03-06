import Foundation
public extension Int {
    var double: Double {
        return Double(self)
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

    // duration is in milliseconds, convert to HH:MM:SS
    var timeStampFromMilliseconds: String {
        let milliseconds = self % 1000
        
        let seconds: TimeInterval = TimeInterval(self / 1000)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        
        if let formatted = formatter.string(from: seconds) {
            return "\(formatted)." + String(withInt: milliseconds, leadingZeros: 3)
        } else {
            return "00:00:00.000"
        }
    }

    // startTime is in milliseconds, convert to mm:ss:FF
    var cueTimeStamp: String {
        let interval: TimeInterval = TimeInterval(self / 1000)
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [ .minute, .second ]
        formatter.zeroFormattingBehavior = .pad
        
        let formatted = formatter.string(from: interval) ?? "00:00"
        
        let remainder = self % 1000
        let frames = (Double(remainder) * 0.075)
        let framesRounded = Int(frames.decimalPlaces(0))
        return "\(formatted):" + String(withInt: framesRounded, leadingZeros: 2)
    }
}
