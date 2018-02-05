//
//  WishlistTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class WishlistTests: XCTestCase {
    
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
    
    func testAdd() {
        let exp = self.expectation(description: "testAddToWishList")
        self.client.user.addToWishList(userId: "5", entityId: "6329") { (item, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(item!.data!.first!.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 15)
    }
    
    func testAddToWishList() {
        
        let exp = self.expectation(description: "testAddToWishList")
        
        let predicate = Predicate(field: "id", op: .not_equal, value: "6329")
        self.client.products.filter(predicate: predicate).first { (product, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(product!.data!.first!.id)
            let id = product!.data!.first!.id!
            self.client.user.addToWishList(userId: "5", entityId: id) { (item, error) in
                self.client.user.removeFromWishList(userId: "5", entityId: id) { (isSuccess, error) in
                    XCTAssertNil(error)
                    XCTAssertNotNil(isSuccess)
                    XCTAssertTrue(isSuccess!)
                    exp.fulfill()
                }
            }
        }
        
        wait(for: [exp], timeout: 15)
    }
    
    func testGetWishList() {
        let exp = self.expectation(description: "testGetWishList")
        client.user.getWishList(userId: "5") { (items, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(items!.data!.first!.id)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testDeleteFromWishList() {
        
        let exp = self.expectation(description: "testDeleteFromWishList")
        client.user.removeFromWishList(userId: "5", entityId: "6329") { (isSuccess, error) in
            XCTAssertNil(error)
//            XCTAssertNil(isSuccess)
//            XCTAssertTrue(isSuccess!)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
