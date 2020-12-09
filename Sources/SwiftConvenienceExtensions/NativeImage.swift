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
    var pngData: Data {
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
    var jpgData: Data {
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
    
    var pngData: Data {
        if let data = self.pngData() {
            return data
        } else {
            return Data()
        }
    }
    
    var jpgData: Data {
        if let data = self.jpegData(compressionQuality: 1.0) {
            return data
        } else {
            return Data()
        }
    }
}
#endif

public extension NativeImage {
    static func ==(lhs: NativeImage, rhs: NativeImage) -> Bool {
        return lhs.jpgData == rhs.jpgData
    }
    
    /// Compares an imported image against other images, and if a match is found, returns the UUID of the image.
    /// - Parameter images: The existing images being compared against
    /// - Returns: The `UUID` key under which the existing image may be saved
    func isStored(in images: [UUID : NativeImage]) -> UUID? {
        for image in images {
            if self == image.value {
                return image.key
            }
        }
        return nil
    }
    
    /// Writes an image to local storage
    /// - Parameters:
    ///   - directory: The directory into which the image will be saved
    ///   - id: The `UUID` that will be used as the image's file name
    func save(directory: URL, id: UUID) throws {
        let url = directory
            .appendingPathComponent(id.uuidString)
            .appendingPathExtension("jpg")
        try jpgData.write(to: url)
    }
}
