//
//  ESAttributesFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESAttributesFilterCriteria: ESCatalogFilterCriteria {
        
    private var code: String
    private var items: [String: [String]]
    
    public init(code: String, values: [String]) {
        self.code = code
        self.items = [code: values]
    }
    
    public func name() -> String {
        return "attributes"
    }
    
    public func update(criteria: ESCatalogFilterCriteria) -> ESCatalogFilterCriteria {
        
        if let criteria = criteria as? ESAttributesFilterCriteria {
            self.items[code] = criteria.items[code]
        }
        
        return self
    }
    
    public func toJson() throws -> String {
        if let value = ["attributes": [code : ["value": items[code]]]].jsonString {
            return value
        } else {
            throw SMError.runtimeError("bad_json")
        }
    }
    
    public func configuration() -> [String: Any] {
        return ["attributes" : [items.keys]]
    }
    
    public func toQuery() -> [ElasticSearchQuery] {
        
        var queries: [ElasticSearchQuery] = []
        
        for entry in items {
            let criteria: TermsFilterCriteria = TermsFilterCriteria(field: entry.key + "_attr.attributeValue", values: entry.value)
            let termsFilter: TermsFilter = TermsFilter(esFilterCriteria: criteria)
            queries.append(termsFilter)
        }
        
        return queries
    }
}
