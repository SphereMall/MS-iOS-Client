//
//  AttributeValuesResourceTest.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class AttributeValuesResourceTest: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testAttributeValuesResource() {
        let exp = self.expectation(description: "testGet")
        client.attributeValues.all{ (items, error) in
            XCTAssertNotNil(items)
            XCTAssertNil(error)
            XCTAssertNotNil(items?.data?.first?.id)
            XCTAssertNotNil(items?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
