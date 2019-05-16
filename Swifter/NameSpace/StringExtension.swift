import Foundation

extension String: CWrapper {}

public extension CWrapped where CWrappedType == String {
    func utf8() -> UnsafePointer<Int8>? {
        return (self.value as NSString).utf8String
    }
}

extension String: Base64Wrapper {}

public extension Base64Wrapped where Base64WrappedType == String {
    func decoded() -> String? {
        guard let data = Data(base64Encoded: self.value) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func encoded() -> String? {
        guard let data = self.value.data(using: .utf8) else { return nil }
        return data.base64EncodedString()
    }
}

public extension String {
    func character() -> Character? {
        return self.count != 1 ? nil : Character(self)
    }
    
    func characters() -> [Character] {
        return Array(self)
    }
}
