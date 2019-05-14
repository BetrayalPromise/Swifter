import Foundation

extension String: CWrappable {}

public extension CWrapperConvertible where CWrappedType == String {
    func utf8() -> UnsafePointer<Int8>? {
        return (self.wrappedValue as NSString).utf8String
    }
}
