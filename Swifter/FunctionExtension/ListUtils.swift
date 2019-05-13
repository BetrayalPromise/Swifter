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
    func registerHeaderReuseView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(T.self))
    }
    
    @available(iOS 6.0, *)
    func registerFooterReuseView<T>(with type: T.Type) where T: UICollectionReusableView {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(T.self))
    }
}

