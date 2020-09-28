import Foundation

public extension UnsignedInteger {
    private init<D>(parsingLittleEndian data: D)
        where D: Collection, D.Element == UInt8 {
            assert(
                data.count <= MemoryLayout<Self>.size,
                "Data is too large to be expressed with \(Self.self)."
            )
            
            self = data.lazy.enumerated()
                .reduce(into: 0 as Self) { underConstruction, entry in
                    let byte = Self(entry.element)
                    let repositioned = byte << (entry.offset * 8)
                    underConstruction |= repositioned
            }
    }
    private func encodingLittleEndian() -> Data {
        let byteMask: Self = 0xFF
        var data = Data()
        for offset in 0 ..< MemoryLayout<Self>.size {
            let byte = self & (byteMask << (offset * 8))
            let repositioned = byte >> (offset * 8)
            data.append(UInt8(repositioned))
        }
        return data
    }
    
    init<D>(parsing data: D, _ endianness: Endianness)
        where D: Collection, D.Element == UInt8 {
            switch endianness {
                case .bigEndian:
                    self.init(parsingLittleEndian: data.reversed())
                case .littleEndian:
                    self.init(parsingLittleEndian: data)
            }
    }    
}

public enum Endianness {
    case littleEndian
    case bigEndian
}
