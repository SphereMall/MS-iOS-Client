//
//  RangeSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 3/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class RangeSM: Entity, Decodable {

}

public class RangeData: Decodable {
    
    public var attributes: RangeAttributes?
    public let id: String?
    public let type: String?
    public var relationships: ObjectRelationships?
    
    public init(attributes: RangeAttributes?, relationships: ObjectRelationships?, id: String?, type: String?) {
        self.attributes = attributes
        self.relationships = relationships
        self.id = id
        self.type = type
    }
}

public class RangeAttributes: Decodable {
    public let type: String?
    public let identity: String?
    public let min: Int?
    public let max: Int?
}
