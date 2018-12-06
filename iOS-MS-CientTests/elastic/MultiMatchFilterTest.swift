//
//  MultiMatchFilterTest.swift
//  iOS-MS-CientTests
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest
import SwiftyJSON

class MultiMatchFilterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFilter() {
        let expectedJson = "{" +
            "\"multi_match\":{" +
            "\"fields\":[\"subject\",\"message\"]," +
            "\"query\":\"brownfox\"," +
            "\"analyzer\":\"standard\"," +
            "\"type\":\"best_fields\"," +
            "\"operator\":\"and\"," +
            "\"tie_breaker\":1" +
            "}" +
        "}"
        
        let multiMatchFilter = MultiMatchFilter(field: "message", query: "brownfox")
        multiMatchFilter.setType(type: "best_fields");
        multiMatchFilter.setFields(fields:["subject", "message"]);
        multiMatchFilter.setTieBreaker(tieBreaker: 1);
        multiMatchFilter.setAnalyzer(analyzer: "standard");
        multiMatchFilter.setOperator(data: "and");
        
        let parser = JSON(multiMatchFilter.toJson())
        
        let generatedJson = parser.rawString()?
            .replacingOccurrences(of: " ", with:"")
            .replacingOccurrences(of: "\n", with: "")
        
        assert(generatedJson == expectedJson)
    }
}
