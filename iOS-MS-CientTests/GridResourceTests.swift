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
    
    func testAll() {
        let exp = self.expectation(description: "testAll")
        let predicate = Predicate(field: "id", op: .equal, value: "627")
        let predicatew = Predicate(field: "id", op: .equal, value: "627")
        client.grid.filters(predicates: [predicate, predicatew]).all { (grid, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFacets() {
        let exp = self.expectation(description: "testFacets")
        client.grid.facets { (items, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
