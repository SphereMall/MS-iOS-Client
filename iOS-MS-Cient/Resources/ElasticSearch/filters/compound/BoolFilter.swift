//
//  BoolFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class BoolFilter: ElasticSearchQuery {
    
    private let MUST = "must";
    private let SHOULD = "should";
    private let MUST_NOT = "must_not";
    private let FILTER = "filter";
    
    public var name: String = "bool"
    
    private let elements: NSMutableDictionary = [:]
    
    public init() {}
    
    public func must(elements:ElasticSearchQuery...) {
        self.elements.setValue(elements, forKey: MUST)
    }
    
    public func should(elements:ElasticSearchQuery...) {
        self.elements.setValue(elements, forKey: SHOULD)
    }
    
    public func mustNot(elements:ElasticSearchQuery...) {
        self.elements.setValue(elements, forKey: MUST_NOT)
    }
    
    public func filter(elements:ElasticSearchQuery...) {
        self.elements.setValue(elements, forKey: FILTER)
    }
    
    public func toJson() -> NSDictionary {
        let filterBody:NSMutableDictionary = [:]
        for(key, value) in elements{
            let queries = value as? [ElasticSearchQuery] ?? []
            guard queries.count > 0 else {
                continue
            }
            if queries.count > 1 {
                filterBody.setValue(queriesToArray(items: queries), forKey: key as! String)
            }else{
                filterBody.setValue(queries[0].toJson(), forKey: key as! String)
            }
        }
        
        return [name: filterBody]
    }
    
    private func queriesToArray(items: [ElasticSearchQuery])->Array<NSDictionary>{
        var queries:Array<NSDictionary> = []
        for item in items {
            queries.append(item.toJson())
        }
        return queries
    }
}
