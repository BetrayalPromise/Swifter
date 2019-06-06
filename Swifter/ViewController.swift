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
        print(hash.find(by: "String") ?? "")

        print("C".c.utf8() ?? "")
        print("C".c.utf8()?.asString() ?? "")
        
        print("C".c.utf8() ?? "")
        print("C".c.utf8()?.asString() ?? "")
    
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
        print(array[safe: 3] ?? "")
        DispatchQueue.once(token: "A") {
            print("A")
        }
        DispatchQueue.once(token: "A") {
            print("A")
        }
        DispatchQueue.once(token: "A") {
            print("A")
        }
        logger(message: "AAA")
        print(homeDirectory())
        print(FileManager.files(path: homeDirectory()) ?? "")
        
        
    }
}

extension ViewController: A {
    func execute() {
        print("A")
    }
}
