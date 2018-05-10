//
//  DocumentsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsSM: Entity, Decodable {
    public var data: [DocumentData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct DocumentData: Decodable {
    
    public var documentAttributes: DocumentModel?
    public var relationships: ObjectRelationships?
    public var id: String?
    public var type: String?
    
    public init(documentAttributes: DocumentModel?, relationships: ObjectRelationships?, id: String?, type: String?) {
        self.documentAttributes = documentAttributes
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
        documentAttributes = try values.decodeIfPresent(DocumentModel.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct DocumentModel: Decodable, Gridable {
    public var createDate: String?
    public var functionalNameId: String?
    public var id: String?
    public var lastUpdate: String?
    public var title: String?
    public var urlCode: String?
    public var visible: String?
}
