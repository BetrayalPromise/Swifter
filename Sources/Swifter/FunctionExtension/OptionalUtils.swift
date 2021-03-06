import Foundation

public extension Optional {
    /// 处理Optional
    ///
    /// - Parameter value: 缺省值
    /// - Returns: 需要的不为nil的值
    @discardableResult
    func `else`(value: Wrapped) -> Wrapped {
        return self ?? value
    }
    
    /// 处理Optional 例如 optional.else(auto: print("Arrr"))
    ///
    /// - Parameter closure: 自动闭包
    /// - Returns: 需要的不为nil的值
    @discardableResult
    func `else`(nonescape closure: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? closure()
    }
    
    /// 处理Optional optional.else(else: {....})
    ///
    /// - Parameter closure: 非自动闭包
    /// - Returns: 需要的不为nil的值
    @discardableResult
    func `else`(escape closure: () -> Wrapped) -> Wrapped {
        return self ?? closure()
    }
    
    /// 处理Optional 异常情况
    ///
    /// - Parameter exception: 异常
    /// - Returns: 需要的不为nil的值
    /// - Throws: 需要抛出的异常
    @discardableResult
    func `else`(throw exception: Error) throws -> Wrapped {
        guard let unwrapped = self else { throw exception }
        return unwrapped
    }
}

public extension Optional {
    /// 是否为nil 为nil返回true否则返回false
    var isNone: Bool {
        switch self {
        case .none:
            return true
        case .some:
            return true
        }
    }
    
    /// 是否为有值 为有值返回true否则返回false
    var isSome: Bool {
        return !self.isNone
    }
}


public extension Optional {
    /// 转换
    ///
    /// - Parameters:
    ///   - closure: 处理闭包
    ///   - use: 默认值
    /// - Returns: 处理后的值
    /// - Throws: 可能抛出的异常
    func map<T>(closure: (Wrapped) throws -> T, else use : T) rethrows -> T {
        return try map(closure) ?? use
    }
    
    
    /// 转换
    ///
    /// - Parameters:
    ///   - closure: 处理闭包
    ///   - block: 默认处理闭包
    /// - Returns: 处理后的值
    /// - Throws: 可能抛出的异常
    func map<T>(closure: (Wrapped) throws -> T, else block: () throws -> T) rethrows -> T {
        return try map(closure) ?? block()
    }
}

extension Optional {
    /// 处理Optional 当可选值不为空时 解包并返回参数 other
    ///
    /// - Parameter other: 其他Optional类型值
    /// - Returns: &值
    func and<T>(value: T?) -> T? {
        guard self != nil else { return nil }
        return value
    }

    func and<T>(closure: (Wrapped) throws -> T?) rethrows -> T? {
        guard let unwrapped = self else { return nil }
        return try closure(unwrapped)
    }

    func zip<A>(value0: Optional<A>) -> (Wrapped, A)? {
        guard let a = self, let b = value0 else { return nil }
        return (a, b)
    }
    
    func zip<A, B>(value0: Optional<A>, value1: Optional<B>) -> (Wrapped, A, B)? {
        guard let a = self, let b = value0, let c = value1 else { return nil }
        return (a, b, c)
    }
    
    func zip<A, B, C>(value0: Optional<A>, value1: Optional<B>, value2: Optional<C>) -> (Wrapped, A, B, C)? {
        guard let a = self, let b = value0, let c = value1, let d = value2 else { return nil }
        return (a, b, c, d)
    }
    
    func zip<A, B, C, D>(value0: Optional<A>, value1: Optional<B>, value2: Optional<C>, value3: Optional<D>) -> (Wrapped, A, B, C, D)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3 else { return nil }
        return (a, b, c, d, e)
    }
    
    func zip<A, B, C, D, E>(value0: Optional<A>, value1: Optional<B>, value2: Optional<C>, value3: Optional<D>, value4: Optional<E>) -> (Wrapped, A, B, C, D, E)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4 else { return nil }
        return (a, b, c, d, e, f)
    }
}


public extension Optional {
    /// Optional扩展
    ///
    /// - Parameter closure: 有值处理闭包
    /// - Throws: 可能抛出异常
    func on(some closure: () throws -> Void) rethrows {
        if self != nil { try closure() }
    }
    
    /// Optional扩展
    ///
    /// - Parameter closure: 无值处理闭包
    /// - Throws: 可能抛出异常
    func on(none closure: () throws -> Void) rethrows {
        if self == nil { try closure() }
    }
}

// 自定义类型需要自行实现协议
public protocol TypeInitialize {
    init()
}

public extension Optional where Wrapped: TypeInitialize {
    /// filter函数
    ///
    /// - Parameter predicate: 过滤规则
    /// - Returns: 过滤后的值
    func filter(predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let unwrapped: Wrapped = self, predicate(unwrapped) else { return nil }
        return self
    }
    
    /// expect函数
    ///
    /// - Parameter message: 错误信息
    /// - Returns: 确定有的值
    @discardableResult
    func expect(file: String = #file, funcName: String = #function, lineName: Int = #line) -> Wrapped {
        print(file, funcName, lineName)
        guard let value: Wrapped = self else {
            #if DEBUG
            debugPrint("强制拆包错误")
            #else
            print("强制拆包错误 返回默认初始化值")
            #endif
            return Wrapped()
        }
        return value
    }
}

public extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none: return other
        case .some: return self
        }
    }

    func resolve(_ error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none: throw error()
        case .some(let wrapped): return wrapped
        }
    }
}

func when<T>(condition: () -> Bool, then: () -> T, `else`: () ->T) -> T {
    condition() ? then() : `else`()
}
