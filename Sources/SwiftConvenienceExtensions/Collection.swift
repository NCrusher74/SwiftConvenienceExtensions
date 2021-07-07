//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 7/6/21.
//

import Foundation

public extension Collection where Element: Equatable {
    /// Compares the elements in a collection to determine if they are identical
    func allAreEqual() -> Bool {
        guard let first = self.first else { return true } // empty
        return self.dropFirst().allSatisfy { $0 == first }
    }
}

public extension Collection {
    func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
}
