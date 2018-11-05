//
//  IncludItem.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class IncludItem: Decodable {
    
    public var type: String!
    public var id: String?
    public var item: AnyObject?
    public var relationships: ObjectRelationships?
    
    public enum CodingKeyAttribute: String, CodingKey {
        case attributes
        case relationships
        case id
        case type
    }
    
    public convenience required init(from decoder: Decoder) throws {
        
        self.init()
        let container = try decoder.container(keyedBy: CodingKeyAttribute.self)
        
        let containerType = try container.decodeIfPresent(String.self, forKey: .type)
        let id = try container.decodeIfPresent(String.self, forKey: .id)
        
        guard let type = containerType else {
            self.type = "notRecognized"
            return
        }
        
        if let relationships = try? container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
            self.relationships = relationships
        }
        
        self.type = type
        self.id = id
        
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
        case "attributeValues":
            if let brand = try? container.decodeIfPresent(AttributeValues.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "attributeTypes":
            if let brand = try? container.decodeIfPresent(AttributeTypes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "attributes":
            if let brand = try? container.decodeIfPresent(AttributeResourceSM.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "productPriceConfigurations" :
            if let brand = try? container.decodeIfPresent(ProductPriceConfigurationsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "entityAttributeValues" :
            if let object = try? container.decodeIfPresent(EntityAttributesSM.self, forKey: .attributes) {
                self.item = object as AnyObject
            }
        case "mediaEntities" :
            if let object = try? container.decodeIfPresent(MediaAttributes.self, forKey: .attributes) {
                self.item = object as AnyObject
            }
        case "mediaDisplayTypes" :
            if let object = try? container.decodeIfPresent(MediaTypesAttributes.self, forKey: .attributes) {
                self.item = object as AnyObject
            }
        case "priceConfigurations" :
            if let brand = try? container.decodeIfPresent(PriceConfigurationsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "productOptionValues" :
            if let brand = try? container.decodeIfPresent(ProductOptionValuesAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "options" :
            if let brand = try? container.decodeIfPresent(ProductOptionsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "products" :
            if let brand = try? container.decodeIfPresent(ProductsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "items" :
            if let brand = try? container.decodeIfPresent(ItemsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "media" :
            if let brand = try? container.decodeIfPresent(MediaAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        case "productsToPromotions" :
            if let brand = try? container.decodeIfPresent(ProductsPromotionsAttributes.self, forKey: .attributes) {
                self.item = brand as AnyObject
            }
        default:
            self.type = "notRecognized"
        }
    }
}

