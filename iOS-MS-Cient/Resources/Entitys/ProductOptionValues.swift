//
//  ProductOptionValues.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/13/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public struct ProductOptionValues: Decodable {
    
    public var type: String?
    public var id: String?
    public var attributes: ProductOptionValuesAttributes?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? ProductOptionValuesAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}

public struct ProductOptionValuesAttributes: Decodable {
    public var id: String?
    public var optionId: String?
    public var optionValueId: String?
    public var relationProductId: String?
    public var title: String?
    public var image: String?
    public var amount: String?
    public var price: String?
    public var totalPrice: String?
    public var vatId: String?
    public var objectId: String?
    public var totalPriceWithVat: String?
    public var priceWithVat: String?
}


