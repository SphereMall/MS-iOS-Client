//
//  GridResourceTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 2/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class GridResourceTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: GRID_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    func testAllWithPredicate() {
        let exp = self.expectation(description: "testAllWithPredicate")
        let predicate = Predicate(field: "id", op: .equal, value: "627")
        client.grid.filters(predicates: [predicate]).all { (grid, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(grid)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testAll() {
        
        let exp = self.expectation(description: "testAll")
        client.grid.limit(limit: 10, offset: 0).all { (grid, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(grid)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFacets() {
        let exp = self.expectation(description: "testFacets")
        client.grid.facets { (items, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(items)
            let gridFilter = GridFilter()
            gridFilter.elements(elements: [FunctionalNameFilter(values: ["2"])])
            self.client.grid.limit(limit: 2).filters(filter: gridFilter).all { (grid, error) in
                XCTAssertNotNil(grid?.data?.first?.item)
                exp.fulfill()
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
}
