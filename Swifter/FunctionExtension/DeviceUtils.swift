import Foundation
import UIKit

extension UIDevice {
    public class func type() -> UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
}
