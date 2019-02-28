//
//  FDBaseNavigationController.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/18.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import UIKit
import ObjectiveC

class FDBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.adaptive()
    }
    
    func adaptive() {
        self.delegate = self
    }
    
}

extension FDBaseNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
    }

}
