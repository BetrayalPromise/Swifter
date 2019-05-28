import Foundation

public func logger<T>(message: T, file: String = #file, funcName: String = #function, lineName: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\"\(fileName)\" (\(lineName)) \(funcName): \(message)")
    #endif
}
