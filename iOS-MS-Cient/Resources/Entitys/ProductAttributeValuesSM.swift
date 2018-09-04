//
//  ProductAttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ProductAttributeValuesSM: Entity, Decodable {
    public var data : [ProductAttributeValuesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct ProductAttributeValuesData: Decodable {
    public var attributes : ProductAttributeValuesAttribute?
    public var id : String?
    public var type : String?
    public var relationships: ObjectRelationships?
    
    public init(attributes: ProductAttributeValuesAttribute?, relationships: ObjectRelationships?, id: String?, type: String?) {
        self.attributes = attributes
        self.relationships = relationships
        self.id = id
        self.type = type
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case attributes = "attributes"
        case relationships = "relationships"
        case type = "type"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let relationships = try? values.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
            self.relationships = relationships
        }
        
        id = try values.decodeIfPresent(String.self, forKey: .id)
        attributes = try values.decodeIfPresent(ProductAttributeValuesAttribute.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct ProductAttributeValuesAttribute: Decodable {
    public var attributeId : String?
    public var attributeValueId : String?
    public var id : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var productId : String?
    public var value : String?
    public var productAttributeValueId: String?
    public var valueTitle: String?
    public var image: String?
    public var code: String?
    public var title: String?
    public var showInSpecList: String?
    public var description: String?
    public var attributeGroupId: String?
    public var valueCssClass: String?
    public var cssClass: String?
    public var useInFilter: String?
    public var schemaOrgProperty: String?
    public var valueOrderNumber: String?
    public var unitOfMeasureId: String?
    public var displayType: String?
    
    public init(attribute: AttributeValues) {
        self.attributeId = attribute.attributeId
        self.cssClass = attribute.cssClass
        self.id = attribute.id
        self.image = attribute.image
        self.lastUpdate = attribute.lastUpdate
        self.orderNumber = attribute.orderNumber
        self.title = attribute.title
        self.value = attribute.value
    }
}
