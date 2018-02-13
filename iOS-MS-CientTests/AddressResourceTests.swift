//
//  AddressResourceTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class AddressResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddressAll() {
        
        let exp = self.expectation(description: "testAddressAll")

        client.address.all { (item, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(item?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testAddressByPredicate() {
        
        let exp = self.expectation(description: "testAddressAll")
        let predicate = Predicate(field: "userId", op: .equal, value: "5")
        client.address.filter(predicate: predicate).first { (address, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
