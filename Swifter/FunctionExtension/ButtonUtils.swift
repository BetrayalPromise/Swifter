import UIKit

public extension UIButton {
    func setTitle(_ title: String?, for states: [UIControl.State]) {
        for s in states {
            self.setTitle(title, for: s)
        }
    }
    
    func setTitleColor(_ color: UIColor?, for states: [UIControl.State]) {
        for s in states {
            self.setTitleColor(color, for: s)
        }
    }
    
    func setTitleShadowColor(_ color: UIColor?, for states: [UIControl.State]) {
        for s in states {
            self.setTitleShadowColor(color, for: s)
        }
    }
    
    func setImage(_ image: UIImage?, for states: [UIControl.State]) {
        for s in states {
            self.setImage(image, for: s)
        }
    }
    
    func setBackgroundImage(_ image: UIImage?, for states: [UIControl.State]) {
        for s in states {
            self.setBackgroundImage(image, for: s)
        }
    }
    
    func setAttributedTitle(_ title: NSAttributedString?, for states: [UIControl.State]) {
        for s in states {
            self.setAttributedTitle(title, for: s)
        }
    }
    
    func title(for states: [UIControl.State]) -> [String] {
        var titles: [String] = []
        for s in states {
            titles.append(self.title(for: s) ?? "")
        }
        return titles
    }
    
    func titleColor(for states: [UIControl.State]) -> [UIColor] {
        var colors: [UIColor] = []
        for s in states {
            colors.append(self.titleColor(for: s) ?? UIColor.white.withAlphaComponent(0.0))
        }
        return colors
    }
    
    func titleShadowColor(for states: [UIControl.State]) -> [UIColor] {
        var colors: [UIColor] = []
        for s in states {
            colors.append(self.titleShadowColor(for: s) ?? UIColor.white.withAlphaComponent(0.0))
        }
        return colors
    }
    
    func image(for states: [UIControl.State]) -> [UIImage] {
        var images: [UIImage] = []
        for s in states {
            images.append(self.image(for: s) ?? UIImage())
        }
        return images
    }
    
    func backgroundImage(for states: [UIControl.State]) -> [UIImage] {
        var images: [UIImage] = []
        for s in states {
            images.append(self.backgroundImage(for: s) ?? UIImage())
        }
        return images
    }
    
    func attributedTitle(for states: [UIControl.State]) -> [NSAttributedString] {
        var strings: [NSAttributedString] = []
        for s in states {
            strings.append(self.attributedTitle(for: s) ?? NSAttributedString())
        }
        return strings
    }
}
