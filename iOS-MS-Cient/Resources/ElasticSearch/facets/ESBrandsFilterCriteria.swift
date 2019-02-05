//
//  ESBrandsFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESBrandsFilterCriteria: ESCatalogFilterCriteria {
    
    public var brands: [Int] = []
    
    public init(brands: [Int]) {
        self.brands = brands
    }
    
    public func name() -> String {
        return "brands"
    }
    
    public func update(criteria: ESCatalogFilterCriteria) -> ESCatalogFilterCriteria {
        
        if let criteria = criteria as? ESBrandsFilterCriteria {
            self.brands = criteria.brands
        }
        
        return self
    }
    
    public func configuration() -> [String : Any] {
        return ["brands" : true]
    }
    
    public func toJson() throws -> String {
        do {
            guard let value = [name(): brands].jsonString else {
                throw SMError.runtimeError("bad_json")
            }
            return value
        } catch {
            throw SMError.runtimeError("bad_json")
        }
    }
    
    public func toQuery() -> [ElasticSearchQuery] {
        
        var queries: [ElasticSearchQuery] = []
        var ids: [String] = []
        
        for id in brands {
            ids.append(id.description)
        }
        
        let criteria: TermsFilterCriteria = TermsFilterCriteria(field: "brandId", values: ids)
        let termsFilter: TermsFilter = TermsFilter(esFilterCriteria: criteria)
        queries.append(termsFilter)
        
        return queries
    }
    

}
