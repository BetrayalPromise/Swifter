import Foundation
import UIKit.UIView

public extension UIView {
    func attach<V>(to v: V) -> Self where V: UIView {
        v.addSubview(self)
        return self
    }
}

public extension UIView {
    var safeEdge: UIEdgeInsets {
        let value: Bool = self.next?.isKind(of: UIViewController.self) ?? false
        if !value {
            return .zero
        }
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            guard let controller: UIViewController = self.next as? UIViewController else {
                return .zero
            }
            let top = controller.topLayoutGuide.length
            let bottom = controller.bottomLayoutGuide.length
            let edge: UIEdgeInsets = UIEdgeInsets(top: top, left: 0, bottom: bottom, right: 0)
            return edge
        }
    }
}
