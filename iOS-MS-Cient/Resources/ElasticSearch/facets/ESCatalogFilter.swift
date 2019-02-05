//
//  ESCatalogFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

enum SMError: Error {
    case runtimeError(String)
}

public class ESCatalogFilter {
    
    private var queryParams: [String: ESCatalogFilterCriteria] = [:]
    private var configurator: ESCatalogConfigurator
    
    private init(_ criterias: [ESCatalogFilterCriteria], config: ESCatalogConfigurator) {
        configurator = config
        for criteria in criterias {
            queryParams[criteria.name()] = criteria
        }
    }
    
    @discardableResult public static func filter(_ criterias: [ESCatalogFilterCriteria] = [],
                                                      config: ESCatalogConfigurator = ESCatalogConfigurator()) -> ESCatalogFilter {
        return ESCatalogFilter(criterias, config: config)
    }
    
    @discardableResult public func add(_ criteria: ESCatalogFilterCriteria) -> ESCatalogFilter {
        queryParams[criteria.name()] = criteria
        return self
    }
    
    @discardableResult public func remove(_ criteria: ESCatalogFilterCriteria) -> ESCatalogFilter {
        queryParams.removeValue(forKey: criteria.name())
        return self
    }
    
    public func params() -> String {
        
        let pams = queryParams.values.compactMap({ (criteria) -> String? in
            return try? criteria.toJson()
        }).joined(separator: ",")
        
        return "[\(pams)]"
    }
    
    public func config() -> String {
        if let value = configurator.build().jsonString {
            return value
        } else {
            return ""
        }
    }
    
    public func toBoolFilter() -> BoolFilter {
        
        let boolFilter = BoolFilter()
        for entry in queryParams {
            for query in entry.value.toQuery() {
                boolFilter.must(elements: query)
            }
        }
        
        return boolFilter
    }
}

extension Dictionary {
    var jsonString: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
                                                                return nil
        }
        
        return String(data: theJSONData, encoding: .ascii)
    }
    
    func json() throws -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            return String(data: data, encoding: .utf8)
        }
        catch (let error) {
            throw error
        }
    }
}

extension NSDictionary {
    func jsonString() throws -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)
        }
        catch (let error) {
            throw error
        }
    }
}
