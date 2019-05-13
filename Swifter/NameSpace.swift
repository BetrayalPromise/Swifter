import Foundation

// #MARK: - C命名空间处理 -
/// 需要实现的协议
public protocol CWrappable {
    associatedtype CWrapperType
    var c: CWrapperType { get }
    //    static var C: CWrapperType.Type { get }
}

public extension CWrappable {
    var c: CWrapper<Self> { return CWrapper(value: self) }
    //    static var C: CWrapper<Self>.Type { return CWrapper.self }
}

/// 需要扩展的协议
public protocol CWrapperConvertible {
    associatedtype CWrappedType
    var wrappedValue: CWrappedType { get }
    init(value: CWrappedType)
}

public struct CWrapper<T>: CWrapperConvertible {
    public var wrappedValue: T
    public init(value: T) { self.wrappedValue = value }
}

// #MARK: -
