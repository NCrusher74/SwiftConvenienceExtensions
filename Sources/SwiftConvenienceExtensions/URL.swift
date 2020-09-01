import Foundation
extension URL {
    /// Isolates and returns the parent directory of a `URL`
    public var parentDirectory: URL {
        get {
            let parent = self.deletingLastPathComponent()
            return parent
        }
        set {
            let newParentDirectory = newValue
            let fileNameFromBefore = self.lastPathComponent
            let fileNameInNewDirectory = newParentDirectory
                .appendingPathComponent(fileNameFromBefore)
            // Replace the URL with the new one:
            self = fileNameInNewDirectory
        }
    }
    
    /// Isolates and returns a filename string from a `URL`
    public var fileName: String {
        get {
            let filename = self.deletingPathExtension().lastPathComponent
            return filename
        }
    }
}
