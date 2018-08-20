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
        var products: [ProductsData] = []
        for var product in data {
            product = product.promotions(included: included)
            product = product.brands(included: included)
            product = product.functionalNames(included: included)
            product = product.productAttributeValues(included: included)
            product = product.attributeValues(included: included)
            product = product.attributeTypes(included: included)
            product = product.attributes(included: included)
            product = product.productPriceConfigurations(included: included)
            product = product.priceConfigurations(included: included)
            product = product.productOptionValues(included: included)
            product = product.productOptions(included: included)
            product = product.media(included: included)
            product = product.productsToPromotions(included: included)
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
    
    public init(include: IncludItem) {
        guard let object = include.item as? ProductsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
    
    public mutating func rebuild(included: [IncludItem]) -> ProductsData {
        
        self = self.promotions(included: included)
        self = self.brands(included: included)
        self = self.functionalNames(included: included)
        self = self.productAttributeValues(included: included)
        self = self.attributeValues(included: included)
        self = self.attributeTypes(included: included)
        self = self.attributes(included: included)
        self = self.productPriceConfigurations(included: included)
        self = self.priceConfigurations(included: included)
        self = self.productOptionValues(included: included)
        self = self.productOptions(included: included)
        self = self.media(included: included)
        self = self.productsToPromotions(included: included)
        
        return self
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
    
    public mutating func productAttributeValues(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.productAttributeValues?.data {
            self.attributes?.productAttributeValues = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productAttributeValues" && (includeItem.item as? ProductAttributeValuesAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.productAttributeValues?.append(include?.item as! ProductAttributeValuesAttribute)
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
    
    public mutating func attributeValues(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.attributeValues?.data {
            self.attributes?.attributeValues = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributeValues" && (includeItem.item as? AttributeValues)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.attributeValues?.append(include?.item as! AttributeValues)
                }
            }
        }
        
        return self
    }
    
    public mutating func attributeTypes(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.attributeTypes?.data {
            self.attributes?.attributeTypes = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributeTypes" && (includeItem.item as? AttributeTypes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.attributeTypes?.append(include?.item as! AttributeTypes)
                }
            }
        }
        
        return self
    }
    
    public mutating func attributes(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.attributes?.data {
            self.attributes?.attributes = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributes" && (includeItem.item as? AttributeResourceSM)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    self.attributes?.attributes?.append(include?.item as! AttributeResourceSM)
                }
            }
        }
        
        return self
    }
    
    public mutating func productPriceConfigurations(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.productPriceConfigurations?.data {
            self.attributes?.productPriceConfigurations = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productPriceConfigurations" &&
                        (includeItem.item as? ProductPriceConfigurationsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = ProductPriceConfigurations(include: inc)
                    self.attributes?.productPriceConfigurations?.append(object)
                }
            }
        }
        
        return self
    }
    
    public mutating func priceConfigurations(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.priceConfigurations?.data {
            
            self.attributes?.priceConfigurations = []
            
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "priceConfigurations" &&
                        (includeItem.item as? PriceConfigurationsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = PriceConfigurations(include: inc)
                    self.attributes?.priceConfigurations?.append(object)
                }
            }
            
            prices(included: included)
        }
        
        return self
    }
    
    public mutating func prices(included: [IncludItem]) {
        
        if let attributes = self.attributes?.priceConfigurations {
            
            for item in attributes {
                
                if let attributes = item.attributes?.affectAttributes {
                    self.attributes?.affectAttributes = []
                    
                    for affAttrb in attributes {
                        let include = included.first(where: { (includeItem) -> Bool in
                            if includeItem.type == "attributes" &&
                                (includeItem.item as? AttributeResourceSM)?.id == affAttrb {
                                return true
                            }
                            return false
                        })
                        
                        if let inc = include {
                            
                            var object = AttributesResourceData(include: inc)
                            object.attributes?.affectActtributes = []
                            
                            let includes = included.filter { (include) -> Bool in
                                if include.type == "attributeValues" && (include.item as? AttributeValues)?.attributeId == object.id {
                                    return true
                                }
                                return false
                            }
                            
                            print(includes)
                            
                            for inc in includes {
                                let ar = AttributeValuesData(include: inc)
                                object.attributes?.affectActtributes!.append(ar)
                            }
                            
                            self.attributes?.affectAttributes?.append(object)
                        }
                    }
                }
            }
        }
    }
    
    public mutating func productOptionValues(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.productOptionValues?.data {
            
            self.attributes?.productOptionValues = []
            
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productOptionValues" &&
                        (includeItem.item as? ProductOptionValuesAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = ProductOptionValues(include: inc)
                    self.attributes?.productOptionValues?.append(object)
                }
            }
        }
        
        return self
    }
    
    public mutating func productOptions(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.options?.data {
            
            self.attributes?.options = []
            
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "options" &&
                        (includeItem.item as? ProductOptionsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = ProductOptions(include: inc)
                    self.attributes?.options?.append(object)
                }
            }
        }
        return self
    }
    
    public mutating func media(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.media?.data {
            self.attributes?.media = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "media" &&
                        (includeItem.item as? MediaAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = MediaData(include: inc)
                    self.attributes?.media?.append(object)
                }
            }
        }
        
        return self
    }
    
    public mutating func productsToPromotions(included: [IncludItem]) -> ProductsData {
        
        if let data = self.relationships?.productsToPromotions?.data {
            self.attributes?.productsToPromotions = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productsToPromotions" &&
                        (includeItem.item as? ProductsPromotionsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = ProductsPromotionsData(include: inc)
                    self.attributes?.productsToPromotions?.append(object)
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
    public var attributeValues: ProductRelationshipsValues?
    public var attributeTypes: ProductRelationshipsValues?
    public var attributes: ProductRelationshipsValues?
    public var productPriceConfigurations: ProductRelationshipsValues?
    public var priceConfigurations: ProductRelationshipsValues?
    public var productOptionValues: ProductRelationshipsValues?
    public var options: ProductRelationshipsValues?
    public var items: ProductRelationshipsValues?
    public var products: ProductRelationshipsValues?
    public var productsToPromotions: ProductRelationshipsValues?
    public var media: ProductRelationshipsValues?
}

public struct ProductRelationshipsValues: Decodable, Gridable {
    public var data: [ProductValueData]?
}

public struct ProductValueData: Decodable, Gridable {
    public var type: String?
    public var id: String?
}

public class ProductsAttributes: Decodable, Gridable {
    
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
    public var id : String?
    public var imageName : String?
    public var path : String?
    public var title : String?
    public var visible : String?
    public var objectId : String?
}

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
