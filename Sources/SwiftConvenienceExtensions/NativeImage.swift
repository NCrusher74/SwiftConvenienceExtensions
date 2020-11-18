//
//  NativeImage.swift
//
//
//  Created by Nolaine Crusher on 11/2/20.
//

#if os(macOS)
import Cocoa
public typealias NativeImage = NSImage
public extension NSImage {
    /// Converts an `NSImage` to png data
    public var pngData: Data {
        if let tiff = tiffRepresentation,
           let bitmap = NSBitmapImageRep(data: tiff),
           let data = bitmap.representation(using: .png, properties: [.compressionFactor: 1.0]) {
            return data
        } else {
            // Not sure if this situation can ever happen anyway.
            // If it does turn out to be possible, this should be turned into a thrown error instead.
            fatalError("Unable to convert image to PNG.")
        }
    }
    
    /// Converts an `NSImage` to jpg data
    public var jpgData: Data {
        if let tiff = tiffRepresentation,
           let bitmap = NSBitmapImageRep(data: tiff),
           let data = bitmap.representation(using: .jpeg, properties: [.compressionFactor: 1.0]) {
            return data
        } else {
            // Not sure if this situation can ever happen anyway.
            // If it does turn out to be possible, this should be turned into a thrown error instead.
            fatalError("Unable to convert image to JPG.")
        }
    }
}

#elseif os(iOS)
import UIKit
public typealias NativeImage = UIImage
public extension UIImage {
    
    public var pngData: Data {
        if let data = self.pngData() {
            return data
        } else {
            return Data()
        }
    }
    
    public var jpgData: Data {
        if let data = self.jpegData(compressionQuality: 1.0) {
            return data
        } else {
            return Data()
        }
    }
}
#endif