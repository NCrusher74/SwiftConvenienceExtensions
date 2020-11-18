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
