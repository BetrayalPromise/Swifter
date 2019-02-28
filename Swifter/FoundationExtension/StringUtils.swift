//
//  JSON.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/7.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

/// URL编码
extension String  {
    
    /// 字符串转URL
    @discardableResult
    public func asURL() -> URL? {
        guard let url: URL = URL(string: self) else {
            return nil
        }
        return url
    }
    
}

/// base64编解码
extension String {
    
    /// base64解码
    public var base64Decoded: String? {
        guard let decodedData: Data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: decodedData, encoding: .utf8)
    }
    
    /// base64编码
    public var base64Encoded: String? {
        let plainData = self.data(using: .utf8)
        return plainData?.base64EncodedString()
    }
}

extension String {
    
    /// json字符串转json对象
    public func jsonObject() -> Any? {
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
        var object: Any?
        do {
            object = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            return nil
        }
        return object
    }
    
}
