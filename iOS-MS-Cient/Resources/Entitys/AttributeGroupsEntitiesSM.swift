//
//  AttributeGroupsEntitiesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeGroupsEntitiesSM: Entity, Decodable {
    public var data : [AttributeGroupsEntitiesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeGroupsEntitiesData: Decodable  {
    public var attributes : AttributeGroupsEntitiesDataAttribute?
    public var id : String?
    public var type : String?
}

public struct AttributeGroupsEntitiesDataAttribute: Decodable  {
    public var attributeGroupsId : String?
    public var attributeId : String?
    public var entityId : String?
    public var id : String?
}
