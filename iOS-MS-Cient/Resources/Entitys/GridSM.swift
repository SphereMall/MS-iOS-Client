//
//  GridSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import ObjectiveC

public protocol Gridable {
    
}

public class GridItem: Decodable {
    
    var type: String!
    var item: AnyObject?
//    var AssociatedObjectHandle: AnyObject?

    public class Item<T> {
        var object : T?
    }
    
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
            var doc = try container.decodeIfPresent(DocumentModel.self, forKey: .attributes)
            self.item = doc as AnyObject
        case "products":
            let prod = try container.decodeIfPresent(ProductsAttributes.self, forKey: .attributes)
            self.item = prod as AnyObject
        case "brands":
            let brand = try container.decodeIfPresent(AttributeBrand.self, forKey: .attributes)
            self.item = brand as AnyObject
        default:
            self.type = "notRecognized"
        }
    }
}

public class GridSM: Entity, Decodable {
    public var data : [GridItem]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

