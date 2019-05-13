import UIKit

extension UINavigationBar {
    /// 控制导航栏1px线是否显示
    public var isShowLine: Bool {
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
