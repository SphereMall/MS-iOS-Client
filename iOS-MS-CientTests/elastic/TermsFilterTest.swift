//
//  TermsFilterTest.swift
//  iOS-MS-CientTests
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest
import SwiftyJSON

class TermsFilterTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTermsFilter() {
        let expectedJson = "{\"terms\":{\"price\":[\"20\",\"30\"]}}"
        let criteria = TermsFilterCriteria(field: "price", values: ["20", "30"])
        let termsFilter = TermsFilter(esFilterCriteria: criteria)
        let parser = JSON(termsFilter.toJson())
        let generatedJson = parser.rawString()?
            .replacingOccurrences(of: " ", with:"")
            .replacingOccurrences(of: "\n", with: "")
        assert(generatedJson == expectedJson)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
