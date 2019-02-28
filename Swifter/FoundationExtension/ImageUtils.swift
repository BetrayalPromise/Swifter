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


/// 修正方向
extension UIImage {
    
    public func fixDirection() -> UIImage? {
        if self.imageOrientation == .up {
            return self
        }
        var transform = CGAffineTransform.identity
        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: .pi)
            break
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
            break
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -.pi / 2)
            break
        default:
            break
        }

        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
            break
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0);
            transform = transform.scaledBy(x: -1, y: 1)
            break
        default:
            break
        }
        
        let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: 0, space: self.cgImage!.colorSpace!, bitmapInfo: self.cgImage!.bitmapInfo.rawValue)
        ctx?.concatenate(transform)
        
        switch self.imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.height), height: CGFloat(size.width)))
            break
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height)))
            break
        }
        guard let cgimg: CGImage = ctx?.makeImage() else {
            return self
        }
        return UIImage(cgImage: cgimg)
    }
    
    public var normal: UIImage {
        get {
            if imageOrientation == .up {
                return self
            }
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
            var source: UIImage?
            /// 防止UIGraphicsGetImageFromCurrentImageContext()内存过大
            autoreleasepool {
                source = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
            guard let image: UIImage = source else {
                return self
            }
            return image
        }
    }
    
}
