//
//  AuthResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 2/13/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class AuthResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: AUTH_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
        let exp = self.expectation(description: "testGet")
        client.auth.login(email: "test@i.ua", password: "123") { (item, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(item)
            XCTAssertNotNil(item?.data?.first?.model?.id)
            self.client.address.get(id: (item?.data?.first?.model?.defaultAddressId!)!, closure: { (address, error) in
                 exp.fulfill()
            })
           
        }
        
        wait(for: [exp], timeout: 10)
    }
}
