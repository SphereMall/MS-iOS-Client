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
        
        client = SMClient(gatewayUrl: BASKET_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
        
        basket = Basket(client: client, userId: USER_ID.description)
    }
    
    func testAddToBasket() {
        
        let exp = self.expectation(description: "testAddToBasket")
        
        let attr1 = BasketPredicateAttribute(attributeId: "226", attributeValueId: "3776", userValue: "73")
        let attr2 = BasketPredicateAttribute(attributeId: "227", attributeValueId: "3749", userValue: "35")
        let attr3 = BasketPredicateAttribute(attributeId: "222", attributeValueId: "4337")
        
        let predicate = BasketPredicate(id: "406", amount: 1, attributes: [attr1, attr2, attr3])

        basket.add(predicate: predicate) { (basket, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }
    
    func testBasketGet() {
        let exp = self.expectation(description: "testBasketGet")
        basket.get(id: USER_ID.description) { (basket, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }
    
    func testUpdateAtBasket() {
        
        let exp = self.expectation(description: "testUpdateAtBasket")
        
        let predicate = BasketUpdatePredicate(itemId: "1983", id: "406", amount: 5)

        basket.update(predicate: predicate) { (basket, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }
    
    func testRemoveAtBasket() {
        
        let exp = self.expectation(description: "testRemoveAtBasket")
        
        let predicate = BaskeDeletePredicate(itemId: "1983", id: "406")
        
        basket.remove(predicate: predicate) { (basket, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(basket?.data?.first?.attributes?.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
