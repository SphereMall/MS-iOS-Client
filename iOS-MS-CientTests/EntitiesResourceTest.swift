//
//  EntitiesResourceTest.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class EntitiesResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testEntitiesResource() {
        let exp = self.expectation(description: "testGet")
        client.etities.all{ (items, error) in
            XCTAssertNotNil(items)
            XCTAssertNil(error)
            XCTAssertNotNil(items?.data?.first?.attributes?.id)
            XCTAssertNotNil(items?.data?.first?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    override func tearDown() {
        super.tearDown()
    }
 
    func testPerformanceExample() {
        self.measure {
        }
    }
}
