//
//  RangeFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

/**
 * gt: > greater than
 * lt: < less than
 * gte: >= greater than or equal to
 * lte: <= less than or equal to
 */

public enum RangeType: String {
    case GT = "gt"
    case LT = "lt"
    case GTE = "gte"
    case LTE = "lte"
}


public class RangeFilter<T>: LeafQueryFilter {
    
    public var name: String = "range"
    public var attribute: String = ""
    private var options: [String: T] = [:]
    
    public init(attribute: String) {
        self.attribute = attribute
    }
    
    public func addOption(optionName: String, value: T) {
        if !(optionName == RangeType.GT.rawValue) &&
            !(optionName == RangeType.LT.rawValue) &&
            !(optionName == RangeType.GTE.rawValue) &&
            !(optionName == RangeType.LTE.rawValue) {
            return
        }
        
        options[optionName] = value
    }
    
    public func toJson() -> NSDictionary {
        
        var optionJson: [String: Any] = [:]
        
        for entry in options {
            optionJson[entry.key] = entry.value
        }

        var attrObject: [String: Any] = [:]
        attrObject[attribute] = optionJson
        var filterObject: [String: Any] = [:]
        filterObject[name] = attrObject
        
        return filterObject as NSDictionary
        
    }
    
    public func toString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: toJson())
            if let json = String(data: jsonData, encoding: .utf8) {
                return json
            }
        } catch {
            return nil
        }
        
        return nil
    }
    
}
