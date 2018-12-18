//
//  ESSearchFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ESSearchFilter: ElasticSearchFilter {
    
    private var searchQuery: ElasticSearchQuery? = nil
    private var _index:String = "sm-*";
    
    public init() {}
    
    public func index(indexes: String...) {
        self._index = indexes.joined(separator: ",")
    }
    
    public func query(queryFilter: ElasticSearchQuery) {
        self.searchQuery = queryFilter
    }
    
    public func toString() -> String {
        return JSON(toJson()).rawString()!
            .replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with:"")
    }
    
    public func index() -> String {
        return self._index
    }
    
    public func toJson() -> NSDictionary {
        
        guard let query = self.searchQuery?.toJson() else {
            return [:]
        }
        
        return ["query": query]
    }
}
