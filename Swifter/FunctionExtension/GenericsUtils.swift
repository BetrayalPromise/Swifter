import Foundation

public extension UnsafePointer where Pointee == Int8 {
    /// UnsafePointer<Int8>转String
    ///
    /// - Returns: 字符串
    func asString() -> String {
        return String(cString: self)
    }
}

protocol Cachable {

    func save(to path: String) -> Result<Void, Error>

    static func fetch(from path: String) -> Self?
}


extension Cachable where Self: Codable {
    @discardableResult
    func save(to path: String) -> Result<Void, Error> {
        let url: URL = URL(fileURLWithPath: path)
        do {
            let data: Data = try JSONEncoder().encode(self)
            try data.write(to: url)
            return .success(())
        } catch {
            return .failure(error)
        }
    }

    @discardableResult
    static func fetch(from path: String) -> Self? {
        let url: URL = URL(fileURLWithPath: path)
        do {
            let data: Data = try Data(contentsOf: url)
            return try JSONDecoder().decode(self, from: data)
        } catch {
            return nil
        }
    }
}

//extension Decodable {
//    func fetch(from path: String) -> Self? {
//        let url: URL = URL(fileURLWithPath: path)
//        do {
//            let data: Data = try Data(contentsOf: url)
//            return try JSONDecoder().decode(self, from: data)
//        } catch {
//            return nil
//        }
//    }
//}
//
//extension Encodable {
//    func save(to path: String) -> Result<Void, Error> {
//        let url: URL = URL(fileURLWithPath: path)
//        do {
//            let data: Data = try JSONEncoder().encode(self)
//            try data.write(to: url)
//            return .success(())
//        } catch {
//            return .failure(error)
//        }
//    }
//}
