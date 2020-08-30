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

