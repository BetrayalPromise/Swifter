import UIKit
import ObjectiveC

public extension NSObject {
    func set<T>(data: T, key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) where T: Any {
        objc_setAssociatedObject(self, key, data, policy)
    }
    
    func get(key: UnsafeRawPointer) -> Any? {
        return objc_getAssociatedObject(self, key)
    }
}
