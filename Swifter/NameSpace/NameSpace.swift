import Foundation

// #MARK: - c命名空间处理
/// 需要实现的协议
public protocol CWrapper {
    associatedtype CWrapperType
    var c: CWrapperType { get }
    static var c: CWrapperType.Type { get }
}

public extension CWrapper {
    var c: CType<Self> { return CType(value: self) }
    static var c: CType<Self>.Type { return CType.self }
}

/// 需要扩展的协议
public protocol CWrapped {
    associatedtype CWrappedType
    var value: CWrappedType { get }
    init(value: CWrappedType)
}

public struct CType<T>: CWrapped {
    public var value: T
    public init(value: T) { self.value = value }
}

// #MARK: - base64命名空间处理

public protocol Base64Wrapper {
    associatedtype Base64WrapperType
    var base64: Base64WrapperType { get }
    static var base64: Base64WrapperType.Type { get }
}

public extension Base64Wrapper {
    var base64: Base64Type<Self> { return Base64Type(value: self) }
    static var base64: Base64Type<Self>.Type { return Base64Type.self }
}

public protocol Base64Wrapped {
    associatedtype Base64WrappedType
    var value: Base64WrappedType { get }
    init(value: Base64WrappedType)
}

public struct Base64Type<T>: Base64Wrapped {
    public var value: T
    public init(value: T) { self.value = value }
}

// #MARK: -
