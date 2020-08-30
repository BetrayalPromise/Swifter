#if os(iOS)

import UIKit

enum ShowType {
    case shove /// 平推
    case modal /// 模态
    case axiom /// 既不是平推也不是模态
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

#endif
