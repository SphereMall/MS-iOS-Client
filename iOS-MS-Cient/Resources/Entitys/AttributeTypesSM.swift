//
//  AttributeTypesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeTypesSM: Entity, Decodable {
    public var data : [AttributeTypesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeTypesData: Decodable {
    public var attributes : AttributeTypes?
    public var id : String?
    public var type : String?
    public var relationships: ObjectRelationships?
    
    public init(attributes: AttributeTypes?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(AttributeTypes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct AttributeTypes: Decodable {
    public var code : String?
    public var fieldTypeId : String?
    public var id : String?
    public var lastUpdate : String?
    public var visible : String?
}

