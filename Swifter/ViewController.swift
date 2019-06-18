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
        print(Directory.home.path)
        print(FileManager.files(path: Directory.home.path))
        
        var size: Int? = 3
        size = nil
        print(size.else(value: 20))

        let car: Car = Car(name: "A", engine: "B", type: "C")
        car.save(to: Directory.document.path + "/a.b")
        let instance: Car? = Car.fetch(from: Directory.document.path + "/a.b")
        print(instance ?? Car(name: "A", engine: "B", type: "C"))
//        print(car.toData())
//        print(car.toString())
//        print(car.toObject())
//        print(car.toModel(type: Car.self))

//        let string: String = "{\"name\":\"A\",\"engine\":\"B\",\"type\":\"C\"}"
//        print(string.toData())
//        print(string.toString())
//        print(string.toModel(type: Car.self))
//        print(string.toObject())

//        let dict = ["name": "A", "engine": "B", "type": "C"]
//        print(dict.toData())
//        print(dict.toString())
//        print(dict.toObject())
//        print(dict.toModel(type: Car.self))

        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(self.view.safeAreaInsets)
    }
}

extension ViewController: A {
    func execute() {
        print("A")
    }
}

struct Car: Codable {
    var name: String
    var engine: String
    var type: String
}

extension Car: Cachable {}
