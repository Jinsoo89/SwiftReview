//
//  Logger.swift
//  Util
//
//  Created by Jinsoo Choi on 24/12/2018.
//  Copyright © 2018 Jinsoo Choi. All rights reserved.
//

import Foundation

public enum LogLevel: String {
    case none = ""
    case success = "✅"
    case info = "ℹ️"
    case warning = "⚠️"
    case error = "❌"
}
public class OpenLogger {
    public static func openLogMessage(log: String, level: LogLevel,
                                      file: String = #file, line: Int = #line) {
        print(level.rawValue, file, line, log)
    }
}

