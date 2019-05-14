import Foundation

public extension Optional {
    func unwrap(default value: Wrapped) -> Wrapped {
        return self ?? value
    }
}
