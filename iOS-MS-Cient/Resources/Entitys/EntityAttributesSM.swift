//
//  EntityAttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class EntityAttributesSM: Entity, Decodable {
    public var id: String?
    public var entityId : String?
    public var objectId : String?
    public var attributeId : String?
    public var attributeValueId : String?
    public var lastUpdate : String?
}

public class EntityData: Entity, Decodable {
    public var attributes : EntityAttributesSM?
    public var type : String?
    public var id: String?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? EntityAttributesSM else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}
