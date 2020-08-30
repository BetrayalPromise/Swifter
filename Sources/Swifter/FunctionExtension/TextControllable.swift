#if os(iOS)
import UIKit
import ObjectiveC

/// 实现 UITextField 及其它们的子类
public protocol TextFieldControllable where Self: UITextField {
    func max(value: Int)
}

public extension TextFieldControllable where Self: UITextField {
    func max(value: Int) {
        if type(of: self) == UITextField.self {
            let context = Agent(max: value)
            NotificationCenter.default.addObserver(context, selector: #selector(context.handle(notication:)), name: UITextField.textDidChangeNotification, object: self)
            objc_setAssociatedObject(self, NSStringFromClass(Agent.self), context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            debugPrint("只支持UITextField及其子类")
        }
    }
}

private class Agent: NSObject {
    var max: Int
    
    init(max: Int) {
        self.max = max
    }
    
    @objc
    fileprivate func handle(notication: Notification) {
        guard let object = notication.object else { return }
        if type(of: object) == UITextField.self {
            guard let inputTextField: UITextField = object as? UITextField else { return }
            let range: UITextRange = inputTextField.markedTextRange ?? UITextRange()
            let postion = inputTextField.position(from: range.start, offset: 0)
            if postion == nil {
                /// 无联想时处理
                guard let text = inputTextField.text else { return }
                if inputTextField.text?.count ?? 0 > max {
                    let start = text.index(text.startIndex, offsetBy: 0)
                    let stop = text.index(text.startIndex, offsetBy: max)
                    inputTextField.text = String(text[start..<stop])
                }
            }
        } else if type(of: object) == UITextView.self {
            guard let inputTextView: UITextView = object as? UITextView else { return }
            var label: UILabel? = nil
            for v in inputTextView.subviews {
                if v.isKind(of: UILabel.self) {
                    label = v as? UILabel
                    break
                }
            }
            if inputTextView.text.count > 0 {
                label?.isHidden = true
            } else {
                label?.isHidden = false
            }
            let range: UITextRange = inputTextView.markedTextRange ?? UITextRange()
            let postion = inputTextView.position(from: range.start, offset: 0)
            if postion == nil {
                /// 无联想时处理
                guard let text = inputTextView.text else { return }
                if inputTextView.text?.count ?? 0 > max {
                    let start = text.index(text.startIndex, offsetBy: 0)
                    let stop = text.index(text.startIndex, offsetBy: max)
                    inputTextView.text = String(text[start..<stop])
                }
            }
        }
    }
    
    deinit {
        if #available(iOS 9.0, *) {
            debugPrint("iOS 9.0 later System automatic remove observer")
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
}

public typealias AttributedString = NSAttributedString
public typealias MutableAttributedString = NSMutableAttributedString

public protocol TextViewControllable where Self: UITextView {
    func placeholder(value: String)
    func attributedPlaceholder(value: AttributedString)
    func max(value: Int)
}

public extension TextViewControllable where Self: UITextView {
    /// UITextView的placeholder 如要生效必须先设置字体大小
    func placeholder(value: String) {
        let label = self.createPlaceHolderLabel()
        label.attributedText = nil
        label.text = value
    }
    
    private func createPlaceHolderLabel() -> UILabel {
        guard let label: UILabel = objc_getAssociatedObject(self, #function) as? UILabel else {
            let label: UILabel = UILabel(frame: .zero)
            self.addSubview(label)
            objc_setAssociatedObject(self, #function, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textColor = UIColor(red: 171.0 / 255.0, green: 171.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
            label.font = self.font == nil ? UIFont.systemFont(ofSize: 12) : self.font
            let insert: UIEdgeInsets = self.textContainerInset
            let padding: CGFloat = self.textContainer.lineFragmentPadding
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: insert.top).isActive = true
            NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: insert.left + padding).isActive = true
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -insert.bottom).isActive = true
            NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -(insert.right + padding)).isActive = true
            return label
        }
        return label
    }
    
    /// UITextView的attributedPlaceholder 如要生效必须先设置字体大小
    func attributedPlaceholder(value: AttributedString) {
        let label: UILabel = self.createPlaceHolderLabel()
        label.text = nil
        label.attributedText = value
    }
    
    func max(value: Int) {
        if type(of: self) == UITextView.self {
            let context: Agent = Agent(max: value)
            NotificationCenter.default.addObserver(context, selector: #selector(context.handle(notication:)), name: UITextView.textDidChangeNotification, object: self)
            objc_setAssociatedObject(self, NSStringFromClass(Agent.self), context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            debugPrint("只支持UITextView及其子类")
        }
    }
}
#endif
