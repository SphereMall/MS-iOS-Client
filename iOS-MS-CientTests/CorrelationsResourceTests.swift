//
//  CorrelationsResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 2/13/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class CorrelationsResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testAttributeGroupsResource() {
        let exp = self.expectation(description: "testGet")
        client.correlations.getById(id: 5, forClassName: "products") { (items, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
