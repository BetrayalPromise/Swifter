import Foundation

public extension Array where Element: Numeric {
    /// 总和
    func sum() -> Element {
        var total: Element = 0
        for i in 0..<count {
            total += self[i]
        }
        return total
    }
}

public extension Array where Element: FloatingPoint {
    /// 均值
    func average() -> Element {
        guard !isEmpty else { return 0 }
        var total: Element = 0
        for i in 0..<count {
            total += self[i]
        }
        return total / Element(count)
    }
}

public extension Array where Element: Equatable {
    func isExist(item: Element) -> Bool {
        var index: Int = 0
        var found: Bool = false
        while (index < self.count && found == false) {
            if item == self[index] {
                found = true
            } else {
                index = index + 1
            }
        }
        if found {
            return true
        } else {
            return false
        }
    }
}

public extension Dictionary {
    @discardableResult
    func find(by key: Key) -> Any? {
        return self[key]
    }
}

public extension Dictionary {
    @discardableResult
    func buildHTTPBodyParameters() -> String? {
        var body: String = ""
        if self.keys.count == 0 {
            return nil
        } else {
            for (key, value) in self {
                body += "&\(key)=\(value)"
            }
#if swift(>=4.0)
            return String(body[body.startIndex..<body.index(body.startIndex, offsetBy: 1)])
#elseif swift(>=3.0)
            return body.substring(from: body.index(body.startIndex, offsetBy: 1))
#endif
        }
    }

    func buildHTTPBodyData() -> Data? {
        return self.buildHTTPBodyParameters()?.data(using: String.Encoding.utf8)
    }
}

public extension Array {
    /// 数组取值
    ///
    /// - Parameter index: 索引
    /// - Returns: 取值结果
    @discardableResult
    func find(at index: Int) -> Element? {
        if self.count <= index { return nil }
        return self[index]
    }
}

public extension Collection {
    subscript(safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Dictionary {
    func exist(by key: Key) -> Bool {
        return index(forKey: key) != nil
    }
    
    /// 满足过滤条件的项目数量
    ///
    /// - Parameter condition: 顾虑条件
    /// - Returns: 满足条件的项
    /// - Throws: 可能会抛出异常
    func count(where condition: @escaping ((key: Key, value: Value)) throws -> Bool) rethrows -> Int {
        var count: Int = 0
        try self.forEach {
            if try condition($0) {
                count += 1
            }
        }
        return count
    }
}

public extension Array where Element == UInt8 {
    init(hex: String) {
        self.init(reserveCapacity: hex.unicodeScalars.lazy.underestimatedCount)
        var buffer: UInt8?
        var skip = hex.hasPrefix("0x") ? 2 : 0
        for char in hex.unicodeScalars.lazy {
            guard skip == 0 else {
                skip -= 1
                continue
            }
            guard char.value >= 48 && char.value <= 102 else {
                removeAll()
                return
            }
            let v: UInt8
            let c: UInt8 = UInt8(char.value)
            switch c {
            case let c where c <= 57:
                v = c - 48
            case let c where c >= 65 && c <= 70:
                v = c - 55
            case let c where c >= 97:
                v = c - 87
            default:
                removeAll()
                return
            }
            if let b = buffer {
                append(b << 4 | v)
                buffer = nil
            } else {
                buffer = v
            }
        }
        if let b = buffer {
            append(b)
        }
    }
    
     func toHexString() -> String {
        return `lazy`.reduce("") {
            var s = String($1, radix: 16)
            if s.count == 1 {
                s = "0" + s
            }
            return $0 + s
        }
    }
}

public extension Array {
    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }
    
    var slice: ArraySlice<Element> {
        return self[self.startIndex ..< self.endIndex]
    }
}
