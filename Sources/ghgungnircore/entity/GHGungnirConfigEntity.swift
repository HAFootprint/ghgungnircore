//
//  File.swift
//  
//
//  Created by Javier Carapia on 07/04/22.
//

internal struct GHGungnirConfigEntity: Decodable {
    var version: String?
    var storeLocalLog: Bool?
    var showGlobalPrint: Bool?

    private enum CodingKeys: String, CodingKey {
        case version
        case storeLocalLog
        case showGlobalPrint
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.version            = try container.decodeIfPresent(String?.self, forKey: .version) ?? .empty
        self.storeLocalLog      = try container.decodeIfPresent(Bool?.self, forKey: .storeLocalLog) ?? false
        self.showGlobalPrint    = try container.decodeIfPresent(Bool?.self, forKey: .showGlobalPrint) ?? false
    }
}
