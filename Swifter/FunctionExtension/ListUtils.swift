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

extension UITableViewCell {
    private struct UITableViewCellAssociated {
        static var key: String = "UITableViewCellAssociatedKey"
    }
    
    public var indexPath: IndexPath? {
        set {
            let value = objc_getAssociatedObject(self, &UITableViewCellAssociated.key) as? IndexPath
            if value != nil {
                if value != newValue {
                    objc_setAssociatedObject(self, &UITableViewCellAssociated.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                }
            } else {
                objc_setAssociatedObject(self, &UITableViewCellAssociated.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        } get {
            return objc_getAssociatedObject(self, &UITableViewCellAssociated.key) as? IndexPath
        }
    }
}

public extension UICollectionView {
    @available(iOS 6.0, *)
    func registerCell<T>(with type: T.Type) where T: UICollectionViewCell {
        self.register(T.self, forCellWithReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerHeaderReuseView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerFooterReuseView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(T.self))
    }
}

extension UICollectionViewCell {
    private struct UICollectionViewCellAssociated {
        static var key: String = "UICollectionViewCellAssociatedKey"
    }
    
    public var indexPath: IndexPath? {
        set {
            let value = objc_getAssociatedObject(self, &UICollectionViewCellAssociated.key) as? IndexPath
            if value != nil {
                if value != newValue {
                    objc_setAssociatedObject(self, &UICollectionViewCellAssociated.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
                }
            } else {
                objc_setAssociatedObject(self, &UICollectionViewCellAssociated.key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        } get {
            return objc_getAssociatedObject(self, &UICollectionViewCellAssociated.key) as? IndexPath
        }
    }
}
