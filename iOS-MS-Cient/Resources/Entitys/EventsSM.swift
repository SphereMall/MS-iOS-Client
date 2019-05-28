//
//  EventsSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/27/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class EventsSM: Entity, Decodable {
    var data: [EventsData]?
}

public struct EventsData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: EventsAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem) {
        guard let object = include.item as? EventsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
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
        attributes = try values.decodeIfPresent(EventsAttributes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct EventsAttributes: Decodable {
    public var id: String?
    public var `class`: String?
    public var code: String?
    public var isSystem: String?
    public var name: String?
    public var visible: String?
}

