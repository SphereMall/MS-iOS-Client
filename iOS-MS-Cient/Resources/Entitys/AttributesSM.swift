//
//  AttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributesSM: Entity, Decodable {
    public var data : [AttributesResourceData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributesResourceData: Decodable {
    public var attributes : AttributeResourceSM?
    public var id : String?
    public var type : String?
    public var relationships: ObjectRelationships?
    
    public init(){}
    
    public init(include: IncludItem) {
        
        guard let object = include.item as? AttributeResourceSM else { return }
        self.attributes = object
        self.relationships = include.relationships
        self.id = include.id
        self.type = include.type
    }
    
    public init(attributes: AttributeResourceSM?, relationships: ObjectRelationships?, id: String?, type: String?) {
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
        attributes = try values.decodeIfPresent(AttributeResourceSM.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct AttributeResourceSM: Decodable {
    
    public init() {}
    
    public var aceCode : String?
    public var attributeGroupId : String?
    public var attributeTypeId : String?
    public var code : String?
    public var cssClass : String?
    public var descriptionField : String?
    public var displayType : String?
    public var id : String?
    public var isSystem : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var scaleBottom : String?
    public var scaleInterval : String?
    public var scaleTop : String?
    public var schemaOrgProperty : String?
    public var showInSpecList : String?
    public var title : String?
    public var unitOfMeasureId : String?
    public var useInFilter : String?
    public var visible : String?
    public var affectActtributes: [AttributeValuesData]?
}

