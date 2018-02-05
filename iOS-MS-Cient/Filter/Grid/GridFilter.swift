//
//  GridFilter.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class GridFilter: Filter {
    internal var level: Int! = 0
    internal var elements: [GridFilterElement] = []
    
    public func elements(elements: [GridFilterElement]) -> GridFilter {
//        for element in elements {
//            self.elements![self.level][element.getName()] = element.getValues()
//        }
//
        self.level = self.level + 1
        return self
    }
    
    public func reset() -> GridFilter {
        self.elements.removeAll()
        self.level = 0
        return self
    }
    
    public override func setFilters(filters: [Predicate]) -> GridFilter {
//        foreach ($filters as $key => $value) {
//            $this->addFilter($key, $value);
//        }
        return self
    }
    
    public func getElements() -> [GridFilterElement] {
        return self.elements
    }
    
    public func toString() -> String {
   
//        var set = getStandardFilter()
//
//        if (!empty($this->elements)) {
//            $set['params'] = json_encode($this->elements);
//        }
//
        return ""
    }
    
//    public func addFilter(field, value, op = nil) {
//        self.filters[field] = value
//        return self
//    }
    
    private func getStandardFilter() -> [Predicate] {
        let set: [Predicate] = []
//        if filters.count > 0 {
//            
//            for filter in filters {
//                
//            }
            
//            foreach (filters as $key => $value) {
//                $set[$key] = is_array($value)
//                    ? implode(',', $value)
//                    : $value;
//            }
//        }
        return set
    }
}
