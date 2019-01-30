//
//  ElasticSearchResourceTest.swift
//  iOS-MS-CientTests
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest
import SwiftyJSON

class ElasticSearchResourceTest: XCTestCase {

    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: api_url,
                          clientId: api_clientId,
                          secretKey: api_secretKey,
                          username: api_username,
                          password: api_password)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchAutocomplete() {
        
        let keyword = "milner"
        
        let filter = ESSearchFilter()
        filter.index(indexes: "sm-products", "sm-documents")
        
        let matchFilter = MultiMatchFilter(field: "title_*", query: keyword)
        matchFilter.setFields(fields: ["html_*", "title_*", "short_description_*", "full_description_*", "brandName_*"])
        
        let isMainCriteria = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMainCriteria)
        
        let channelFilterCriteria = TermsFilterCriteria(field: "channelIds", values: ["5"])
        let channelFilter = TermsFilter(esFilterCriteria: channelFilterCriteria)
        
        let entityProductsTermsCriteria = TermsFilterCriteria(field: "_type", values: ["products"])
        let entityProductsTermsFilter = TermsFilter(esFilterCriteria: entityProductsTermsCriteria)
        
        let entityDocumentsTermsCriteria = TermsFilterCriteria(field: "_type", values: ["documents"])
        let entityDocumentsTermsFilter = TermsFilter(esFilterCriteria: entityDocumentsTermsCriteria)
        
        let productsBoolFilter = BoolFilter()
        let documentsBoolFilter = BoolFilter()
        
        productsBoolFilter.must(elements: matchFilter, isMainFilter, channelFilter, entityProductsTermsFilter)
        documentsBoolFilter.must(elements: channelFilter, matchFilter, entityDocumentsTermsFilter)
        
        let boolSearchFilter = BoolFilter()
        boolSearchFilter.should(elements: productsBoolFilter, documentsBoolFilter)
        
        filter.query(queryFilter: boolSearchFilter)
        
        let parser = JSON(filter.toString())
        let json = parser.rawString()
        XCTAssertNotNil(json)
    }
    
    func testLoad() {
        
        let keyword = "milner"
        
        let filter = ESSearchFilter()
        filter.index(indexes: "sm-products", "sm-documents")
        
        let matchFilter = MultiMatchFilter(field: "title_*", query: keyword)
        matchFilter.setFields(fields: ["html_*", "title_*", "short_description_*", "full_description_*", "brandName_*"])
        
        let isMainCriteria = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMainCriteria)
        
        let channelFilterCriteria = TermsFilterCriteria(field: "channelIds", values: ["5"])
        let channelFilter = TermsFilter(esFilterCriteria: channelFilterCriteria)
        
        let entityProductsTermsCriteria = TermsFilterCriteria(field: "_type", values: ["products"])
        let entityProductsTermsFilter = TermsFilter(esFilterCriteria: entityProductsTermsCriteria)
        
        let entityDocumentsTermsCriteria = TermsFilterCriteria(field: "_type", values: ["documents"])
        let entityDocumentsTermsFilter = TermsFilter(esFilterCriteria: entityDocumentsTermsCriteria)
        
        let productsBoolFilter = BoolFilter()
        let documentsBoolFilter = BoolFilter()
        
        productsBoolFilter.must(elements: matchFilter, isMainFilter, channelFilter, entityProductsTermsFilter)
        documentsBoolFilter.must(elements: channelFilter, matchFilter, entityDocumentsTermsFilter)
        
        let boolSearchFilter = BoolFilter()
        boolSearchFilter.should(elements: productsBoolFilter, documentsBoolFilter)
        
        filter.query(queryFilter: boolSearchFilter)
        
        let exp = self.expectation(description: "load")
        
        client.elastic
            .limit(limit: 1, offset: 0)
            .search(filter: filter) { (response, error) in
            print(response)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFacets() {
        
        let exp = self.expectation(description: "load")
        
        client.elastic.facets { (items, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
}
