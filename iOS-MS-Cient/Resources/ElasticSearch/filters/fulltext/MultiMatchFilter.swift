//
//  MultiMatchFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class MultiMatchFilter: LeafQueryFilter {
    
    private let QUERY = "query"
    private let FIELDS = "fields"
    private let TYPE = "type";
    private let OPERATOR = "operator";
    private let TIE_BREAKER = "tie_breaker";
    private let ANALYZER = "analyzer";
    public var name: String = "multi_match"
    
    private let field:String
    private let queryParams:NSMutableDictionary = [:]
    
    public init(field:String, query:String) {
        self.field = field
        self.queryParams.setValue(query, forKey: QUERY)
    }
    
    public func setFields(fields:[String]){
        queryParams.setValue(fields, forKey: FIELDS)
    }
    
    public func setType(type: String){
        queryParams.setValue(type, forKey: TYPE)
    }
    
    public func setTieBreaker(tieBreaker:Double) {
        queryParams.setValue(tieBreaker, forKey: TIE_BREAKER)
    }
    
    public func setOperator(data:String) {
        queryParams.setValue(data, forKey: OPERATOR)
    }
    
    public func setAnalyzer(analyzer:String) {
        queryParams.setValue(analyzer, forKey: ANALYZER)
    }
    
    public func toJson() -> NSDictionary {
        return [name: queryParams]
    }
}
