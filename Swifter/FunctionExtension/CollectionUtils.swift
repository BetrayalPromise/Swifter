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
    func find(by key: AnyHashable) -> Any? {
        return (self as NSDictionary).object(forKey: key)
    }
}

public extension Dictionary {
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
    @discardableResult
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
