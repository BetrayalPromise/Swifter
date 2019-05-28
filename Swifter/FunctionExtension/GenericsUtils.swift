import Foundation

public extension UnsafePointer where Pointee == Int8 {
    /// UnsafePointer<Int8>转String
    ///
    /// - Returns: 字符串
    func asString() -> String {
        return String(cString: self)
    }
}
