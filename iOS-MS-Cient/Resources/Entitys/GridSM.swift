//
//  GridSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol Gridable {
    
}

public class GridItem: Decodable {
    
    var type: String!
    var item: AnyObject?

    public enum CodingKeys: String, CodingKey {
        case notRecognized, document, product, brand
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
        case "documents":
            if let doc = try container.decodeIfPresent(DocumentModel.self, forKey: .attributes) {
                self.item = doc as AnyObject
            }
        case "products":
            if let prod = try container.decodeIfPresent(ProductsAttributes.self, forKey: .attributes) {
                self.item = prod as AnyObject
            }
        case "brands":
            if let brand = try container.decodeIfPresent(AttributeBrand.self, forKey: .attributes) {
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

public class GridSM: Entity, Decodable {
    public var data : [GridItem]?
    public var included: [IncludItem]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    public override func rebuild() -> Self {
        
        guard let data = self.data else { return self }
        var items : [GridItem] = []
        for var item in data {
            
            switch item.type {
            case "documents":
                items.append(item)
            case "products":
//                item = item.attributeValues(product: &item.item)
//                item = brands(product: &product)
//                item = functionalNames(product: &product)
//                item = promotions(product: &product)
                items.append(item)
            case "brands":
                items.append(item)
            case "promotions":
                items.append(item)
            default:
                items.append(item)
            }
        }
        
        self.data = items
        return self
    }
    
    private func attributeValues(product: inout ProductsData) -> ProductsData {
        
        if let data = product.relationships?.productAttributeValues?.data {
            product.attributes?.attributeValues = []
            for item in data {
                let include = included?.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productAttributeValues" && (includeItem.item as? ProductAttributeValuesAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    product.attributes?.attributeValues?.append(include?.item as! ProductAttributeValuesAttribute)
                }
            }
        }
        
        return product
    }
    
    private func brands(product: inout ProductsData) -> ProductsData {
        
        if let data = product.relationships?.brands?.data {
            product.attributes?.brands = []
            for item in data {
                let include = included?.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "brands" && (includeItem.item as? AttributeBrand)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    product.attributes?.brands?.append(include?.item as! AttributeBrand)
                }
            }
        }
        
        return product
    }
    
    private func functionalNames(product: inout ProductsData) -> ProductsData {
        
        if let data = product.relationships?.functionalNames?.data {
            product.attributes?.functionalNames = []
            for item in data {
                let include = included?.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "functionalNames" && (includeItem.item as? FunctionalNameAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    product.attributes?.functionalNames?.append(include?.item as! FunctionalNameAttribute)
                }
            }
        }
        
        return product
    }
    
    private func promotions(product: inout ProductsData) -> ProductsData {
        
        if let data = product.relationships?.promotions?.data {
            product.attributes?.promotions = []
            for item in data {
                let include = included?.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "promotions" && (includeItem.item as? PromotionsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    product.attributes?.promotions?.append(include?.item as! PromotionsAttributes)
                }
            }
        }
        
        return product
    }
}

