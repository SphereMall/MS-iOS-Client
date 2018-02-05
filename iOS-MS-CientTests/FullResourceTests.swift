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
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFullByAll() {
        let exp = self.expectation(description: "testGet")
        client.products.fullBy(id: 6329) { (products, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(products?.data?.first?.attributes?.id)
            XCTAssertEqual(Int(products!.data!.first!.attributes!.id!), 6329)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFullByUrlAll() {
        let exp = self.expectation(description: "testGet")
        client.products.fullBy(code: "limoen-komkommer-fruitwater") { (products, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(products?.data?.first?.attributes?.urlCode)
            XCTAssertEqual(products!.data!.first!.attributes!.urlCode!, "limoen-komkommer-fruitwater")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFullAlll() {
        let exp = self.expectation(description: "testFullAlll")
        client.products.fullAll { (products, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(products?.data?.first?.attributes?.urlCode)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
}
