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
        case relationships
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
            if let attributes = try container.decodeIfPresent(DocumentModel.self, forKey: .attributes) {
                var document = DocumentData(documentAttributes: attributes, relationships: nil, id: attributes.id, type: type)
                if let relationships = try container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                    document.relationships = relationships
                }
                
                self.item = document as AnyObject
            }
        case "products":
            if let attributes = try container.decodeIfPresent(ProductsAttributes.self, forKey: .attributes) {
                var product = ProductsData(id: attributes.id, attributes: attributes, relationships: nil, type: type)
                if let relationships = try container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                    product.relationships = relationships
                }
                self.item = product as AnyObject
            }
        case "brands":
            if let attributes = try container.decodeIfPresent(AttributeBrand.self, forKey: .attributes) {
                var brand = BrandsData(attributes: attributes, relationships: nil, id: attributes.id, type: type)
                if let relationships = try container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                    brand.relationships = relationships
                }
                
                self.item = brand as AnyObject
            }
        case "promotions":
            if let attributes = try? container.decodeIfPresent(PromotionsAttributes.self, forKey: .attributes) {
                var promotion = PromotionsData(attributes: attributes, relationships: nil, id: attributes?.id, type: type)
                if let relationships = try container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                    promotion.relationships = relationships
                }
                
                self.item = promotion as AnyObject
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
        guard let included = self.included else { return self }
        var items : [GridItem] = []
        for object in data {
            
            switch object.type {
            case "documents":
                items.append(object)
            case "products":
                if var product = object.item as? ProductsData {
                    product = product.promotions(included: included)
                    product = product.brands(included: included)
                    product = product.functionalNames(included: included)
                    product = product.attributeValues(included: included)
                    let item = GridItem()
                    item.item = product as AnyObject
                    item.type = object.type
                    items.append(item)
                } else {
                    items.append(object)
                }
            case "brands":
                items.append(object)
            case "promotions":
                items.append(object)
            default:
                items.append(object)
            }
        }
        
        self.data = items
        return self
    }
}

