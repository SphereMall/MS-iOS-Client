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
        client = SMClient(gatewayUrl: api_url,
                          clientId: api_clientId,
                          secretKey: api_secretKey,
                          username: api_username,
                          password: api_password)
        
        client.setHeaders(["channel-id" : api_channelId])
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
            let object = grid?.data?.first?.item as! ProductsData
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
    
    func testDocuments() {
        
        let exp = self.expectation(description: "testFacets")
        let filter = GridFilter()
        filter.elements(elements: [EntityFilter(values: ["\"documents\""])])
        
        client.grid.limit(limit: 1, offset: 0).filters(filter: filter).all { (grid, error) in
            
            print(grid)
            if let item = grid?.data?.first?.item as? DocumentData {
                print(item)
            }
            
            exp.fulfill()
        }
        
         wait(for: [exp], timeout: 10)
    }
}
