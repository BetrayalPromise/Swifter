//
//  GCD.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/16.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

// #MARK: - 串行队列
public extension DispatchQueue {
    // #MARK: - 无参数

    /// 串行队列列生成方法
    ///
    /// - Returns: 串行队列
    class func serial() -> DispatchQueue {
        return DispatchQueue(label: "")
    }

    // #MARK: - 一参数

    /// 串行队列生成方法
    ///
    /// - Parameter label: 标签
    /// - Returns: 串行队列
    class func serial(label: String) -> DispatchQueue {
        return DispatchQueue(label: label)
    }

    /// 串行队列生成方法
    ///
    /// - Parameter qos: 服务质量
    /// - Returns: 串行队列
    class func serial(qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos)
    }

    /// 串行队列生成方法
    ///
    /// - Parameter autoreleaseFrequency: 自动释放频率
    /// - Returns: 串行队列
    class func serial(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 串行队列生成方法
    ///
    /// - Parameter target: 任务运行队列
    /// - Returns: 串行队列
    class func serial(target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", target: target)
    }

    // #MARK: - 二参数

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    /// - Returns: 串行队列
    class func serial(label: String, qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 串行队列
    class func serial(label: String, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: label, autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(label: String, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, target: target)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 串行队列
    class func serial(qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(qos: DispatchQoS, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, target: target)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    // #MARK: - 三参数

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(label: String, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(label: String, qos: DispatchQoS, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, target: target)
    }

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 串行队列
    class func serial(label: String, qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, autoreleaseFrequency: autoreleaseFrequency)
    }

    // #MARK: - 四参数

    /// 串行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 串行队列
    class func serial(label: String, qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

}

// #MARK: -
// #MARK: 并行队列
public extension DispatchQueue {

    // #MARK: - 无参数

    /// 并行队列列生成方法
    ///
    /// - Returns: 并行队列
    class func concurrent() -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent)
    }

     // #MARK: - 一参数

    /// 并行队列生成方法
    ///
    /// - Parameter label: 标签
    /// - Returns: 并行队列
    class func concurrent(label: String) -> DispatchQueue {
        return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent)
    }

    /// 并行队列生成方法
    ///
    /// - Parameter qos: 服务质量
    /// - Returns: 并行队列
    class func concurrent(qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, attributes: DispatchQueue.Attributes.concurrent)
    }

    /// 并行队列生成方法
    ///
    /// - Parameter autoreleaseFrequency: 自动释放频率
    /// - Returns: 并行队列
    class func concurrent(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 并行队列生成方法
    ///
    /// - Parameter target: 任务运行队列
    /// - Returns: 并行队列
    class func concurrent(target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent, target: target)
    }

    // #MARK: - 二参数

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    /// - Returns: 并行队列
    class func concurrent(label: String, qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, attributes: DispatchQueue.Attributes.concurrent)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 并行队列
    class func concurrent(label: String, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(label: String, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent, target: target)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 并行队列
    class func concurrent(qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(qos: DispatchQoS, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, attributes: DispatchQueue.Attributes.concurrent, target: target)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    // #MARK: - 三参数

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(label: String, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(label: String, qos: DispatchQoS, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, attributes: DispatchQueue.Attributes.concurrent, target: target)
    }

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    /// - Returns: 并行队列
    class func concurrent(label: String, qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency)
    }

    // #MARK: - 四参数

    /// 并行队列生成方法
    ///
    /// - Parameters:
    ///   - label: 标签
    ///   - qos: 服务质量
    ///   - autoreleaseFrequency: 自动释放频率
    ///   - target: 目标队列
    /// - Returns: 并行队列
    class func concurrent(label: String, qos: DispatchQoS, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: label, qos: qos, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }
}

extension DispatchQueue {
    private static var onceContent = [String]()
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if onceContent.contains(token) { return }
        onceContent.append(token)
        block()
    }
}

public extension DispatchQueue {
    var queueLabel: String {
        return String(cString: __dispatch_queue_get_label(self))
    }
}
