//
//  iOS_MS_ClientTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 11/21/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import XCTest

class iOS_MS_ClientTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: BASE_URL,
                              clientId: "api_demo_user",
                              secretKey: "demo_pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetGatewayUrl() {
        XCTAssertEqual(client.getGatewayUrl(), BASE_URL)
    }
    
    func testGetClientId() {
        XCTAssertEqual(client.getClientId(), "api_demo_user")
    }
    
    func testGetSecretKey() {
        XCTAssertEqual(client.getSecretKey(), "demo_pass")
    }
    
    func testGetVersion() {
        XCTAssertEqual(client.getVersion(), "v1")
    }
    
    func testSetVersion(version: String) {
        XCTAssertEqual(client.getVersion(), "v1")
        client.setVersion(version: "v2")
        XCTAssertEqual(client.getVersion(), "v2")
    }

    func testResourceUser() {
        XCTAssertNotNil(client.user)
    }
    
    func testResourceProducts() {
        XCTAssertNotNil(client.products)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
