//
//  Filter.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class Filter: NSObject {
    
    private var availableFilters : [FilterOperators] = [
        .like,
        .like_left,
        .like_right,
        .equal,
        .not_equal,
        .greater_than,
        .less_than,
        .greater_than_or_equal,
        .less_than_or_equal,
        .is_null,
    ] 
    
    public var filters: [Predicate] = []
    
    public init(filters: [Predicate] = []) {
        
        super.init()
        
        if !filters.isEmpty {
            self.setFilters(filters: filters)
        }
    }
    
    public init(specification: FilterSpecification) {
        filters.append(specification.asFilter())
    }
    
    public func getFilters() -> [Predicate] {
        return self.filters
    }
    
    @discardableResult public func setFilters(filters: [Predicate]) -> Filter {
        
        for item in filters {
            if item.field == "fullSearch" {
                addFilter(field: nil, op: item.op , value: item.value!)
            } else {
                addFilter(field: item.field, op: item.op , value: item.value!)
            }
        }
        
        return self
    }
    
    @discardableResult public func addFilter(field: String?, op: FilterOperators, value: String) -> Filter {
        if !value.isEmpty {
            self.filters.append(Predicate(field: field, op: op, value: value))
        }
        
        return self
    }
    
    public func asString() -> String {
        
        var str = "["
        for filter in filters {
            str = str + filter.make() + ","
        }
        
        str = str.dropLast().description
        str = "\(str)]"
        
        return str
    }
}
