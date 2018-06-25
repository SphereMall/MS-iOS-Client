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
        client = SMClient(gatewayUrl: GRID_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//
    
    func testAdd() {
        let exp = self.expectation(description: "testAddToWishList")
        let id = "624"
        self.client.wishlist.add(userId: "153", objectId: id, entity: "products") { (item, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(item)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 15)
    }
    
    /*
     
     */
    
//    func testAddToWishList() {
        
//        let exp = self.expectation(description: "testAddToWishList")
//
//        let predicate = Predicate(field: "id", op: .equal, value: "405")
//        self.client.products.filter(predicate: predicate).first { (product, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(product?.data?.first?.id)
//            guard let id = product?.data?.first?.id else { return }
//            self.client.wishlist.add(userId: USER_ID.description, objectId: id, entity: "products") { (item, error) in
//                XCTAssertNil(error)
//                self.client.wishlist.remove(userId: USER_ID.description, objectId: "405", entity: "products") { (isSuccess, error) in
//                    XCTAssertNil(error)
//                    XCTAssertNotNil(isSuccess)
//                    XCTAssertTrue(isSuccess ?? false)
//                    exp.fulfill()
//                }
//            }
//        }
//
//        wait(for: [exp], timeout: 15)
//    }
    
    func testGetWishList() {
        let exp = self.expectation(description: "testGetWishList")
        client.wishlist.get(userId: USER_ID.description, limit: 100, offset: 0) { (items, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(items)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
//
//    func testDelete() {
//        let exp = self.expectation(description: "testDeleteFromWishList")
//        client.wishlist.remove(wishlistId: "573") { (issuccess, error) in
//            XCTAssertNotNil(issuccess)
//            XCTAssertTrue(issuccess ?? false)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
//    }
    
//    func testDeleteFromWishList() {
//        let exp = self.expectation(description: "testDeleteFromWishList")
//        client.wishlist.remove(userId: "228", objectId: "6457", entity: .products) { (isSuccess, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(isSuccess)
//            XCTAssertTrue(isSuccess ?? false)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
//    }
}
