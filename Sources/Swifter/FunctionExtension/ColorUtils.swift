import Foundation
#if os(iOS)
import UIKit

public extension UIColor {
    /// 十六进制数据字符串
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var scanner: Scanner? = nil
        if hex.hasPrefix("#") {
            let index0 = hex.index(hex.startIndex, offsetBy: 1)
            let index1 = hex.index(hex.endIndex, offsetBy: 0)
            scanner = Scanner(string: String(hex[index0..<index1]))
        } else {
            scanner = Scanner(string: hex)
        }
        var valueRGB: UInt32 = 0
        if scanner?.scanHexInt32(&valueRGB) == false {
            debugPrint("ERROR: hex(\(hex)) is invalid")
            self.init(red: 0,green: 0,blue: 0,alpha: 0)
        } else {
            self.init(red: CGFloat((valueRGB & 0xFF0000) >> 16) / 255.0, green: CGFloat((valueRGB & 0x00FF00) >> 8) / 255.0, blue:CGFloat(valueRGB & 0x0000FF) / 255.0, alpha: alpha)
        }
    }
    /// 十六进制数据字数据
    convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        self.init(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(rgb & 0xFF)) / 255.0, alpha: alpha)
    }
    
    convenience init(hexValue: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat((hexValue & 0xFF0000) >> 16)/255.0, green: CGFloat((hexValue & 0xFF00) >> 8)/255.0, blue: CGFloat(hexValue & 0xFF)/255.0, alpha: CGFloat(alpha))
    }
}

#endif
