import Foundation

@discardableResult
public func handle(_ do: () throws -> Void) -> Error? {
    do {
        try `do`()
        return nil
    } catch let error {
        return error
    }
}
