//
//  ESCatalogFilterTests.swift
//  iOS-MS-CientTests
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import XCTest

class ESCatalogFilterTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: api_url,
                          clientId: api_clientId,
                          secretKey: api_secretKey,
                          username: api_username,
                          password: api_password)
    }

    func testFacets() {
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["reward"]),
                                                   .brands,
                                                   .factorValues(values: ["3", "1"]),
                                                   .functionalNames,
                                                   .priceRange])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        let priceRange = ESPriceRangeFilterCriteria(min: 10, max: 50)
        let attribute = ESAttributesFilterCriteria(code: "reward", values: ["0"])
        
        filter.add(priceRange)
        filter.add(attribute)
        
        let exp = self.expectation(description: "load")
                
        client.elastic.facets(filter: filter, entities: [.products]) { (facets, error) in
            print(facets)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func testElasticSearchFilterData() {
        
        let exp = self.expectation(description: "testElasticSearchFilterData")
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["reward"]),
                                                   .brands,
                                                   .factorValues(values: ["3", "1"]),
                                                   .functionalNames,
                                                   .priceRange])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["0"]))
        
        let isMain = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMain)
        
        let channel = TermsFilterCriteria(field: "channelIds", values: ["5"])
        let channelFilter = TermsFilter(esFilterCriteria: channel)
        
        let boolFilter = filter.toBoolFilter()
        boolFilter.must(elements: isMainFilter, channelFilter)
        
        let elasticSearchFilter = ESSearchFilter()
        elasticSearchFilter.index(indexes: "sm-products")
        elasticSearchFilter.source(fields: ["scope"])
        elasticSearchFilter.query(queryFilter: boolFilter)
        elasticSearchFilter.sort(sortFilter: SortFilter(field: "3_factorValues.value", sort: Sort.DESC))
        
        client.elastic.search(filter: elasticSearchFilter) { (grid, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
}
