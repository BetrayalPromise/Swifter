import UIKit

public extension UINavigationBar {
    /// 控制导航栏1px线是否显示
    var isShowLine: Bool {
        get {
            var findV: UIView?
            for v in self.subviews {
                for vv in v.subviews {
                    if vv.isKind(of: UIImageView.self) && vv.frame.size.height == 0.5 {
                        findV = vv
                        break
                    }
                }
            }
            return findV?.isHidden ?? true
        } set {
            for v in self.subviews {
                for vv in v.subviews {
                    if vv.isKind(of: UIImageView.self) && vv.frame.size.height == 0.5 {
                        vv.isHidden = newValue
                        break
                    }
                }
            }
        }
    }
}

public extension UINavigationBar {
    /// 控制导航栏是否透明
    func opaque(value: Bool) {
        for v in self.subviews {
            for vv in v.subviews {
                if vv.isKind(of: UIVisualEffectView.self) && vv.subviews.count > 1 {
                    if value {
                        vv.subviews[1].isHidden = false
                    } else {
                        vv.subviews[1].isHidden = true
                    }
                }
            }
        }
    }

    /// 控制导航栏颜色
    func color(value: UIColor) {
        for v in self.subviews {
            for vv in v.subviews {
                if vv.isKind(of: UIVisualEffectView.self) && vv.subviews.count > 1 {
                    vv.subviews[0].backgroundColor = value
                }
            }
        }
    }
}
