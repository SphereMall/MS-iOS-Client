//
//  SortFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public enum Sort: String {
    case ASC = "ASC"
    case DESC = "DESC"
}

public enum SortKey: String {
    case SORT_KEY = "sort"
    case ORDER_KEY = "order"
}

public class SortFilter: ESFilterCriteria {
    
    public final var sortMap: [String: Sort] = [:]
    
    public init(field: String) {
        sortMap[field] = .ASC
    }
    
    public init(field: String, sort: Sort) {
        sortMap[field] = sort
    }
    
    public func toJson() -> NSDictionary {
        
        let criteriaObject: NSMutableDictionary = [:]
        let sortArray: NSMutableDictionary = [:]
        
        for entry in sortMap {
            
            let sortOrderObj: NSMutableDictionary = [:]
            sortOrderObj[SortKey.ORDER_KEY.rawValue] = entry.value.rawValue
            
            let sortFieldObj: NSMutableDictionary = [:]
            sortFieldObj[entry.key] = sortOrderObj
            sortArray.addEntries(from: sortFieldObj as! [AnyHashable : Any])
        }

        criteriaObject[SortKey.SORT_KEY.rawValue] = sortArray
        
        return criteriaObject
    }
}
