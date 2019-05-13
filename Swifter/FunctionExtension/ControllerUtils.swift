import UIKit

enum ShowType {
    /// 平推
    case shove
    /// 模态
    case modal
    /// 既不是平推也不是模态
    case axiom
}

extension UIViewController {
    func display() -> ShowType? {
        if UIApplication.shared.delegate?.window??.rootViewController == self {
            return .axiom
        }
        if self.navigationController?.topViewController == self {
            if self.navigationController?.viewControllers.count == 1 {
                return .axiom
            } else {
                return .shove
            }
        } else {
            return .modal
        }
    }
}
