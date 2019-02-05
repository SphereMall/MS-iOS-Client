//
//  ESSearchFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation
import SwiftyJSON

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

public class ESSearchFilter: Filter, ElasticSearchFilter {
    
    private var searchQuery: ElasticSearchQuery? = nil
    private var _index:String = "sm-*";
    private var sortFilter: SortFilter? = nil
    private var sourceFields: [String] = []
    
    public init() {
        super.init()
    }
    
    public func index(indexes: String...) {
        self._index = indexes.joined(separator: ",")
    }
    
    public func query(queryFilter: ElasticSearchQuery) {
        self.searchQuery = queryFilter
    }
    
    @discardableResult public func sort(sortFilter: SortFilter) -> ElasticSearchFilter {
        self.sortFilter = sortFilter
        return self
    }
    
    @discardableResult public func source(fields: [String]) -> ElasticSearchFilter {
        sourceFields = fields
        return self
    }
    
    public func toString() -> String {
        return JSON(toJson()).rawString()!
            .replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with:"")
    }
    
    public func index() -> String {
        return self._index
    }
    
    public func toJson() -> NSDictionary {
        
        let json: NSMutableDictionary = [:]
        
        guard let dict = searchQuery?.toJson() else {
            return [:]
        }
        
        let query: NSMutableDictionary = NSMutableDictionary(dictionary: dict)
        
        if let filter = sortFilter {
            json.setDictionary(filter.toJson() as! [AnyHashable : Any])
        }
        
        if query.count > 0 {
            json["query"] = query
        }
        
        if sourceFields.count > 0 {
            json["_source"] = sourceFields.first!
        }
        
        return json
    }
}
