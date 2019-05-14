import Foundation
import UIKit

// MARK: 模型转Data
public func toData<T>(by model: T) -> Data? where T: Encodable {
    var data: Data?
    do {
        data = try JSONEncoder().encode(model)
    } catch {
        return nil
    }
    return data
}

// MARK: 模型转JSON字符串
public func toString<T>(by model: T) -> String? where T: Encodable {
    return toData(by: model)?.toString()
}

// MARK: 模型转JSON对象
public func toObject<T>(by model: T) -> Any? where T: Encodable {
    return toData(by: model)?.toObject()
}

public extension Dictionary {
    // MARK: JSON对象转Model
    func toModel<T>(type: T.Type) -> T? where T: Decodable {
        return self.toData()?.toModel(type: type)
    }
    
    // MARK: JSON对象转Data
    func toData() -> Data? {
        if !JSONSerialization.isValidJSONObject(self) { return nil }
        var data: Data? = nil
        do {
            data = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            return data
        }
        return data
    }
    
    // MARK: JSON对象转JSON字符串
    func toString() -> String? {
        return self.toData()?.toString()
    }
}

public extension String {
    // MARK: JSON字符串转Data
    func toData() -> Data? {
        return self.data(using: String.Encoding.utf8)
    }
    
    // MARK: JSON字符串转Model
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
    
    // MARK: JSON字符串转JSON对象
    func toObject() -> Any? {
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
    // MARK: JSON二进制转Model
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
    
    // MARK: JSON二进制转JSON对象
    func toObject() -> Any? {
        var jsonObject: Any?
        do {
            jsonObject = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers)
        } catch {
            return jsonObject
        }
        return jsonObject
    }
    
    // MARK: JSON二进制转JSON字符串
    func toString() -> String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
}

