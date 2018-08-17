//
//  ProductPriceConfigurations.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/13/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public struct ProductPriceConfigurations: Decodable {
    
    public var type: String?
    public var id: String?
    public var attributes : ProductPriceConfigurationsAttributes?
    public var relationships: ObjectRelationships?
    
    init(include: IncludItem) {
        guard let object = include.item as? ProductPriceConfigurationsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}

public struct ProductPriceConfigurationsAttributes: Decodable {
    public var id: String?
    public var productId: String?
    public var priceConfigurationId: String?
}

public struct PriceConfigurationsAttributes: Decodable {
    public var id: String?
    public var code: String?
    public var affectAttributes: [String]?
}

public struct PriceConfigurations: Decodable {
    
    public var type: String?
    public var id: String?
    public var attributes : PriceConfigurationsAttributes?
    public var relationships: ObjectRelationships?
    
    init(include: IncludItem) {
        guard let object = include.item as? PriceConfigurationsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}
