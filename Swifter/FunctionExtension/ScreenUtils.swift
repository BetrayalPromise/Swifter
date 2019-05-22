import Foundation
import UIKit

extension UIScreen {
    /// 获取尺寸
    ///
    /// - Returns: 绝对尺寸
    class func absolute() -> CGSize {
        let width: CGFloat = UIScreen.main.responds(to: #selector(getter: nativeBounds)) ? UIScreen.main.nativeBounds.size.width / UIScreen.main.nativeScale : UIScreen.main.bounds.size.width
        let height: CGFloat = UIScreen.main.responds(to: #selector(getter: nativeBounds)) ? UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale : UIScreen.main.bounds.size.height
        return CGSize(width: width, height: height)
    }

    /// 获取尺寸
    ///
    /// - Returns: 相对尺寸
    class func relative() -> CGSize {
        return UIScreen.main.bounds.size
    }
}
