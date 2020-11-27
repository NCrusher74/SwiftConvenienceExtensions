//
//  File.swift
//
//
//  Created by Nolaine Crusher on 11/26/20.
//

import Foundation
// books.sorted(by: { SortableOptional($0.seriesIndex) < SortableOptional($1.seriesIndex) })
public struct SortableOptional<T>: Comparable where T: Comparable {
    var optional: T?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs.optional, rhs.optional) {
            case (.none, .none):
                return true
            case (.none, .some),
                 (.some, .none):
                return false
            case (.some(let left), .some(let right)):
                return left == right
        }
    }
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs.optional, rhs.optional) {
            case (.none, .none):
                return false
            case (.none, .some):
                return true
            case (.some, .none):
                return false
            case (.some(let left), .some(let right)):
                return left < right
        }
    }
}

public struct ReversedSortableOptional<T>: Comparable where T: Comparable {
    var optional: T?
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs.optional, rhs.optional) {
            case (.none, .none):
                return true
            case (.none, .some),
                 (.some, .none):
                return false
            case (.some(let left), .some(let right)):
                return left == right
        }
    }
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        switch (lhs.optional, rhs.optional) {
            case (.none, .none):
                return false
            case (.none, .some):
                return false
            case (.some, .none):
                return true
            case (.some(let left), .some(let right)):
                return left < right
        }
    }
}
