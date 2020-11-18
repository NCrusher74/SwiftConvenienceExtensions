//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 11/18/20.
//

// These is a convenience for handling (part of total) type tuple values
public struct IntIndex: Codable {
    var index: Int
    var total: Int?
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
    var index: Double
    var total: Int?
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
    var startTime: Int
    var title: String
}
extension Chapter : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(startTime)
        hasher.combine(title)
    }
    
    public static func ==(lhs: Chapter, rhs: Chapter) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.title == rhs.title
    }
}
