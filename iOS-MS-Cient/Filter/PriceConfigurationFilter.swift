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
    
    class PriceObject: Encodable {
        
        var productId: Int
        var priceTypeId: Int
        var attributes: PriceAttributes
        
        init(productId: Int, priceTypeId: Int, attributes: PriceAttributes) {
            self.productId = productId
            self.priceTypeId = priceTypeId
            self.attributes = attributes
        }
    }
    
    class PriceAttributes: Encodable {
        
        var values: [[String]] = []
        var affectAttributes: [String] = []
        
        init() {}
        
        func addValues(vls: [String]) {
            values.append(vls)
        }
        
        func addAffectAttributes(affAttrb: String) {
            affectAttributes.append(affAttrb)
        }
        
        init(values: [[String]], affectAttributes: [String]) {
            self.values = values
            self.affectAttributes = affectAttributes
        }
    }
}
