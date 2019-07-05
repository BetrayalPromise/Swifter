import Foundation

@discardableResult
public func handle(_ do: () throws -> Void) -> Error? {
    do {
        try `do`()
        return nil
    } catch {
        return error
    }
}

public enum Directory: RawRepresentable {
    public init?(rawValue: String) {
        switch rawValue {
        case NSHomeDirectory():
            self = .home
        case NSTemporaryDirectory():
            self = .temporary
        case NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "":
            self = .document
        case NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? "":
            self = .library
        default:
            self = .home
        }
    }
    
    case home
    case temporary
    case document
    case caches
    case library
    
    public var rawValue: String {
        switch self {
        case .home: return NSHomeDirectory()
        case .temporary: return NSTemporaryDirectory()
        case .document: return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        case .caches: return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
        case .library: return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first ?? ""
        }
    }
}
