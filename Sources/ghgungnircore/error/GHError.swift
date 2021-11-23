//
//  GHError.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

import Foundation

public struct GHError {
    public static func make(message: Any, code: Int = 12_10_86) -> NSError {
        let errorDetail: [String: Any] = [
            NSLocalizedDescriptionKey: message
        ]
        
        return NSError(
            domain: "ghgungnircore",
            code: code,
            userInfo: errorDetail
        )
    }
}
