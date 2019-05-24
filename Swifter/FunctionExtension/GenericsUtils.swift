import Foundation

public extension UnsafePointer where Pointee == Int8 {
    func toString() -> String {
        return String(cString: self)
    }
}
