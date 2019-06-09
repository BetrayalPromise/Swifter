import Foundation
import Darwin.sys

extension FileManager {
    /// 判断文件是否存在
    ///
    /// - Parameter path: 文件路径
    /// - Returns: 结果
    @discardableResult
    public class func isExist(path: String) -> Bool {
        guard let filePath: UnsafePointer<Int8> = path.c.utf8() else {
            return false
        }
        if access(filePath, F_OK) == 0 {
            return true
        }
        return false;
    }
    
    @discardableResult
    public class func create(path: String) -> Bool {
        guard let filePath: UnsafePointer<Int8> = path.c.utf8() else {
            debugPrint("路径转化失败")
            return false
        }
        if isExist(path: path) {
            debugPrint("文件已存在")
            return false
        } else {
            guard let model: UnsafePointer<Int8> = "w+".c.utf8() else {
                debugPrint("权限处理失败")
                return false;
            }
            let file: UnsafeMutablePointer<FILE>? = fopen(filePath, model)
            if file?.pointee != nil {
                fclose(file)
                return true
            } else {
                return false
            }
        }
    }
    
    @discardableResult
    public class func delete(path: String) -> Bool {
        guard let filePath: UnsafePointer<Int8> = path.c.utf8() else {
            debugPrint("路径转化失败")
            return false
        }
        if !isExist(path: path) {
            debugPrint("文件不存在")
            return false
        }
        if remove(filePath) == 0 {
            return true
        }
        return false
    }
    
    @discardableResult
    public class func rename(old: String, new: String) -> Bool {
        if old == new {
            debugPrint("名称相同")
            return false
        }
        guard let oldPath: UnsafePointer<Int8> = old.c.utf8(), let newPath: UnsafePointer<Int8> = new.c.utf8() else {
            debugPrint("路径转化失败")
            return false
        }
        if !isExist(path: old) {
            debugPrint("文件不存在")
            return false
        }
        if Darwin.rename(oldPath, newPath) == 0 {
            return true
        }
        debugPrint("重命名失败")
        return false
    }
    
    @discardableResult
    class func write(with info: String, to file: String) -> Bool {
        guard let file: UnsafePointer<Int8> = file.c.utf8(), let info: UnsafePointer<Int8> = info.c.utf8() else {
            debugPrint("路径转化失败")
            return false
        }
        guard let model: UnsafePointer<Int8> = "w+".c.utf8() else {
            debugPrint("权限处理失败")
            return false
        }
        let context: UnsafeMutablePointer<FILE>? = fopen(file, model)
        if fputs(info, context) == 0 {
            return true
        }
        return false
    }
    
    @discardableResult
    public class func copy(input: String, output: String) -> Bool {
        if input == output {
            debugPrint("输入输出路径相同")
            return false
        }
        guard let input: UnsafePointer<Int8> = input.c.utf8(), let output: UnsafePointer<Int8> = output.c.utf8() else {
            debugPrint("路径转化失败")
            return false
        }
        guard let inputModel: UnsafePointer<Int8> = "r".c.utf8(), let outputModel: UnsafePointer<Int8> = "w+".c.utf8() else {
            debugPrint("权限处理失败")
            return false
        }
        guard let inputFile: UnsafeMutablePointer<FILE> = fopen(input, inputModel), let outputFile: UnsafeMutablePointer<FILE> = fopen(output, outputModel) else {
            debugPrint("权限处理失败")
            return false
        }
        var value: Int32 = SEEK_SET
        while (value != EOF) {
            value = fgetc(inputFile)
            fputc(value, outputFile)
        }
        fclose(inputFile)
        fclose(outputFile)
        return true
    }
    
    public class func type(path: String) -> String? {
        guard var info: stat = self.inforation(of: path) else { return nil }
        let result = stat(path, &info)
        if result == 0 {
            switch info.st_mode & S_IFMT {
            case S_IFSOCK: return "s"   // 套接字文件
            case S_IFLNK: return "l"      // 软连接文件
            case S_IFREG: return "-"    // 普通文件
            case S_IFBLK: return "b"    // 块设备文件
            case S_IFDIR: return "d"     // 目录文件
            case S_IFCHR: return "c"    // 字符设备文件
            case S_IFIFO: return "p"     // 管道文件
            default: return nil
            }
        } else {
            return nil
        }
    }
    
    public class func size(path: String) -> Int64? {
        guard var info: stat = self.inforation(of: path) else { return nil }
        let result = stat(path, &info)
        if result == 0 {
            return info.st_size
        } else {
            return nil
        }
    }
    
    public class func files(path: String) -> Set<String>? {
        guard let path: UnsafePointer<Int8> = (path as NSString).utf8String else {
            debugPrint("路径转化失败")
            return nil
        }
        let dir: UnsafeMutablePointer<DIR>? = opendir(path)
        if dir?.pointee == nil {
            debugPrint("路径转化失败")
            return nil
        }
        var dirp: UnsafeMutablePointer<dirent>?
        repeat {
            dirp = readdir(dir)
            // TODO: 处理获取文件信息
            print(dir?.pointee.__dd_size ?? 0)
        } while dirp != nil
        closedir(dir)
        return Set<String>()
    }
    
    @discardableResult
    public class func inforation(of path: String) -> stat? {
        guard let path: UnsafePointer<Int8> = (path as NSString).utf8String else {
            debugPrint("路径转化失败")
            return nil
        }
        var info: stat = stat()
        stat(path, &info)
        return info
    }
}
