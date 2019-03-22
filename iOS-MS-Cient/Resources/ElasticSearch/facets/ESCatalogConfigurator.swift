//
//  ESCatalogConfigurator.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public enum ESConfigurator {
    case range(builder: ESRangeBuilder)
    case attributes(values: [String])
    case brands
    case functionalNames
    case factorValues(values: [String])
}

public class ESCatalogConfigurator {
    
    private var values: [ESConfigurator]
    
    public init() {
        values = [.brands]
    }
    
    public init(_ values: [ESConfigurator]) {
        self.values = values
    }
    
    func build() -> [String: Any] {
        
        var config: [String: Any] = [:]
        
        for value in values {
            switch value {
            case .attributes(let values):
                config["attributes"] = values
            case .brands:
                config["brands"] = true
            case .functionalNames:
                config["functionalNames"] = true
            case .factorValues(let values):
                config["factorValues"] = values
            case .range(let builder):
                config["range"] = builder.toJson()
            }
        }
        
        return config
    }
}

public class ESRangeBuilder: ESFilterCriteria {

    private var attributes: [String] = []
    private var fields: [String] = []
    
    public init(attributes: [String] = [], fields: [String] = []) {
        self.attributes = attributes
        self.fields = fields
    }
    
    public func add(attribute: String) {
        self.attributes.append(attribute)
    }
    
    public func add(field: String) {
        self.fields.append(field)
    }
    
    public func remove(field: String) {
        if let index = self.fields.firstIndex(of: field) {
            self.fields.remove(at: index)
        }
    }
    
    public func remove(attribute: String) {
        if let index = self.attributes.firstIndex(of: attribute) {
            self.attributes.remove(at: index)
        }
    }
    
    public func toJson() -> NSDictionary {
        return ["attributes": attributes, "fields": fields]
    }
}
