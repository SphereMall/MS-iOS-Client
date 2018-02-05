//
//  DeliveryProvidersResourceTest.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class DeliveryProvidersResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testEntityAttributes() {
        let exp = self.expectation(description: "testGet")
        client.deliveryProviders.all{ (items, error) in
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
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
