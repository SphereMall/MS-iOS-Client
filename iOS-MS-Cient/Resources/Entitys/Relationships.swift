//
//  Relationships.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol Relationships {
    var media: [MediaData]? { set get }
    var productAttributeValues: [ProductAttributeValuesAttribute]? { set get }
    var attributeValues: [AttributeValues]? { set get }
    var attributeTypes: [AttributeTypes]? { set get }
    var attributes: [AttributeResourceSM]? { set get }
    var functionalNames: [FunctionalNameAttribute]? { set get }
    var brands: [AttributeBrand]? { set get }
    var promotions: [PromotionsAttributes]? { set get }
    var productPriceConfigurations: [ProductPriceConfigurations]? { set get }
    var priceConfigurations: [PriceConfigurations]? { set get }
    var productOptionValues: [ProductOptionValues]? { set get }
    var options: [ProductOptions]? { set get }
    var affectAttributes: [AttributesResourceData]? { set get }
    var productsToPromotions: [ProductsPromotionsData]? { set get }
    var mediaEntities: [MediaData]? { set get }
    var entityAttributeValues: [EntityData]? { set get }
    var mediaDisplayTypes: [MediaTypesData]? { set get }
}


