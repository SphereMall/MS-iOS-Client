//
//  GridFilter.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GridFilter: Filter {
    
    public var elements: [[GridFilterElement]] = []
    
    @discardableResult public func elements(elements: [GridFilterElement]) -> GridFilter {
        self.elements.append(elements)
        return self
    }
    
    @discardableResult public override func instance() -> Filter {
        return self
    }
    
    @discardableResult public func reset() -> GridFilter {
        self.elements.removeAll()
        return self
    }
    
    @discardableResult public override func setFilters(filters: [Predicate]) -> GridFilter {
        for filter in filters {
            self.filters.append(Predicate(field: filter.field, op: filter.op, value: filter.value!))
        }
        return self
    }
    
    public func getElements() -> [[GridFilterElement]] {
        return self.elements
    }
    
    public func toString() -> String {
        return mapParamsToString(toParams())
    }
    
    @discardableResult public func addFilter(field: String, value: String) -> GridFilter {
        self.filters.append(Predicate(field: field, op: .equal, value: value))
        return self
    }

    public func toParams() -> [String : String] {
        var set = getStandardFilter()
        if elements.count > 0 {
            var jsonParams = String()
            for levelElements in self.elements {
                var elements = "{"
                for element in levelElements {
                    elements.append(element.asString() + ",")
                }
                jsonParams.append(elements.dropLast() + "},")
            }
            
            set["params"] = "[\(jsonParams.dropLast())]"
        }
        return set
    }
    
    private func getStandardFilter() -> [String: String] {
        var set: [String: String] = [:]
        for predicate in filters {
            set[predicate.field!] = predicate.value
        }
        
        return set
    }
    
    private func mapParamsToString(_ params: [String: String]) -> String {
        return params.map({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
    }
}
