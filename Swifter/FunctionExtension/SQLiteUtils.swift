import Foundation
import SQLite3

public class DataBase {
    public var db: OpaquePointer? = nil

    @discardableResult
    public func open(with path: String) -> Bool {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        guard let path = path.c.utf8() else {
            debugPrint("path error")
            return false
        }
        let result = sqlite3_open(path, &db)
        if result != SQLITE_OK {
            sqlite3_close(db)
            return false
        }
        return true
    }

    @discardableResult
    public func execute(with sql: String) -> Bool {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        let csql = sql.cString(using: String.Encoding.utf8)
        return sqlite3_exec(db, csql, nil, nil, nil) == SQLITE_OK
    }
}
