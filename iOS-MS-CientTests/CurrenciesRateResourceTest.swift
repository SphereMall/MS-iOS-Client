//
//  CurrenciesRateResourceTest.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class CurrenciesRateResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testEntityAttributes() {
        let exp = self.expectation(description: "testGet")
        client.currenciesRate.all{ (items, error) in
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
