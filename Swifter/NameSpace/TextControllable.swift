import UIKit


/// 实现该五种协议的基本上就是 UITextField UITextView 及其它们的子类
public protocol TextControllable where Self: UITextInput & UIContentSizeCategoryAdjusting & UITextDraggable & UITextDroppable & UITextPasteConfigurationSupporting {
    func max(value: Int)
}

public extension TextControllable {
    func max(value: Int) {
        if type(of: self) == UITextField.self {
            let context = Content(max: value)
            NotificationCenter.default.addObserver(context, selector: #selector(context.handle(notication:)), name: UITextField.textDidChangeNotification, object: self)
            objc_setAssociatedObject(self, NSStringFromClass(Content.self), context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else if type(of: self) == UITextView.self {
            let context = Content(max: value)
            NotificationCenter.default.addObserver(context, selector: #selector(context.handle(notication:)), name: UITextView.textDidChangeNotification, object: self)
            objc_setAssociatedObject(self, NSStringFromClass(Content.self), context, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            print("Method only support UITextField UITextView and subclass of them")
        }
    }
}

fileprivate class Content: NSObject {
    var max: Int
    
    init(max: Int) {
        self.max = max
    }
    
    @objc
    func handle(notication: Notification) {
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
        NotificationCenter.default.removeObserver(self)
    }
}
