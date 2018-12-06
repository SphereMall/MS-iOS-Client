//
//  BoolFilterTest.swift
//  iOS-MS-CientTests
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest
import SwiftyJSON

class BoolFilterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testBoolFilter() {
        let expectedFilter = "{\"bool\":{" +
            "\"should\":[" +
            "{\"terms\":{\"price\":[\"20\"]}}," +
            "{\"terms\":{\"productID\":[\"XHDK-A-1293-#fJ3\"]}}]," +
            "\"must\":" +
            "{\"terms\":{\"price\":[\"30\"]}}}}"
        
        let shouldPriceTerm = TermsFilter(esFilterCriteria: TermsFilterCriteria(field: "price", values: ["20"]));
        let shouldProductIdTerm =  TermsFilter(esFilterCriteria: TermsFilterCriteria(field: "productID", values: ["XHDK-A-1293-#fJ3"]));
        let mustPriceTerm = TermsFilter(esFilterCriteria: TermsFilterCriteria(field: "price", values: ["30"]));
        
        let boolFilter = BoolFilter()
    
        boolFilter.should(elements: shouldPriceTerm, shouldProductIdTerm);
        boolFilter.must(elements: mustPriceTerm);
        
        let parser = JSON(boolFilter.toJson())
        
        let json = parser.rawString()?
            .replacingOccurrences(of: " ", with:"")
            .replacingOccurrences(of: "\n", with: "")
        
        assert(json == expectedFilter)
    }
}
