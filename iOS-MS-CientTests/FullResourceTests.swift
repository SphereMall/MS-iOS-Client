//
//  FullResourceTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class FullResourceTests: XCTestCase {
    
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
    
    func testFullByAll() {
        let exp = self.expectation(description: "testGet")
        
        client.products.fullBy(id: 433) { (products, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(products?.data?.first?.attributes?.id)
            XCTAssertEqual(Int(products!.data!.first!.attributes!.id!), 433)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFullByUrlAll() {
        let exp = self.expectation(description: "testGet")
        client.products.fullBy(code: "store-plisse-tamisant-blanc-neige") { (products, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(products?.data?.first?.attributes?.urlCode)
            XCTAssertEqual(products!.data!.first!.attributes!.urlCode!, "store-plisse-tamisant-blanc-neige")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFullAlll() {
        let exp = self.expectation(description: "testFullAlll")
        client.products.limit(limit: 4, offset: 10).fullAll { (items, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(items?.data?.first?.attributes?.urlCode)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }
}
