//
//  DocumentsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsSM: Entity, Decodable {
    public var data: [DocumentData]?
    public var included: [IncludItem]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
    
    public override func rebuild() -> Self {
        
        guard let data = self.data else { return self }
        guard let included = self.included else { return self }
        
        var products: [DocumentData] = []
        
        for var document in data {
            
            if var attributes = document.attributes {
                document.rebuild(model: &attributes, included: included)
                document.attributes?.affectAttributes = attributes.affectAttributes
                document.attributes?.attributes = attributes.attributes
                document.attributes?.attributeTypes = attributes.attributeTypes
                document.attributes?.attributeValues = attributes.attributeValues
                document.attributes?.brands = attributes.brands
                document.attributes?.functionalNames = attributes.functionalNames
                document.attributes?.media = attributes.media
                document.attributes?.options = attributes.options
                document.attributes?.priceConfigurations = attributes.priceConfigurations
                document.attributes?.productAttributeValues = attributes.productAttributeValues
                document.attributes?.productOptionValues =  attributes.productOptionValues
                document.attributes?.productPriceConfigurations = attributes.productPriceConfigurations
                document.attributes?.productsToPromotions = attributes.productsToPromotions
                document.attributes?.promotions = attributes.promotions
                document.attributes?.mediaEntities = attributes.mediaEntities
                document.attributes?.entityAttributeValues = attributes.entityAttributeValues
                document.attributes?.mediaDisplayTypes = attributes.mediaDisplayTypes
                products.append(document)
            }
        }
        
        self.data = products
        return self
    }
}

public protocol Datable {
    var relationships: ObjectRelationships? { set get }
}

public struct DocumentData: Decodable, Datable, Rebuilder {
    
    public var attributes: DocumentModel?
    public var relationships: ObjectRelationships?
    public var id: String?
    public var type: String?
    
    public init(include: IncludItem) {
        guard let object = include.item as? DocumentModel else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
    
    public init(documentAttributes: DocumentModel?, relationships: ObjectRelationships?, id: String?, type: String?) {
        self.attributes = documentAttributes
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
        attributes = try values.decodeIfPresent(DocumentModel.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public class DocumentModel: Decodable, Relationships, Gridable {
    
    public var createDate: String?
    public var functionalNameId: String?
    public var id: String?
    public var lastUpdate: String?
    public var title: String?
    public var urlCode: String?
    public var visible: String?
    
    public var media: [MediaData]?
    public var productAttributeValues: [ProductAttributeValuesAttribute]?
    public var attributeValues: [AttributeValues]?
    public var attributeTypes: [AttributeTypes]?
    public var attributes: [AttributeResourceSM]?
    public var functionalNames: [FunctionalNameAttribute]?
    public var brands: [AttributeBrand]?
    public var promotions: [PromotionsAttributes]?
    public var productPriceConfigurations: [ProductPriceConfigurations]?
    public var priceConfigurations: [PriceConfigurations]?
    public var productOptionValues: [ProductOptionValues]?
    public var options: [ProductOptions]?
    public var affectAttributes: [AttributesResourceData]?
    public var productsToPromotions: [ProductsPromotionsData]?
    public var mediaEntities: [MediaData]?
    public var entityAttributeValues: [EntityData]?
    public var mediaDisplayTypes: [MediaTypesData]?

}
