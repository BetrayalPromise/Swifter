import Foundation
import UIKit

public extension Dictionary {
    /// json字符串转Model
    func toModel<T>(type: T.Type) -> T? where T: Decodable {
        return self.toData()?.toModel(type: type)
    }

    func toData() -> Data? {
        var data: Data? = nil
        do {
            data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            return data
        }
        return data
    }

    func toString() -> String? {
        return self.toData()?.toString()
    }
}

public extension String {
    func toData() -> Data? {
        return self.data(using: String.Encoding.utf8)
    }

    /// json字符串转Model
    func toModel<T>(type: T.Type) -> T? where T: Decodable {
        guard let data: Data = self.data(using: String.Encoding.utf8) else { return nil }
        var model: T?
        do {
            model = try JSONDecoder().decode(type, from: data)
        } catch {
            return model
        }
        return model
    }

    /// json字符串转json数据
    func toJSONObject() -> Any? {
        guard let data: Data = self.data(using: String.Encoding.utf8) else { return nil }
        if JSONSerialization.isValidJSONObject(data) { return nil }
        var jsonObject: Any?
        do {
            jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            return jsonObject
        }
        return jsonObject
    }
}


public extension Data {
    /// json二进制数据串转Model
    func toModel<T>(type: T.Type) -> T? where T: Decodable {
        var model: T?
        do {
            /// 会自动h过滤Value为nil的项
            model = try JSONDecoder().decode(type, from: self)
        } catch {
            return model
        }
        return model
    }

    /// json二进制数据转json数据
    func toJSONObject() -> Any? {
        if JSONSerialization.isValidJSONObject(self) { return nil }
        var jsonObject: Any?
        do {
            jsonObject = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            return jsonObject
        }
        return jsonObject
    }

    func toString() -> String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
}
