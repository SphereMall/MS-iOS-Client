//
//  DependencysRebuilder.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol Rebuilder: Datable {
    mutating func rebuild<T: Relationships>(model: inout T, included: [IncludItem])
    mutating func productAttributeValues(attributes: Relationships?, included: [IncludItem]) -> [ProductAttributeValuesAttribute]?
    mutating func brands(attributes: Relationships?, included: [IncludItem]) -> [AttributeBrand]?
    mutating func functionalNames(attributes: Relationships?, included: [IncludItem]) -> [FunctionalNameAttribute]?
    mutating func promotions(attributes: Relationships?, included: [IncludItem]) -> [PromotionsAttributes]?
    mutating func attributeValues(attributes: Relationships?, included: [IncludItem]) -> [AttributeValues]?
    mutating func attributeTypes(attributes: Relationships?, included: [IncludItem]) -> [AttributeTypes]?
    mutating func attributes(attributes: Relationships?, included: [IncludItem]) -> [AttributeResourceSM]?
    mutating func productPriceConfigurations(attributes: Relationships?, included: [IncludItem]) -> [ProductPriceConfigurations]?
    mutating func priceConfigurations(attributes: Relationships?, included: [IncludItem]) -> [PriceConfigurations]?
    mutating func prices(attrs: Relationships?, included: [IncludItem]) -> [AttributesResourceData]?
    mutating func productOptionValues(attributes: Relationships?, included: [IncludItem]) -> [ProductOptionValues]?
    mutating func productOptions(attributes: Relationships?, included: [IncludItem]) -> [ProductOptions]?
    mutating func media(attributes: Relationships?, included: [IncludItem]) -> [MediaData]?
    mutating func productsToPromotions(attributes: Relationships?, included: [IncludItem]) -> [ProductsPromotionsData]?
    mutating func mediaEntities(attributes: Relationships?, included: [IncludItem]) -> [MediaData]?
    mutating func entityAttributeValues(attributes: Relationships?, included: [IncludItem]) -> [EntityData]?
    mutating func mediaDisplayTypes(attributes: Relationships?, included: [IncludItem]) -> [MediaTypesData]?
}

public extension Rebuilder {
    
    mutating func rebuild<T: Relationships>(model: inout T, included: [IncludItem]) {
        model.promotions = promotions(attributes: model, included: included)
        model.brands = brands(attributes: model, included: included)
        model.functionalNames = functionalNames(attributes: model, included: included)
        model.productAttributeValues = productAttributeValues(attributes: model, included: included)
        model.attributeValues = attributeValues(attributes: model, included: included)
        model.attributeTypes = attributeTypes(attributes: model, included: included)
        model.attributes = attributes(attributes: model, included: included)
        model.productPriceConfigurations = productPriceConfigurations(attributes: model, included: included)
        model.priceConfigurations = priceConfigurations(attributes: model, included: included)
        model.productOptionValues = productOptionValues(attributes: model, included: included)
        model.options = productOptions(attributes: model, included: included)
        model.media = media(attributes: model, included: included)
        model.productsToPromotions = productsToPromotions(attributes: model, included: included)
        model.mediaEntities = mediaEntities(attributes: model, included: included)
        model.entityAttributeValues = entityAttributeValues(attributes: model, included: included)
        model.mediaDisplayTypes = mediaDisplayTypes(attributes: model, included: included)
    }
    
    mutating func productAttributeValues(attributes: Relationships?, included: [IncludItem]) -> [ProductAttributeValuesAttribute]? {
        
        if let data = self.relationships?.productAttributeValues?.data {
            var items: [ProductAttributeValuesAttribute] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "productAttributeValues" && (includeItem.item as? ProductAttributeValuesAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! ProductAttributeValuesAttribute)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func brands(attributes: Relationships?, included: [IncludItem]) -> [AttributeBrand]? {
        
        if let data = self.relationships?.brands?.data {
            
            var items: [AttributeBrand] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "brands" && (includeItem.item as? AttributeBrand)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! AttributeBrand)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func functionalNames(attributes: Relationships?, included: [IncludItem]) -> [FunctionalNameAttribute]? {
        
        if let data = self.relationships?.functionalNames?.data {
            var items: [FunctionalNameAttribute] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "functionalNames" && (includeItem.item as? FunctionalNameAttribute)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! FunctionalNameAttribute)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func promotions(attributes: Relationships?, included: [IncludItem]) -> [PromotionsAttributes]? {
        
        if let data = self.relationships?.promotions?.data {
            var items: [PromotionsAttributes] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "promotions" && (includeItem.item as? PromotionsAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! PromotionsAttributes)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func attributeValues(attributes: Relationships?, included: [IncludItem]) -> [AttributeValues]? {
        
        if let data = self.relationships?.attributeValues?.data {
            var items: [AttributeValues] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributeValues" && (includeItem.item as? AttributeValues)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! AttributeValues)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func attributeTypes(attributes: Relationships?, included: [IncludItem]) -> [AttributeTypes]? {
        
        if let data = self.relationships?.attributeTypes?.data {
            var items: [AttributeTypes] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributeTypes" && (includeItem.item as? AttributeTypes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! AttributeTypes)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func attributes(attributes: Relationships?, included: [IncludItem]) -> [AttributeResourceSM]? {
        
        if let data = self.relationships?.attributes?.data {
            var items: [AttributeResourceSM] = []
            for item in data {
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "attributes" && (includeItem.item as? AttributeResourceSM)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if include != nil {
                    items.append(include?.item as! AttributeResourceSM)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func productPriceConfigurations(attributes: Relationships?, included: [IncludItem]) -> [ProductPriceConfigurations]? {
        
        if let data = self.relationships?.productPriceConfigurations?.data {
            var items: [ProductPriceConfigurations] = []
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func priceConfigurations(attributes: Relationships?, included: [IncludItem]) -> [PriceConfigurations]? {
        
        if let data = self.relationships?.priceConfigurations?.data {
            
            var items: [PriceConfigurations] = []
            
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func prices(attrs: Relationships?, included: [IncludItem]) -> [AttributesResourceData]? {
        
        if let attributes = attrs?.priceConfigurations {
            
            for item in attributes {
                
                if let attributes = item.attributes?.affectAttributes {
                    
                    var items: [AttributesResourceData] = []//attrs?.affectAttributes = []
                    
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
                            
                            items.append(object)
                        }
                    }
                    
                    return items
                }
                
                return nil
            }
        }
        
        return nil
    }
    
    mutating func productOptionValues(attributes: Relationships?, included: [IncludItem]) -> [ProductOptionValues]? {
        
        if let data = self.relationships?.productOptionValues?.data {
            
            var items: [ProductOptionValues] = []
            
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        return attributes?.productOptionValues
    }
    
    mutating func productOptions(attributes: Relationships?, included: [IncludItem]) -> [ProductOptions]? {
        
        if let data = self.relationships?.options?.data {
            
            var items: [ProductOptions] = []
            
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        return attributes?.options
    }
    
    mutating func media(attributes: Relationships?, included: [IncludItem]) -> [MediaData]? {
        
        if let data = self.relationships?.media?.data {
            var items: [MediaData] = []
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        guard let medias = attributes?.media else { return nil }
        
        var items: [MediaData] = []
        
        for item in medias {
            items.append(item)
        }
        
        return items
    }
    
    mutating func productsToPromotions(attributes: Relationships?, included: [IncludItem]) -> [ProductsPromotionsData]? {
        
        if let data = self.relationships?.productsToPromotions?.data {
            var items: [ProductsPromotionsData] = []
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
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func mediaEntities(attributes: Relationships?, included: [IncludItem]) -> [MediaData]? {
        
        if let data = self.relationships?.mediaEntities?.data {
            var items: [MediaData] = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "mediaEntities" &&
                        (includeItem.item as? MediaAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = MediaData(include: inc)
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func entityAttributeValues(attributes: Relationships?, included: [IncludItem]) -> [EntityData]? {
        
        if let data = self.relationships?.entityAttributeValues?.data {
            var items: [EntityData] = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "entityAttributeValues" &&
                        (includeItem.item as? EntityAttributesSM)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = EntityData(include: inc)
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
    
    mutating func mediaDisplayTypes(attributes: Relationships?, included: [IncludItem]) -> [MediaTypesData]? {
        
        if let data = self.relationships?.mediaDisplayTypes?.data {
            var items: [MediaTypesData] = []
            for item in data {
                
                let include = included.first(where: { (includeItem) -> Bool in
                    if includeItem.type == "mediaDisplayTypes" &&
                        (includeItem.item as? MediaTypesAttributes)?.id == item.id {
                        return true
                    }
                    return false
                })
                
                if let inc = include {
                    let object = MediaTypesData(include: inc)
                    items.append(object)
                }
            }
            
            return items
        }
        
        return nil
    }
}
