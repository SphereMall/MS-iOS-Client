//
//  ESCatalogConfigurator.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public enum ESConfigurator {
    case attributes(values: [String])
    case priceRange
    case brands
    case functionalNames
    case factorValues(values: [String])
}

public class ESCatalogConfigurator {
    
    private var values: [ESConfigurator]
    
    public init() {
        values = [.brands, .priceRange]
    }
    
    public init(_ values: [ESConfigurator]) {
        self.values = values
    }
    
    func build() -> [String: Any] {
        
        var config: [String: Any] = [:]
        
        for value in values {
            switch value {
            case .priceRange:
                config["priceRange"] = true
            case .attributes(let values):
                config["attributes"] = values
            case .brands:
                config["brands"] = true
            case .functionalNames:
                config["functionalNames"] = true
            case .factorValues(let values):
                config["factorValues"] = values
            }
        }
        
        return config
    }
}
