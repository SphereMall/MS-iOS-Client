//
//  UserResourceTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class UserResourceTests: XCTestCase {
    
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
    
    func testGet() {
        let exp = self.expectation(description: "testSubscribe")
        client.user.all { (users, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(users!.data!.first!.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testSubscribe() {
        let exp = self.expectation(description: "testSubscribe")
        client.user.subscribe(email: "v.chernetsky@spheremall.com") { (item, error) in
            XCTAssertEqual(item?.data?.first?.attributes?.isSubscriber, "1")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testUnSubscribe() {
        let exp = self.expectation(description: "testUnSubscribe")
        client.user.unsubscribe(guid: UUID().uuidString) { (user, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(user!.data!.first!.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
