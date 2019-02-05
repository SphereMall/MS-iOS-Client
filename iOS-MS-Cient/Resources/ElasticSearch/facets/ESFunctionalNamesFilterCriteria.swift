//
//  ESFunctionalNamesFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESFunctionalNamesFilterCriteria: ESCatalogFilterCriteria {
    
    public var functionalNames: [Int] = []
    
    public func name() -> String {
        return "functionalNames"
    }
    
    public func update(criteria: ESCatalogFilterCriteria) -> ESCatalogFilterCriteria {
        if let criteria = criteria as? ESFunctionalNamesFilterCriteria {
            self.functionalNames = criteria.functionalNames
        }
        
        return self
    }
    
    public func configuration() -> [String : Any] {
        return ["functionalNames" : true]
    }
    
    public func toJson() throws -> String {
        do {
            guard let value = [name(): functionalNames].jsonString else {
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
        
        for id in functionalNames {
            ids.append(id.description)
        }
        
        let criteria = TermsFilterCriteria(field: "functionalNameId", values: ids)
        let termsFilter = TermsFilter(esFilterCriteria: criteria)
        queries.append(termsFilter)
        
        return queries
    }
    

}
