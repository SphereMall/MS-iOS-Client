//
//  GridSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/26/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public enum GridDataAttribute {
    case product(ProductsAttributes?, type: String)
    case document(DocumentModel?)
    case brand(AttributeBrand?)
    case notRecognized
}

extension GridDataAttribute: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case notRecognized, document, product, brand
    }
    
    public enum CodingKeyAttribute: String, CodingKey {
        case attributes
        case type
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeyAttribute.self)
        
        let containerType = try container.decodeIfPresent(String.self, forKey: .type)
        guard let type = containerType else {
            self = .notRecognized
            return
        }
        
        switch type {
        case "documents":
            let doc = try container.decodeIfPresent(DocumentModel.self, forKey: .attributes)
            self = .document(doc)
        case "products":
            let prod = try container.decodeIfPresent(ProductsAttributes.self, forKey: .attributes)
            self = .product(prod, type: type)
        case "brands":
            let brand = try container.decodeIfPresent(AttributeBrand.self, forKey: .attributes)
            self = .brand(brand)
        default:
            self = .notRecognized
        }
    }
}

public class GridSM: Entity, Decodable {
    public var data : [GridDataAttribute]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

