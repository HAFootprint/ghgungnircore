//
//  GHGlobalConfig.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

import Foundation

public struct GHGlobalConfig {
    private static let configJsonName  = "GHGlobalConfig-info"
    
    //MARK: Public
    public static var bundle: Bundle = .main
    
    public static var storeLog: Bool {
        if let entity = self.getObjectFromConfigFile() {
            return entity.storeLocalLog ?? false
        }
        
        return false
    }
    
    public static var showGlobalLog: Bool {
        if let entity = self.getObjectFromConfigFile() {
            return entity.showGlobalPrint ?? false
        }
        
        return false
    }
    
    internal static func getObjectFromConfigFile() -> GHGungnirConfigEntity? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            if let theJSONData = try? JSONSerialization.data(
                withJSONObject: self.objectFromConfigJsonKey(),
                options: []
            ) {
                let decoded = try decoder.decode(GHGungnirConfigEntity.self, from: theJSONData)
                return decoded
            }
        }
        catch { }

        return nil
    }
    
    private static func objectFromConfigJsonKey() -> NSDictionary {
        var jsonOptional: NSDictionary?

        if let path = self.bundle.path(forResource: self.configJsonName, ofType: "json") {
            do {
                if let data = NSData(contentsOfFile: path) {
                    jsonOptional = try JSONSerialization.jsonObject(
                        with: data as Data,
                        options: JSONSerialization.ReadingOptions.mutableContainers
                    ) as? NSDictionary
                }
            }
            catch { }
        }

        return jsonOptional ?? NSDictionary()
    }
}
