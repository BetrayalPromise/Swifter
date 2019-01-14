//
//  JSON.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/7.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

public protocol URLConvertible {
    func asURL() -> URL?
}

extension String: URLConvertible {
   
    /// 字符串转URL
    public func asURL() -> URL? {
        guard let url: URL = URL(string: self) else {
#if debug
            print("不能生成URL")
#endif
            return nil
        }
        return url
    }
    
}
