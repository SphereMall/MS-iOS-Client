//
//  CrudTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import XCTest
@testable import iOS_MS_Cient

class CRUDTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        
        client = SMClient(gatewayUrl: "http://gateway-platform.alpha.spheremall.net/v1/",
                          clientId: "api_demo_user",
                          secretKey: "demo_pass",
                          username: "betastore",
                          password: "JHh4$%5jhgf#")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGet() {
        
        let exp = self.expectation(description: "testGet")
        client.products.all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error)
            exp.fulfill()
        }
    
        wait(for: [exp], timeout: 10)
    }
    
    func testGetWithLimit() {
        
        let exp = self.expectation(description: "testGet")
        client.products.limit(limit: 2, offset: 2).all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testAll() {
        let exp = self.expectation(description: "testAll")
        client.products.all() { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error)
            
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFullAll() {
        let exp = self.expectation(description: "testFullAll")
        client.products.limit(limit: 10, offset: 10).fullAll { (items, error) in
            XCTAssertNotNil(items)
            XCTAssertNil(error)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testCount() {
        let exp = self.expectation(description: "testCount")
        client.products.count { (count, error) in
            XCTAssertNotNil(count)
            XCTAssertNil(error)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testFirst() {
        let exp = self.expectation(description: "testFirst")
        client.products.first { (product, error) in
            print(product ?? error ?? "wtf")
            XCTAssertNotNil(product)
            XCTAssertNil(error)
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testCreate() {
        
        let product : [String : String] = [
            "seoTitle" : "BMW e46 M3",
            "price"  : "60000",
            "fullDescription": "full Description of car"]
        
        let exp = self.expectation(description: "testCreate")
        
        client.products.create(data: product) { (product, error) in
            print(product?.data ?? error ?? "wtf")
            XCTAssertNil(error)
            XCTAssertNotNil(product)
            XCTAssertNotNil(product?.data)
            XCTAssertNotNil(product?.data?.first?.id)
            XCTAssertNotNil(product?.data?.first?.attributes)
            XCTAssertEqual("BMW e46 M3", product?.data?.first?.attributes?.seoTitle)
            XCTAssertEqual("60000", product?.data?.first?.attributes?.price)
            XCTAssertEqual("full Description of car", product?.data?.first?.attributes?.fullDescription)
            
            guard let id = product?.data?.first?.id else {
                XCTFail()
                exp.fulfill()
                return
            }
            
            self.client.products.delete(id: id) { (isSuccess, error) in
                XCTAssertNotNil(isSuccess)
                XCTAssertNil(error)
                XCTAssertTrue(isSuccess!)
                print(isSuccess ?? error ?? "wtf")
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFiltersFullSearch() {
        
        let exp = self.expectation(description: "testFilters")
        
        let predicate = Predicate(field: "title",
                                  op: .full_search,
                                  value: "Test product")
        
        client.products.filter(predicate: predicate).all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error)
            print(products ?? error ?? "wtf")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFiltersByField() {
        
        let exp = self.expectation(description: "testFilters")
        
        let predicate = Predicate(field: "title", op: .equal, value: "Test product")
        
        client.products.filter(predicate:predicate).all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            print(products ?? error ?? "wtf")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFiltersMult() {
        
        let exp = self.expectation(description: "testFilters")
        
        let predicate = Predicate(field: "functionalNameId", op: .equal, value: "50")
        let predicateSecond = Predicate(field: "title", op: .equal, value: "Test product")
        
        client.products.filters(predicates: [predicate, predicateSecond]).all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            print(products ?? error ?? "wtf")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFiltersSort() {
        
        let exp = self.expectation(description: "testFilters")
        
        client.products.sort(field: "-id").all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            print(products ?? error ?? "wtf")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testGetProductsWithPredicatesAndFilters() {
        let exp = self.expectation(description: "testFilters")
        let predicate = Predicate(field: "title", op: .equal, value: "Test product")
        client.products.filter(predicate: predicate)
            .sort(field: "id")
            .fields(fields: ["title","price"])
            .limit(limit: 10)
            .all { (products, error) in
                XCTAssertNotNil(products)
                XCTAssertNil(error?.status)
                print(products ?? error ?? "wtf")
                exp.fulfill()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func testInPredicate() {
        
        let exp = self.expectation(description: "testFilters")

        let predicate = InPredicate(field: "title", values: ["Test product","test"])
        client.products.in(predicate: predicate).all { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            print(products ?? error ?? "wtf")
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testDetail() {
        
        let exp = self.expectation(description: "testFilters")
        
        client.products.detail(id: "630") { (product, error) in
            XCTAssertNotNil(product)
            XCTAssertNil(error?.status)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testGetAll() {
        
        let exp = self.expectation(description: "testFilters")
        
        client.products.fullAll { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testVariants() {
        
        let exp = self.expectation(description: "testFilters")
        
        client.products.variants(ids: ["1"]) { (products, error) in
            XCTAssertNotNil(products)
            XCTAssertNil(error?.status)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
