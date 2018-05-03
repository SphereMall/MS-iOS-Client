//
//  ProductsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class ProductsSM: Entity, Decodable {

    public var data: [ProductsData]? 
    public var included: [IncludItem]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    override public func rebuild() -> Self {
        guard let data = self.data else { return self }
        guard let included = self.included else { return self }
        var products : [ProductsData] = []
        for var product in data {
            product = product.promotions(included: included)
            product = product.brands(included: included)
            product = product.functionalNames(included: included)
            product = product.attributeValues(included: included)
            products.append(product)
        }
        
        self.data = products
        return self
    }
}

public struct ProductsData: Decodable {
    public var id : String?
    public var attributes : ProductsAttributes?
    public var relationships: ObjectRelationships?
    public var type : String?
    
    public mutating func attributeValues(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.productAttributeValues?.data {
            self.attributes?.attributeValues = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productAttributeValues" && (includeItem.item as? ProductAttributeValuesAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.attributeValues?.append(include?.item as! ProductAttributeValuesAttribute)
                }
            }
        }
        
        return self
    }
    
    public mutating func brands(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.brands?.data {
            self.attributes?.brands = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "brands" && (includeItem.item as? AttributeBrand)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.brands?.append(include?.item as! AttributeBrand)
                }
            }
        }
        
        return self
    }
    
    public mutating func functionalNames(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.functionalNames?.data {
            self.attributes?.functionalNames = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "functionalNames" && (includeItem.item as? FunctionalNameAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.functionalNames?.append(include?.item as! FunctionalNameAttribute)
                }
            }
        }
        
        return self
    }
    
    public mutating func promotions(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.promotions?.data {
            self.attributes?.promotions = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "promotions" && (includeItem.item as? PromotionsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.promotions?.append(include?.item as! PromotionsAttributes)
                }
            }
        }
        
        return self
    }
}

public struct ObjectRelationships: Decodable, Gridable {
    public var productAttributeValues: ProductRelationshipsValues?
    public var brands: ProductRelationshipsValues?
    public var functionalNames: ProductRelationshipsValues?
    public var promotions: ProductRelationshipsValues?
}

public struct ProductRelationshipsValues: Decodable, Gridable {
    public var data: [ProductValueData]?
}

public struct ProductValueData: Decodable, Gridable {
    public var type: String?
    public var id: String?
}

public struct ProductsAttributes: Decodable, Gridable {
    public var articleNumber : String?
    public var authorizationGroupId : String?
    public var brandId : String?
    public var deliveryProviderId : String?
    public var disable : String?
    public var fullDescription : String?
    public var functionalNameId : String?
    public var id : String?
    public var importedId : String?
    public var isMain : String?
    public var lastUpdate : String?
    public var oldPrice : String?
    public var price : String?
    public var priceExclVat : String?
    public var purchasePrice: String?
    public var rating: String?
    public var reviewAmount: String?
    public var sellingLine: String?
    public var seoDescription: String?
    public var seoKeywords: String?
    public var seoTitle: String?
    public var shortDescription: String?
    public var title: String?
    public var titleMask: String?
    public var urlCode: String?
    public var useTitleMask: String?
    public var vatId: String?
    public var visible: String?
    public var websiteId: String?
    public var media: [ProductMedia]?
    public var attributeValues: [ProductAttributeValuesAttribute]?
    public var functionalNames: [FunctionalNameAttribute]?
    public var brands: [AttributeBrand]?
    public var promotions: [PromotionsAttributes]?
}

public struct ProductMedia: Decodable, Gridable {
    public var id : String?
    public var imageName : String?
    public var path : String?
    public var title : String?
    public var visible : String?
    public var objectId : String?
}

public class IncludItem: Decodable {
    
    public var type: String!
    public var item: AnyObject?
    
    public enum CodingKeys: String, CodingKey {
        case notRecognized, productAttributeValues, functionalNames, brands
    }
    
    public enum CodingKeyAttribute: String, CodingKey {
        case attributes
        case type
    }
    
    public convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeyAttribute.self)
        
        let containerType = try container.decodeIfPresent(String.self, forKey: .type)
        guard let type = containerType else {
            self.type = "notRecognized"
            return
        }
        
        self.type = type
        
        switch type {
        case "productAttributeValues":
            if let doc = try? container.decodeIfPresent(ProductAttributeValuesAttribute.self, forKey: .attributes) {
                self.item = doc as AnyObject
            }
        case "functionalNames":
            if let prod = try? container.decodeIfPresent(FunctionalNameAttribute.self, forKey: .attributes) {
                self.item = prod as AnyObject
            }
        case "brands":
            if let brand = try? container.decodeIfPresent(AttributeBrand.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "promotions":
            if let brand = try? container.decodeIfPresent(PromotionsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        default:
            self.type = "notRecognized"
        }
    }
}
