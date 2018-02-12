//
//  BasketTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class BasketTests: XCTestCase {
    
    var client: SMClient!
    var basket: Basket!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
        
//        basket = Basket(client: client, userId: "568")
    }
    
    func testAddToBasket() {
        
//        let exp = self.expectation(description: "testAddToBasket")
//        let predicate = BasketPredicate(id: "6329", amount: 10)
//
//        basket.add(predicate: predicate) { (basket, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
    }
    
    func testBasketGet() {
//        let exp = self.expectation(description: "testBasketGet")
//        basket.get(id: "2140") { (basket, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
    }
    
    func testRemoveAtBasket() {
//
//        let exp = self.expectation(description: "testRemoveAtBasket")
//
//        let predicate = BasketPredicate(id: "6329")
//
//        basket.remove(predicate: predicate) { (basket, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
    }
    
    func testUpdateAtBasket() {
        
//        let exp = self.expectation(description: "testUpdateAtBasket")
//
//        let predicate = BasketPredicate(id: "6329", amount: 6)
//
//        basket.update(predicate: predicate) { (basket, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
    }
}
