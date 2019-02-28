//
//  NameSpace.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/14.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

/// 需要实现的协议
public protocol NameSpaceWrappable {
    associatedtype WrapperType
    var ns: WrapperType { get }
}

public extension NameSpaceWrappable {
    var ns: NameSpaceWrapper<Self> {
        return NameSpaceWrapper(value: self)
    }
}

/// 需要扩展的协议
public protocol TypeWrapperProtocol {
    associatedtype WrappedType
    var wrappedValue: WrappedType { get }
    init(value: WrappedType)
}

/// 包裹体
public struct NameSpaceWrapper<T>: TypeWrapperProtocol {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
