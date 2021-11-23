//
//  GHStringExtension.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

import Foundation

extension String {
    public func snakeCased() -> String {
        let pattern = "([a-z0-9])([A-Z])"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: self.count)
        return regex?.stringByReplacingMatches(
            in: self,
            options: [],
            range: range,
            withTemplate: "$1_$2"
        ).lowercased() ?? self
    }
    
    public func capitalizingFirstLetter() -> String {
        let first = String(prefix(1)).capitalized
        let other = String(dropFirst())
        return first + other
    }
    
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

extension String {
    private static var sharedInstance: String {
        struct Static {
            static var instance: String?
        }
        
        if Static.instance == nil {
            Static.instance = String()
        }
        
        return Static.instance!
    }
    
    public static var empty: String {
        self.sharedInstance
    }
}

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
