//
//  GHGlobalConfig.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

import Foundation

public struct GHGlobalConfig {
    private static let configInfoPlistName  = "GHGlobalConfig-info"
    private static let rootIdentifier       = "global_config"
    
    //MARK: Public
    public static var storeLog: Bool {
        self.getValueFromKey(keySearch: "store_log")
    }
    
    public static var showGlobalLog: Bool {
        self.getValueFromKey(keySearch: "show_global_log")
    }
    
    //MARK: Private
    private static var bundleDependency: Bundle {
        if let bundle = Bundle(identifier: "org.cocoapods.ghgungnircore") {
            return bundle
        }
        else if let bundle = Bundle(identifier: "ghgungnircore") {
            return bundle
        }
        
        return .main
    }
    
    private static func getValueFromKey(keySearch: String) -> Bool {
        var sourceIdentifier = false
        
        if let dic = self.objectFromConfigDictionaryKey(pr: self.rootIdentifier) as? NSDictionary {
            let dicFilter = dic.filter { guard let keyDic = $0.key as? String else { return false }
                return keyDic == keySearch
            }
            
            sourceIdentifier = dicFilter.first?.value as? Bool ?? false
        }
        
        return sourceIdentifier
    }
    
    private static func objectFromConfigDictionaryKey(pr: String) -> Any? {
        var anyObj: Any?
        
        if let path = self.bundleDependency.path(forResource: self.configInfoPlistName, ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                anyObj = dict.object(forKey: pr)
            }
        }
        
        return anyObj
    }
}
