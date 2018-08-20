//
//  ProductsPromotionsData.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/20/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public struct ProductsPromotionsData: Decodable {
    
    public var attributes : ProductsPromotionsAttributes?
    public var relationships: ObjectRelationships?
    public var id : String?
    public var type : String?
    
    public init(include: IncludItem) {
        guard let object = include.item as? ProductsPromotionsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
    
    public init(attributes: ProductsPromotionsAttributes?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(ProductsPromotionsAttributes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public class ProductsPromotionsAttributes: Decodable {
    public var id : String?
    public var productId: String?
    public var promotionId: String?
    public var ruleId: String?
    public var discountValue: String?
    public var discountTypeId: String?
    public var title: String?
    public var discountTypeTitle: String?
    public var `class`: String?
    public var price: Int?
    public var itemPrice: Int?
    public var discountPrice: Int?
    public var showLabel: String?
}
