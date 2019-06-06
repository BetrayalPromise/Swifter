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
    func map<T>(_ closure: (Wrapped) throws -> T, else use : T) rethrows -> T {
        return try map(closure) ?? use
    }
    
    
    /// 转换
    ///
    /// - Parameters:
    ///   - closure: 处理闭包
    ///   - block: 默认处理闭包
    /// - Returns: 处理后的值
    /// - Throws: 可能抛出的异常
    func map<T>(_ closure: (Wrapped) throws -> T, else block: () throws -> T) rethrows -> T {
        return try map(closure) ?? block()
    }
}

extension Optional {
    /// 处理Optional 当可选值不为空时 解包并返回参数 other
    ///
    /// - Parameter other: 其他Optional类型值
    /// - Returns: &值
    func and<T>(_ other: T?) -> T? {
        guard self != nil else { return nil }
        return other
    }

    func and<T>(_ closure: (Wrapped) throws -> T?) rethrows -> T? {
        guard let unwrapped = self else { return nil }
        return try closure(unwrapped)
    }

    func zip<A>(_ value0: Optional<A>) -> (Wrapped, A)? {
        guard let a = self, let b = value0 else { return nil }
        return (a, b)
    }
    
    func zip<A, B>(_ value0: Optional<A>, _ value1: Optional<B>) -> (Wrapped, A, B)? {
        guard let a = self, let b = value0, let c = value1 else { return nil }
        return (a, b, c)
    }
    
    func zip<A, B, C>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>) -> (Wrapped, A, B, C)? {
        guard let a = self, let b = value0, let c = value1, let d = value2 else { return nil }
        return (a, b, c, d)
    }
    
    func zip<A, B, C, D>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>) -> (Wrapped, A, B, C, D)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3 else { return nil }
        return (a, b, c, d, e)
    }
    
    func zip<A, B, C, D, E>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>) -> (Wrapped, A, B, C, D, E)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4 else { return nil }
        return (a, b, c, d, e, f)
    }
    
    func zip<A, B, C, D, E, F>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>, _ value5: Optional<F>) -> (Wrapped, A, B, C, D, E, F)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4, let g = value5 else { return nil }
        return (a, b, c, d, e, f, g)
    }
    
    func zip<A, B, C, D, E, F, G>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>, _ value5: Optional<F>, _ value6: Optional<G>) -> (Wrapped, A, B, C, D, E, F, G)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4, let g = value5, let h = value6 else { return nil }
        return (a, b, c, d, e, f, g, h)
    }
    
    func zip<A, B, C, D, E, F, G, H>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>, _ value5: Optional<F>, _ value6: Optional<G>, _ value7: Optional<H>) -> (Wrapped, A, B, C, D, E, F, G, H)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4, let g = value5, let h = value6, let i = value7 else { return nil }
        return (a, b, c, d, e, f, g, h, i)
    }
    
    func zip<A, B, C, D, E, F, G, H, I>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>, _ value5: Optional<F>, _ value6: Optional<G>, _ value7: Optional<H>, _ value8: Optional<I>) -> (Wrapped, A, B, C, D, E, F, G, H, I)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4, let g = value5, let h = value6, let i = value7, let j = value8 else { return nil }
        return (a, b, c, d, e, f, g, h, i, j)
    }
    
    func zip<A, B, C, D, E, F, G, H, I, J>(_ value0: Optional<A>, _ value1: Optional<B>, _ value2: Optional<C>, _ value3: Optional<D>, _ value4: Optional<E>, _ value5: Optional<F>, _ value6: Optional<G>, _ value7: Optional<H>, _ value8: Optional<I>, _ value9: Optional<J>) -> (Wrapped, A, B, C, D, E, F, G, H, I, J)? {
        guard let a = self, let b = value0, let c = value1, let d = value2, let e = value3, let f = value4, let g = value5, let h = value6, let i = value7, let j = value8, let k = value9 else { return nil }
        return (a, b, c, d, e, f, g, h, i, j, k)
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

public extension Optional {
    /// filter函数
    ///
    /// - Parameter predicate: 过滤规则
    /// - Returns: 过滤后的值
    func filter(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let unwrapped = self,
            predicate(unwrapped) else { return nil }
        return self
    }
    
    /// expect函数
    ///
    /// - Parameter message: 错误信息
    /// - Returns: 确定有的值
    func expect(_ message: String) -> Wrapped {
        guard let value = self else { fatalError(message) }
        return value
    }
}
