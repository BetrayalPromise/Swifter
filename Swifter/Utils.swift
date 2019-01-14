//
//  Utils.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/11.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

extension String {
    public func toBase64() -> Data? {
        guard let data: Data = self.data(using: .utf8) else {
            return nil
        }
        return data.base64EncodedData()
    }
}

extension Data {
    public func fromBase64() -> String? {
        guard let data: Data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}
