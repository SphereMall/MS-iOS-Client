//
//  BasketResource.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class BasketResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: BASKET_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testBasketGetAll() {
        let exp = self.expectation(description: "testbasketgetAll")
        
        client.basket.get(id: "157") { (basket, error) in
            XCTAssertNil(error)
//            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
            exp.fulfill()
        }
    
        wait(for: [exp], timeout: 10)
    }
    
}
