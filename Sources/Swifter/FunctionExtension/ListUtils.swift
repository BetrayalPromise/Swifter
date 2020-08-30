#if os(iOS)
import Foundation
import UIKit

public extension UITableView {
    @available(iOS 6.0, *)
    func registerCell<T>(with type: T.Type) where T: UITableViewCell {
        self.register(T.self, forCellReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerReuseView<T>(with type: T.Type) where T: UITableViewHeaderFooterView {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(T.self))
    }
}

public extension UICollectionView {
    @available(iOS 6.0, *)
    func registerCell<T>(with type: T.Type) where T: UICollectionViewCell {
        self.register(T.self, forCellWithReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerHeaderView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerFooterView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(T.self))
    }
}

public protocol IndexPathControllable: class {
    var indexPath: IndexPath? { set get }
}

public extension IndexPathControllable where Self: UITableViewCell {
    var indexPath: IndexPath? {
        set {
            guard let `newValue` = newValue else { return }
            objc_setAssociatedObject(self, NSStringFromClass(Self.self), newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        } get {
            return objc_getAssociatedObject(self, NSStringFromClass(Self.self)) as? IndexPath
        }
    }
}

public extension IndexPathControllable where Self: UICollectionViewCell {
    var indexPath: IndexPath? {
        set {
            guard let `newValue` = newValue else { return }
            objc_setAssociatedObject(self, NSStringFromClass(Self.self), newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        } get {
            return objc_getAssociatedObject(self, NSStringFromClass(Self.self)) as? IndexPath
        }
    }
}
#endif
