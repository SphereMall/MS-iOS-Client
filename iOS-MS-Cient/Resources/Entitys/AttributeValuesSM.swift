//
//  AttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeValuesSM: Entity, Decodable {
    public var data : [AttributeValuesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeValuesData: Decodable, Gridable {
    
    public var attributes : AttributeValues?
    public var id : String?
    public var type : String?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? AttributeValues else { return }
        self.attributes = object
        self.relationships = include.relationships
        self.id = include.id
        self.type = include.type
    }
    
    public init(attributes: AttributeValues?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(AttributeValues.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct AttributeValues: Decodable, Gridable {
    public var attributeId : String?
    public var cssClass : String?
    public var hash : String?
    public var id : String?
    public var image : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var title : String?
    public var value : String?
}
