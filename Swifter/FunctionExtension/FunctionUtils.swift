import Foundation

@discardableResult
public func handle(_ do: () throws -> Void) -> Error? {
    do {
        try `do`()
        return nil
    } catch let error {
        return error
    }
}

public enum Directory {
    case home
    case temporary
    case document
    case caches
    var path: String {
        switch self {
        case .home: return NSHomeDirectory()
        case .temporary: return NSTemporaryDirectory()
        case .document: return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
        case .caches: return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
        }
    }
}
