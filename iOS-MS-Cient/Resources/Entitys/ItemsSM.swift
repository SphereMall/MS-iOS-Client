//
//  ItemsSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ItemsSM: Entity, Decodable {
    public var data : [ItemsData]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public class ItemsData: Decodable {
    public var attributes : ItemsAttributes?
    public var type : String?
    public var id: String?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? ItemsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
        self.rebuild()
    }
    
    public func rebuild() {
        
    }
}

public class ItemsAttributes: Decodable  {
    
    public var id: String?
    public var orderId: String?
    public var productId: String?
    public var amount: String?
    public var deprecated_promotionId: String?
    public var deprecated_compound: String?
    public var itemPrice: String?
    public var totalDiscountPrice: String?
    public var itemPriceWithDiscount: String?
    public var vatId: String?
    public var itemVatPrice: String?
    public var itemVatExcludePrice: String?
    public var totalPrice: String?
    public var attributes: String?
    public var attributesKey: String?
    public var attributesHash: String?
    public var priceTypeId: String?
    public var totalDiscountPriceWithVat: String?
    public var totalPriceWithoutDiscount: String?
    public var deprecated_itemVatIncludePrice: String?
    public var totalVatExcludeDiscountPrice: String?
    public var discountVatPrice: String?
    public var totalVatPrice: String?
    public var totalVatExcludePriceWithoutDiscount: String?
    public var itemPriceVatExcludeWithDiscount: String?
    public var options: String?
    public var optionsPrice: String?
    public var itemPriceWithoutOptions: String?
    public var itemVatExcludePriceWithoutOptions: String?
    public var optionsDetail: String?
    public var promotionId: String?
    public var products: [ProductsData]?
}
