//
//  PromotionsSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/2/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PromotionsSM: Entity, Decodable  {
    public var data : [PromotionsData]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public struct PromotionsData: Decodable {
    public var attributes : PromotionsAttributes?
    public var relationships: ObjectRelationships?
    public var id : String?
    public var type : String?
    
    public init(attributes: PromotionsAttributes?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(PromotionsAttributes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public class PromotionsAttributes: Decodable {
    public var id : String?
    public var title : String?
    public var startDate : String?
    public var endDate : String?
    public var description : String?
    public var active : String?
    public var lastUpdate : String?
    public var couponsTypeId : String?
    public var activateByCoupon : String?
    public var usageLimit : String?
    public var usagePerUser : String?
}
