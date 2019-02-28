
//
//  AOP.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2018/12/26.
//  Copyright © 2018年 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

fileprivate func AOPbegin() {
   print(#function)
}

fileprivate func AOPEnd() {
   print(#function)
}

/// AOP函数
public func aop(with closure: (() -> Void)) {
    AOPbegin()
    closure()
    AOPEnd()
}

