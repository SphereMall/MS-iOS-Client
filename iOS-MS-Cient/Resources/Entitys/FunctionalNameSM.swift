//
//  FunctionalNameSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class FunctionalNameSM: Entity, Decodable {
    public var data : [FunctionalNameData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct FunctionalNameData: Decodable {
    public var attributes : FunctionalNameAttribute?
    public var id : String?
    public var type : String?
    public var relationships: ObjectRelationships?
    
    public init(attributes: FunctionalNameAttribute?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(FunctionalNameAttribute.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct FunctionalNameAttribute: Decodable {
    public var code : String?
    public var id : String?
    public var title : String?
}
