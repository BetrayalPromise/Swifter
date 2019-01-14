//
//  ImageUtils.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/10.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation
import CoreMedia
import UIKit

@available(iOS 6.0, *)
public protocol ImageConvertible {
    
    func asUI() -> UIImage?
    func asCG() -> CGImage?
    func asCI() -> CIImage?
}

@available(iOS 6.0, *)
extension UIImage: ImageConvertible {
    
    public func asUI() -> UIImage? {
        return self
    }
    
    public func asCG() -> CGImage? {
        return self.cgImage
    }
    
    public func asCI() -> CIImage? {
        return CIImage(image: self)
    }
    
}

@available(iOS 6.0, *)
extension CGImage: ImageConvertible {
    
    public func asUI() -> UIImage? {
        return UIImage(cgImage: self)
    }
    
    public func asCG() -> CGImage? {
        return self
    }
    
    public func asCI() -> CIImage? {
        return CIImage(cgImage: self)
    }
    
}

@available(iOS 6.0, *)
extension CIImage: ImageConvertible {
    
    public func asUI() -> UIImage? {
        return UIImage(ciImage: self)
    }
    
    public func asCG() -> CGImage? {
        return self.asUI()?.asCG()
    }
    
    public func asCI() -> CIImage? {
        return self
    }
    
}
