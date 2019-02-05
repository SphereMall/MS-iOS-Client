//
//  ESPriceRangeFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESPriceRangeFilterCriteria: ESCatalogFilterCriteria {
    
    public var min: Double
    public var max: Double
    
    public init(min: Double, max: Double) {
        self.min = min
        self.max = max
    }
    
    public func name() -> String {
        return "priceRange"
    }
    
    public func toJson() throws -> String {
        do {
            guard let value = [name(): [["min": min, "max": max]]].jsonString else {
                throw SMError.runtimeError("bad_json")
            }
            return value
        } catch {
            throw SMError.runtimeError("bad_json")
        }
    }
    
    
    public func update(criteria: ESCatalogFilterCriteria) -> ESCatalogFilterCriteria {
        if let criteria = criteria as? ESPriceRangeFilterCriteria {
            self.min = criteria.min
            self.max = criteria.max
        }
        
        return self
    }
    
    public func configuration() -> [String: Any] {
        return ["priceRange" : true]
    }
    
    public func toQuery() -> [ElasticSearchQuery] {
        let priceRangeFilter = ESPriceRangeFilter(attribute: "price")
        priceRangeFilter.setRange(minPrice: min, maxPrice: max)
        return [priceRangeFilter]
    }
}
