import Foundation
import UIKit

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

public extension String {
    var bytes: Array<UInt8> {
        return data(using: String.Encoding.utf8, allowLossyConversion: true)?.bytes ?? Array(utf8)
    }
}

public extension String {
    /// 获取子字符串显示大小
    ///
    /// - Parameters:
    ///   - size: 最大显示尺寸
    ///   - font: 字体名称
    /// - Returns: 显示大小
    func scope(size: CGSize, font: UIFont) -> CGSize {
        return (self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
    
    /// 获取子字符串
    ///
    /// - Parameter range: 获取范围 0..<10 获取从1取10个子字符串
    /// - Returns: 子字符串
    func substring(in range: Range<Int>) -> String? {
        if range.lowerBound < 0 || range.upperBound > self.count {
            return nil
        }
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}
