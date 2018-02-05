//
//  OrdersResourceTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/19/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class OrdersResourceTests: XCTestCase {
    
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
    
    func testOrdersAll() {
        let exp = self.expectation(description: "testOrdersAll")
        client.orders.all { (item, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(item?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testGetHistory() {
        let exp = self.expectation(description: "testGetHistory")
        client.orders.getHistory(userId: 248) { (orders, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(orders?.data?.first)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testGetby() {
        let exp = self.expectation(description: "testGetby")
        client.orders.by(id: "816") { (order, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(order?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testByOrderId() {
        let exp = self.expectation(description: "testGetby")
        client.orders.byOrderId(orderId: "main00816") { (order, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(order?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
}
