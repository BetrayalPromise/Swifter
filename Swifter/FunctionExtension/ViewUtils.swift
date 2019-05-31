import Foundation
import UIKit.UIView

public extension UIView {
    func attach<V>(to v: V) -> Self where V: UIView {
        v.addSubview(self)
        return self
    }
}
