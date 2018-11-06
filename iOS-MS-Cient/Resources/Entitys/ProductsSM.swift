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
//    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    override public func rebuild() -> Self {
        
        guard let data = self.data else { return self }
        guard let included = self.included else { return self }
        
        var products: [ProductsData] = []
        
        for var product in data {
            if var attributes = product.attributes {
                product.rebuild(model: &attributes, included: included)
                product.attributes?.affectAttributes = attributes.affectAttributes
                product.attributes?.attributes = attributes.attributes
                product.attributes?.attributeTypes = attributes.attributeTypes
                product.attributes?.attributeValues = attributes.attributeValues
                product.attributes?.brands = attributes.brands
                product.attributes?.functionalNames = attributes.functionalNames
                product.attributes?.media = attributes.media
                product.attributes?.options = attributes.options
                product.attributes?.priceConfigurations = attributes.priceConfigurations
                product.attributes?.productAttributeValues = attributes.productAttributeValues
                product.attributes?.productOptionValues =  attributes.productOptionValues
                product.attributes?.productPriceConfigurations = attributes.productPriceConfigurations
                product.attributes?.productsToPromotions = attributes.productsToPromotions
                product.attributes?.promotions = attributes.promotions
                product.attributes?.mediaEntities = attributes.mediaEntities
                product.attributes?.entityAttributeValues = attributes.entityAttributeValues
                product.attributes?.mediaDisplayTypes = attributes.mediaDisplayTypes
                products.append(product)
            }
        }
        
        self.data = products
        return self
    }
}

public struct ProductsData: Decodable, Rebuilder {

    public var id : String?
    public var attributes : ProductsAttributes?
    public var relationships: ObjectRelationships?
    public var type : String?
    
    public init(include: IncludItem) {
        guard let object = include.item as? ProductsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
    
    public init(id : String?, attributes : ProductsAttributes?, relationships: ObjectRelationships?, type : String?) {
        self.id = id
        self.attributes = attributes
        self.relationships = relationships
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
        attributes = try values.decodeIfPresent(ProductsAttributes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct ObjectRelationships: Decodable, Gridable {
    public var productAttributeValues: RelationshipsValues?
    public var brands: RelationshipsValues?
    public var functionalNames: RelationshipsValues?
    public var promotions: RelationshipsValues?
    public var attributeValues: RelationshipsValues?
    public var attributeTypes: RelationshipsValues?
    public var attributes: RelationshipsValues?
    public var productPriceConfigurations: RelationshipsValues?
    public var priceConfigurations: RelationshipsValues?
    public var productOptionValues: RelationshipsValues?
    public var options: RelationshipsValues?
    public var items: RelationshipsValues?
    public var products: RelationshipsValues?
    public var productsToPromotions: RelationshipsValues?
    public var media: RelationshipsValues?
    public var mediaEntities: RelationshipsValues?
    public var entityAttributeValues: RelationshipsValues?
    public var mediaDisplayTypes: RelationshipsValues?
}

public struct RelationshipsValues: Decodable, Gridable {
    public var data: [ProductValueData]?
}

public struct ProductValueData: Decodable, Gridable {
    public var type: String?
    public var id: String?
}

public class ProductsAttributes: Decodable, Relationships, Gridable {
    
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
    
    public enum CodingKeys: String, CodingKey {
        case articleNumber, authorizationGroupId, brandId, deliveryProviderId, disable, fullDescription,
        functionalNameId, id, importedId, isMain, lastUpdate, oldPrice, price, priceExclVat, purchasePrice,
        rating, reviewAmount, sellingLine, seoDescription, seoKeywords, seoTitle, shortDescription,
        title, titleMask, urlCode, useTitleMask, vatId, visible, websiteId, media, productAttributeValues,
        attributeValues, attributeTypes, attributes, functionalNames, brands, promotions, productPriceConfigurations,
        priceConfigurations, productOptionValues, options, affectAttributes, productsToPromotions
    }
    
    public convenience required init(from decoder: Decoder) throws {
        
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.articleNumber = try container.decodeIfPresent(String.self, forKey: .articleNumber)
        self.authorizationGroupId = try container.decodeIfPresent(String.self, forKey: .authorizationGroupId)
        self.brandId = try container.decodeIfPresent(String.self, forKey: .brandId)
        self.deliveryProviderId = try container.decodeIfPresent(String.self, forKey: .deliveryProviderId)
        self.disable = try container.decodeIfPresent(String.self, forKey: .disable)
        self.fullDescription = try container.decodeIfPresent(String.self, forKey: .fullDescription)
        self.functionalNameId = try container.decodeIfPresent(String.self, forKey: .functionalNameId)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.importedId = try container.decodeIfPresent(String.self, forKey: .importedId)
        self.isMain = try container.decodeIfPresent(String.self, forKey: .isMain)
        self.lastUpdate = try container.decodeIfPresent(String.self, forKey: .lastUpdate)
        self.oldPrice = try container.decodeIfPresent(String.self, forKey: .oldPrice)
        self.price = try container.decodeIfPresent(String.self, forKey: .price)
        self.priceExclVat = try container.decodeIfPresent(String.self, forKey: .priceExclVat)
        self.purchasePrice = try container.decodeIfPresent(String.self, forKey: .purchasePrice)
        self.rating = try container.decodeIfPresent(String.self, forKey: .rating)
        self.reviewAmount = try container.decodeIfPresent(String.self, forKey: .reviewAmount)
        self.sellingLine = try container.decodeIfPresent(String.self, forKey: .sellingLine)
        self.seoDescription = try container.decodeIfPresent(String.self, forKey: .seoDescription)
        self.seoKeywords = try container.decodeIfPresent(String.self, forKey: .seoKeywords)
        self.seoTitle = try container.decodeIfPresent(String.self, forKey: .seoTitle)
        self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.titleMask = try container.decodeIfPresent(String.self, forKey: .titleMask)
        self.urlCode = try container.decodeIfPresent(String.self, forKey: .urlCode)
        self.useTitleMask = try container.decodeIfPresent(String.self, forKey: .useTitleMask)
        self.vatId = try container.decodeIfPresent(String.self, forKey: .vatId)
        self.visible = try container.decodeIfPresent(String.self, forKey: .visible)
        self.websiteId = try container.decodeIfPresent(String.self, forKey: .websiteId)
        self.productAttributeValues = try container.decodeIfPresent([ProductAttributeValuesAttribute].self, forKey: .productAttributeValues)
        self.attributeValues = try container.decodeIfPresent([AttributeValues].self, forKey: .attributeValues)
        self.attributeTypes = try container.decodeIfPresent([AttributeTypes].self, forKey: .attributeTypes)
        self.attributes = try container.decodeIfPresent([AttributeResourceSM].self, forKey: .attributes)
        self.functionalNames = try container.decodeIfPresent([FunctionalNameAttribute].self, forKey: .functionalNames)
        self.brands = try container.decodeIfPresent([AttributeBrand].self, forKey: .brands)
        self.promotions = try container.decodeIfPresent([PromotionsAttributes].self, forKey: .promotions)
        self.productPriceConfigurations  = try container.decodeIfPresent([ProductPriceConfigurations].self, forKey: .productPriceConfigurations)
        self.priceConfigurations = try container.decodeIfPresent([PriceConfigurations].self, forKey: .priceConfigurations)
        self.productOptionValues  = try container.decodeIfPresent([ProductOptionValues].self, forKey: .productOptionValues)
        self.options = try container.decodeIfPresent([ProductOptions].self, forKey: .options)
        self.affectAttributes  = try container.decodeIfPresent([AttributesResourceData].self, forKey: .affectAttributes)
        
        let mediaData = try container.decodeIfPresent([MediaData].self, forKey: .media)
        let mediaAttributes = try container.decodeIfPresent([MediaAttributes].self, forKey: .media)
        
        if let promotions = try container.decodeIfPresent([ProductsPromotionsAttributes].self, forKey: .productsToPromotions) {
            self.productsToPromotions = []
            for prm in promotions {
                self.productsToPromotions!.append(ProductsPromotionsData(attributes: prm,
                                                                        relationships: nil,
                                                                        id: prm.id, type: "productsToPromotions"))
            }
        }
        
        if mediaData?.first?.attributes == nil {
            guard let mds = mediaAttributes else { return }
            self.media = []
            for attribute in mds {
                self.media?.append(MediaData(attributes: attribute, id: attribute.id, type: "media"))
            }
        } else {
            self.media = mediaData
        }
    }
}

public struct ProductMedia: Decodable, Gridable {
    public var id: String?
    public var imageName: String?
    public var path: String?
    public var title: String?
    public var visible: String?
    public var objectId: String?
    public var mediaDisplayTypeId: String?
    public var mediaTypeId: String?
}
