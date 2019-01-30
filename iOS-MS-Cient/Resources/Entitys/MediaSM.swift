//
//  MediaSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/12/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaSM: Entity, Decodable {
    public var data : [MediaData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct MediaData: Decodable {
    
    public var attributes : MediaAttributes?
    public var id : String?
    public var type : String?
    public var path: String?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? MediaAttributes else { return }
        self.attributes = object
        self.path = attributes?.path
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
    
    public init(attributes: MediaAttributes, id: String?, type: String?) {
        self.attributes = attributes
        self.id = id
        self.type = type
    }
}

public struct MediaAttributes: Decodable  {
    public var id: String?
    public var mediaId: String?
    public var imageName : String?
    public var orderNumber : String?
    public var imageTypeId : String?
    public var visible : String?
    public var path : String?
    public var mediaDisplayTypeId: String?
    public var mediaTypeId: String?
}
