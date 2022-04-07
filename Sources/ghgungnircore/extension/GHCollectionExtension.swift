//
//  GHStringExtension.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

import Foundation

extension Collection {
    public var isNotEmpty: Bool {
        !self.isEmpty
    }
}

extension NSData {
    public var stringValue: String {
        NSString(data: self as Data, encoding: String.Encoding.utf8.rawValue) as String? ?? .empty
    }
}

extension NSArray {
    public var uniq: NSArray {
        NSSet(array: self as [AnyObject]).allObjects as NSArray
    }
}

extension Dictionary {
    public init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    if GHGlobalConfig.showGlobalLog {
        Swift.print(items, separator: separator, terminator: terminator)
    }
}

public func debugPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    if GHGlobalConfig.showGlobalLog {
        Swift.debugPrint(items, separator: separator, terminator: terminator)
    }
}
