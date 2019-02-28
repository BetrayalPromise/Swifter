//
//  CommonUtils.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/14.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

public extension Array where Element: Numeric {
    
    /// 总和
    public func sum() -> Element {
        var total: Element = 0
        for i in 0..<count {
            total += self[i]
        }
        return total
    }
    
}

extension Array where Element: FloatingPoint {
    
    /// 均值
    public func average() -> Element {
        guard !isEmpty else { return 0 }
        var total: Element = 0
        for i in 0..<count {
            total += self[i]
        }
        return total / Element(count)
    }
    
}

public extension Dictionary {
    
    @discardableResult
    public func find(by key: AnyHashable) -> Any? {
        return (self as NSDictionary).object(forKey: key)
    }
    
}
