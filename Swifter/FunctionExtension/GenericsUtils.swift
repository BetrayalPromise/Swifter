import Foundation

public extension UnsafePointer where Pointee == Int8 {
    func asString() -> String {
        return String(cString: self)
    }
}
