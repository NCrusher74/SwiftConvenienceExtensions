//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 11/18/20.
//

import Foundation

public struct TableOfContents: Codable {
    var chaptersDictionary: [Int: String]
    
    public struct Chapter: Codable {
        public var startTime: Int
        public var title: String
        
        public init(startTime: Int, title: String) {
            self.startTime = startTime
            self.title = title
        }
    }
    
    public init(_ chapters: [Chapter]) {
        var chapterDict: [Int: String] = [:]
        for chapter in chapters {
            chapterDict[chapter.startTime] = chapter.title
        }
        self.chaptersDictionary = chapterDict
    }
    
    public var chapters: [Chapter] {
        let sorted = chaptersDictionary.sorted(by: {$0.key < $1.key})
        var chapterArray: [Chapter] = []
        for item in sorted {
            let startTime = item.key
            let title = item.value
            let chapter = Chapter(startTime: startTime, title: title)
            chapterArray.append(chapter)
        }
        return chapterArray
    }
    
    public mutating func addChapter(startTime: Int, title: String) {
        chaptersDictionary[startTime] = title
    }
    
    public mutating func removeChapter(startTime: Int) {
        chaptersDictionary[startTime] = nil
    }
    
    public mutating func removeAllChapters() {
        chaptersDictionary = [:]
    }
}

extension TableOfContents.Chapter : Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(startTime)
        hasher.combine(title)
    }
    
    public static func ==(lhs: TableOfContents.Chapter, rhs: TableOfContents.Chapter) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.title == rhs.title
    }    
}

public func convertToMilliseconds(h: Int?, m: Int?, s: Int?) -> Int {
    let h2ms = h ?? 0 * 60 * 60 * 1000
    let m2ms = m ?? 0 * 60 * 1000
    let s2ms = s ?? 0 * 1000
    return h2ms + m2ms + s2ms
}
