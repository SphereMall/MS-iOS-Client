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
    
    func testFacetsBrands() {
        
        let configuration = ESCatalogConfigurator([.brands, .attributes(values: ["reward"])])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["1"]))
        
        let exp = self.expectation(description: "load")
        
        client.elastic.facets(filter: filter, entities: [.products]) { (data, error) in
            if let facets = data?.magic() {
                print(facets)
            } else {
                XCTFail()
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
    
    func testFacetsCategorys() {
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["brand", "eurosparencategory"])])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        let exp = self.expectation(description: "load")
        
        client.elastic.facets(filter: filter, entities: [.products]) { (facets, error) in
            print(facets)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }

    func testFacets() {
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["brand", "eurosparencategory"]),
                                                   .brands,
                                                   .factorValues(values: []),
                                                   .range(builder: ESRangeBuilder(attributes: ["minpricepoints"], fields: ["price"]))])
        
        let filter = ESCatalogFilter.filter(config: configuration)

        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["1"]))
        
        let channel = TermsFilterCriteria(field: "channelIds", values: ["5"])
        
        let channelFilter = TermsFilter(esFilterCriteria: channel)
        
        let price = ESPriceRangeFilter(attribute: "price")
        price.setRange(minPrice: 0, maxPrice: 79000)
        
        let boolFilter = filter.toBoolFilter()
        boolFilter.must(elements: channelFilter, price)
        
        let exp = self.expectation(description: "load")
                
        client.elastic.facets(filter: filter, groupBy: "variantsCompound", entities: [.products]) { (data, error) in
            
            if let facets = data?.magic() {
                print(facets)
            } else {
                XCTFail()
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
    
    func testPages() {
        
        let exp = self.expectation(description: "testElasticSearchFilterData")
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["reward"]),
                                                   .brands,
                                                   .factorValues(values: ["3", "1"]),
                                                   .functionalNames,
                                                   .range(builder: ESRangeBuilder(attributes: ["minpricepoints"], fields: ["price"]))])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["1"]))
        
        let isMain = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMain)
        
        let channel = TermsFilterCriteria(field: "channelIds", values: ["5"])
        let channelFilter = TermsFilter(esFilterCriteria: channel)
        
        let reward = TermsFilterCriteria(field: "reward_attr.attributeValue", values: ["1"])
        let rewardFilter = TermsFilter(esFilterCriteria: reward)
        
        let rangeFilter = ESPriceRangeFilter(attribute: "minpriceeuro_attr.attributeValue")
        rangeFilter.setRange(minPrice: 0, maxPrice: 500)
        
        let minpricepoints = ESPriceRangeFilter(attribute: "minpricepoints_attr.attributeValue")
        minpricepoints.setRange(minPrice: 0, maxPrice: 500)
        
        let price = ESPriceRangeFilter(attribute: "price")
        price.setRange(minPrice: 20, maxPrice: 79000)
        
        let boolFilter = filter.toBoolFilter()
        boolFilter.must(elements: isMainFilter, rewardFilter, channelFilter, rangeFilter, minpricepoints, price)
        
        let elasticSearchFilter = ESSearchFilter()
        elasticSearchFilter.index(indexes: "sm-pages")
//        elasticSearchFilter.query(queryFilter: boolFilter)
        
        client.elastic.search(filter: elasticSearchFilter) { (grid, error) in
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
                                                   .range(builder: ESRangeBuilder(attributes: ["minpricepoints"], fields: ["price"]))])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["1"]))
        
        let isMain = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMain)
        
        let channel = TermsFilterCriteria(field: "channelIds", values: ["5"])
        let channelFilter = TermsFilter(esFilterCriteria: channel)
        
        let reward = TermsFilterCriteria(field: "reward_attr.attributeValue", values: ["1"])
        let rewardFilter = TermsFilter(esFilterCriteria: reward)
        
        let rangeFilter = ESPriceRangeFilter(attribute: "minpriceeuro_attr.attributeValue")
        rangeFilter.setRange(minPrice: 0, maxPrice: 500)
        
        let minpricepoints = ESPriceRangeFilter(attribute: "minpricepoints_attr.attributeValue")
        minpricepoints.setRange(minPrice: 0, maxPrice: 500)
        
        let price = ESPriceRangeFilter(attribute: "price")
        price.setRange(minPrice: 20, maxPrice: 79000)
        
        let boolFilter = filter.toBoolFilter()
        boolFilter.must(elements: isMainFilter, rewardFilter, channelFilter, rangeFilter, minpricepoints, price)
        
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
    
    func testElasticSearchExists() {
        
        let exp = self.expectation(description: "testElasticSearchFilterData")
        
        let configuration = ESCatalogConfigurator([.attributes(values: ["reward"]),
                                                   .brands,
                                                   .factorValues(values: ["3", "1"]),
                                                   .functionalNames,
                                                   .range(builder: ESRangeBuilder(attributes: ["minpricepoints"], fields: ["price"]))])
        
        let filter = ESCatalogFilter.filter(config: configuration)
        
        filter.add(ESAttributesFilterCriteria(code: "reward", values: ["1"]))
        
        let isMain = TermsFilterCriteria(field: "isMain", values: ["1"])
        let isMainFilter = TermsFilter(esFilterCriteria: isMain)
        
        let channel = TermsFilterCriteria(field: "channelIds", values: ["6"])
        let channelFilter = TermsFilter(esFilterCriteria: channel)
        
        let reward = TermsFilterCriteria(field: "reward_attr.attributeValue", values: ["0"])
        let rewardFilter = TermsFilter(esFilterCriteria: reward)
        
        let exists = TermFilterCriteria(field: "field", value: "product-category_attr")
        let existsFilter = ExistsFilter(esFilterCriteria: exists)
        
        let boolFilter = filter.toBoolFilter()
        boolFilter.must(elements: isMainFilter, rewardFilter, channelFilter, existsFilter)
        
        let elasticSearchFilter = ESSearchFilter()
        elasticSearchFilter.index(indexes: "sm-products")
        elasticSearchFilter.source(fields: ["scope"])
        elasticSearchFilter.query(queryFilter: boolFilter)
        
        client.elastic.limit(limit: 20, offset: 0).search(filter: elasticSearchFilter) { (grid, error) in
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
        
    }
}
