//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 11/18/20.
//

// These is a convenience for handling (part of total) type tuple values
public struct IntIndex {
    public var index: Int
    public var total: Int?
    
//    init(index: Int, total: Int?) {
//        self.index = index
//        self.total = total
//    }
}

extension IntIndex : Hashable, Codable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
        hasher.combine(total)
    }
    
    public static func ==(lhs: IntIndex, rhs: IntIndex) -> Bool {
        return lhs.index == rhs.index && lhs.total == rhs.total
    }
}

public struct DoubleIndex {
    public var index: Double
    public var total: Int?

//    init(index: Double, total: Int?) {
//        self.index = index
//        self.total = total
//    }
}
extension DoubleIndex : Hashable, Codable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(index)
        hasher.combine(total)
    }
    
    public static func ==(lhs: DoubleIndex, rhs: DoubleIndex) -> Bool {
        return lhs.index == rhs.index && lhs.total == rhs.total
    }
}
