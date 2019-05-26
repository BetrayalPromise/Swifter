import UIKit

protocol A {
    func execute()
}

class ViewController: UIViewController {
    
    let delegate = MulticastDelegate<A>(relation: .weak)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let hash: Dictionary<String, Any> = Dictionary<String, Any>()
        print(hash.find(by: "String") ?? "")
        print(UnsafePointer<Int8>(bitPattern: 8) ?? "")
        print("C".c.utf8() ?? "")
        print("base".base64.encoded() ?? "")
        let value: String? = nil
        print(value?.base64.encoded() ?? "")
        delegate.sync(queue: DispatchQueue(label: "com.nio.queue")) { (p) in
            p.execute()
        }

        let db = DataBase()
        db.open(with: NSTemporaryDirectory() + "user.sqlite")

        let array = ["3"]
        array.find(at: 3)
        array[safe: 3]
    }
}


extension UINavigationBar {
    /// 控制导航栏1px线是否显示
    public func controlLine(with isHidden: Bool) {
        for v in self.subviews {
            for vv in v.subviews {
                if vv.isKind(of: UIImageView.self) && vv.frame.size.height == 0.5 {
                    vv.isHidden = isHidden
                    break
                }
            }
        }
    }
}
