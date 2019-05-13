//
//  ViewController.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2018/12/25.
//  Copyright © 2018年 Chunyang Li 李春阳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        let hash: Dictionary<String, Any> = Dictionary<String, Any>()
//        print(hash.find(by: "String"))
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
