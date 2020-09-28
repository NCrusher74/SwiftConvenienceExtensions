//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 9/15/20.
//

import Foundation
public extension CaseIterable where Self: RawRepresentable {
    
    static var rawValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}
