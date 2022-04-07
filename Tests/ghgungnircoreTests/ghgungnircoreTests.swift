//
//  ghgungnircoreTests.swift
//  ghgungnircoreTests
//
//  Created by Javier Carapia on 22/11/21.
//

import XCTest
@testable import ghgungnircore

class ghgungnircoreTests: XCTestCase {
    func testExample() throws {
        GHGlobalConfig.bundle = .module
        let valid = GHGlobalConfig.storeLog
        
        XCTAssertTrue(valid)
    }
}
