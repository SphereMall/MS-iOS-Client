//
//  PriceConfigurationFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import SwiftyJSON

public class PriceConfigurationFilter: NSObject {
    
    private var priceProducts: [PriceProduct] = []
    
    public func addProduct(priceProduct: PriceProduct) {
        priceProducts.append(priceProduct)
    }
    
    public func getData() -> String {
        
        var objects: [PriceObject] = []
        
        if priceProducts.isEmpty {
            return ""
        }
        
        for product in priceProducts {
            
            let attributes = PriceAttributes()
            
            var values: [String] = []
            for attribute in product.attributes {
                attributes.addAffectAttributes(affAttrb: attribute.id!)
                values.append(attribute.attributes!.affectActtributes!.first!.id!)
            }
            
            attributes.addValues(vls: values)
            
            let obj = PriceObject(productId: product.productId, priceTypeId: product.priceTypeId, attributes: attributes)
            
            objects.append(obj)
        }
    
    
        guard let data = try? JSONEncoder().encode(objects) else { return "" }
        guard let string = JSON(data).rawString() else { return "" }
        
        return string
    }
    
    public func getDataForPromotions() -> String {
        
        var objects: [PriceObjectPromotions] = []
        
        if priceProducts.isEmpty {
            return ""
        }
        
        for product in priceProducts {
            
            var attributes: [PricePromotionsAttributes] = []
            
            for attribute in product.attributes {
                if let id = attribute.id, let attibuteId = attribute.attributes?.affectActtributes?.first?.id {
                    let attr = PricePromotionsAttributes(attributeId:id, attributeValueId: attibuteId)
                    attributes.append(attr)
                }
            }
        
            let obj = PriceObjectPromotions(productId: product.productId, priceTypeId: product.priceTypeId, attributes: attributes)
            
            objects.append(obj)
        }
        
        
        guard let data = try? JSONEncoder().encode(objects) else { return "" }
        guard let string = JSON(data).rawString() else { return "" }
        
        return string
    }
    
    public class PriceObjectPromotions: Encodable {
        
        public var productId: Int
        public var priceTypeId: Int
        public var attributes: [PricePromotionsAttributes]
        
        public init(productId: Int, priceTypeId: Int, attributes: [PricePromotionsAttributes]) {
            self.productId = productId
            self.priceTypeId = priceTypeId
            self.attributes = attributes
        }
    }
    
    public class PricePromotionsAttributes: Encodable {
        
        public var attributeId: String
        public var attributeValueId: String
        
        public init(attributeId: String, attributeValueId: String) {
            self.attributeId = attributeId
            self.attributeValueId = attributeValueId
        }
    }
    
    public class PriceObject: Encodable {
        
        public var productId: Int
        public var priceTypeId: Int
        public var attributes: PriceAttributes
        
        public init(productId: Int, priceTypeId: Int, attributes: PriceAttributes) {
            self.productId = productId
            self.priceTypeId = priceTypeId
            self.attributes = attributes
        }
    }
    
    public class PriceAttributes: Encodable {
        
        public var values: [[String]] = []
        public var affectAttributes: [String] = []
        
        public init() {}
        
        public func addValues(vls: [String]) {
            values.append(vls)
        }
        
        public func addAffectAttributes(affAttrb: String) {
            affectAttributes.append(affAttrb)
        }
        
        public init(values: [[String]], affectAttributes: [String]) {
            self.values = values
            self.affectAttributes = affectAttributes
        }
    }
}
