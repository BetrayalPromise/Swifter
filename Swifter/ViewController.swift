//
//  ViewController.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2018/12/25.
//  Copyright © 2018年 Chunyang Li 李春阳. All rights reserved.
//

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
        print(hash.find(by: "String"))
        
        print("C".c.utf8() ?? "")
        print("C".c.utf8()?.toString())
        
        print("base".base64.encoded() ?? "")
        let value: String? = nil
        print(value?.base64.encoded() ?? "")
        delegate.sync(queue: DispatchQueue(label: "com.nio.queue")) { (p) in
            p.execute()
        }
        DispatchQueue.once(token: "A") {
            print("A")
        }
        DispatchQueue.once(token: "A") {
            print("A")
        }
        DispatchQueue.once(token: "A") {
            print("A")
        }
    }
}

extension ViewController: A {
    func execute() {
        print("A")
    }
}
