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
            let index: String.Index = body.index(body.startIndex, offsetBy: 1)
            return body.substring(from: index)
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
