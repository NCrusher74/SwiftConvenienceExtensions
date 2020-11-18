//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 11/18/20.
//

// These is a convenience for handling (part of total) type tuple values
public struct IntIndex: Codable {
    public var index: Int
    public var total: Int?
}
extension IntIndex : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
        hasher.combine(total)
    }
    
    public static func ==(lhs: IntIndex, rhs: IntIndex) -> Bool {
        return lhs.index == rhs.index && lhs.total == rhs.total
    }
}

public struct DoubleIndex: Codable {
    public var index: Double
    public var total: Int?
}
extension DoubleIndex : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
        hasher.combine(total)
    }
    
    public static func ==(lhs: DoubleIndex, rhs: DoubleIndex) -> Bool {
        return lhs.index == rhs.index && lhs.total == rhs.total
    }
}

public struct Chapter: Codable {
    public var startTime: Int
    public var title: String
}

extension Chapter : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(startTime)
        hasher.combine(title)
    }
    
    public static func ==(lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.title == rhs.title
    }

    public init(hrs: Int?, mins: Int?, secs: Int?, title: String) {
        self.startTime = convertToMilliseconds(h: hrs, m: mins, s: secs)
        self.title = title
    }
}

public func convertToMilliseconds(h: Int?, m: Int?, s: Int?) -> Int {
    let h2ms = h ?? 0 * 60 * 60 * 1000
    let m2ms = m ?? 0 * 60 * 1000
    let s2ms = s ?? 0 * 1000
    return h2ms + m2ms + s2ms
}
