//
//  OrderStatusesResourceTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/18/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class OrderStatusesResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testOrdesStatusesAll() {
        
//        let exp = self.expectation(description: "testOrdesStatusesAll")
        
//        client.ordesStatuses.all { (item, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(item?.data?.first?.attributes?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }    
}
