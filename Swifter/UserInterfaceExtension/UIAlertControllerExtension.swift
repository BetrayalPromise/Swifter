//
//  UIAlertControllerExtension.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/14.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension UIAlertController {
    
    public func show(animated: Bool = true, vibrate: Bool = false, completion: (() -> Void)? = nil) {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: animated, completion: completion)
        if vibrate {
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
}
