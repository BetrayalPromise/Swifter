#if os(iOS)
import Foundation
import UIKit
//import YogaKit

public class NIOBaseCell: UITableViewCell {
    public var indexPath: IndexPath?
    public func configure<T>(model: T?, indexPath: IndexPath) where T: Any {
        self.indexPath = indexPath
    }
}

//public extension UITableView {
//    func rowHeight<T>(model: T?, identifier: String, indexPath: IndexPath) -> CGFloat where T: Any {
//        let cell: UITableViewCell? = self.dequeueReusableCell(withIdentifier: identifier)
//        #if DEBUG
//        assert(cell?.isKind(of: NIOBaseCell.self) ?? true, "cell必须为BaseCell子类")
//        #endif
//        cell?.prepareForReuse()
//        (cell as? NIOBaseCell)?.configure(model: model, indexPath: indexPath)
//        return cell?.contentView.yoga.intrinsicSize.height ?? 44 + 0.5
//    }
//}
#endif
