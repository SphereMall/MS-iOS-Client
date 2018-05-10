//
//  BrandsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BrandsSM: Entity, Decodable {
    public var data : [BrandsData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct BrandsData: Decodable {
    public var attributes : AttributeBrand?
    public var relationships: ObjectRelationships?
    public var id : String?
    public var type : String?
    
    public init(attributes: AttributeBrand?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(AttributeBrand.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct AttributeBrand: Decodable, Gridable {
    public var id : String?
    public var image : String?
    public var logo : String?
    public var title : String?
    public var urlCode : String?
    public var visible : String?
}
