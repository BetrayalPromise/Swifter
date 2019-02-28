//
//  GCD.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/16.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

extension DispatchQueue {
    public class func serial() -> DispatchQueue {
        return DispatchQueue(label: "")
    }
    
    public class func serial(label: String) -> DispatchQueue {
        return DispatchQueue(label: label)
    }
    
    public class func serial(qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos)
    }
    
    public class func serial(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", autoreleaseFrequency: autoreleaseFrequency)
    }
    
    public class func serial(target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", target: target)
    }
}

extension DispatchQueue {
    public class func concurrent() -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent)
    }
    
    public class func concurrent(label: String) -> DispatchQueue {
        return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent)
    }
    
    public class func concurrent(qos: DispatchQoS) -> DispatchQueue {
        return DispatchQueue(label: "", qos: qos, attributes: DispatchQueue.Attributes.concurrent)
    }
    
    public class func concurrent(autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency) -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: autoreleaseFrequency)
    }
    
    public class func concurrent(target: DispatchQueue) -> DispatchQueue {
        return DispatchQueue(label: "", attributes: DispatchQueue.Attributes.concurrent, target: target)
    }
}
