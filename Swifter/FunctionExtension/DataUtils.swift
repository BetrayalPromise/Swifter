import Foundation

enum ImageType {
    case unknow
    case png
    case jpeg
    case tiff
    case gif
    case webp
    case heic
}

extension Data {
    func getUTI() -> ImageType {
        let c: UnsafeMutablePointer<UInt8> = UnsafeMutablePointer<UInt8>.allocate(capacity: 1)
        self.copyBytes(to: c, count: 1)
        print(c.pointee)
        let value: UInt8 = c.pointee
        switch value {
        case 0x89:
            return .png
        case 0xFF:
            return .jpeg
        case 0x47:
            return .gif
        case 0x49, 0x4D:
            return .tiff
        case 0x52:
            if self.count >= 12 {
                guard let string: String = String(data: self.subdata(in: Range<Data.Index>(NSRange(location: 0, length: 12))!), encoding: String.Encoding.ascii) else {
                    return .unknow
                }
                if string.hasPrefix("RIFF") && string.hasSuffix("WEBP") {
                    return .webp
                }
            }
            return .unknow
        case 0:
            if self.count >= 12 {
                guard let string: String = String(data: self.subdata(in: Range<Data.Index>(NSRange(location: 4, length: 8))!), encoding: String.Encoding.ascii) else {
                    return .unknow
                }
                if string == "ftypheic" || string == "ftypheix" || string == "ftyphevc" || string == "ftyphevx" {
                    return .heic
                }
            }
            return .unknow
        default:
            return .unknow
        }
    }
}
