//
//  GridFilterTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 5/7/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class GridFilterTests: XCTestCase {
    
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
    
    func testAllWithFilter() {
        
        let exp = self.expectation(description: "testAllWithFilter")
     
        let gridFilter = GridFilter()
        gridFilter
            .elements(elements: [FunctionalNameFilter(values: ["2"])])
        client.grid.limit(limit: 5).filters(filter: gridFilter).all { (grid, error) in
            XCTAssertNotNil(grid?.data?.first?.item)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testAll() {
        
        let exp = self.expectation(description: "testAllWithFilter")
        
        client.grid.limit(limit: 25).all { (grid, error) in
            XCTAssertNotNil(grid?.data?.first?.item)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    
    func test😆() {
        
        let exp = self.expectation(description: "testAllWithFilter")

        let gridFilter = GridFilter()
        gridFilter.elements(elements: [PriceRangeFilter(from: "10", to: "4145")])
        
        client.grid.filters(filter: gridFilter).all { (grid, error) in
            XCTAssertNotNil(grid?.data?.first?.item)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
