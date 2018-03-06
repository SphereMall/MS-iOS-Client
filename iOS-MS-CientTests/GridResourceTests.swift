//
//  GridResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 2/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class GridResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: GRID_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testAll() {
        let exp = self.expectation(description: "testAll")
        client.grid.all { (items, error) in
            
            guard let document = items?.data?.first as? DocumentModel else {
                 exp.fulfill()
                return
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
}
