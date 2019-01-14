//
//  Logger.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2019/1/11.
//  Copyright © 2019 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

public enum LoggerType: Int {
    case informaiton
    case warnning
    case error
}

public class Logger {
    public static let `default`: Logger = {
        return Logger()
    }()
    
    public let rootPath: String = NSHomeDirectory() + "/Documents/Log/"
    
    private init() {
        
    }
}
