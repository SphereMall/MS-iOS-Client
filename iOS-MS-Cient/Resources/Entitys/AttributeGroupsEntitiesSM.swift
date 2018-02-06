//
//  AttributeGroupsEntitiesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeGroupsEntitiesSM: Entity, Decodable {
    var data : [AttributeGroupsEntitiesData]?
    var error : Error?
    var meta: Meta?
}

public struct AttributeGroupsEntitiesData: Decodable  {
    var attributes : AttributeGroupsEntitiesDataAttribute?
    var id : String?
    var type : String?
}

public struct AttributeGroupsEntitiesDataAttribute: Decodable  {
    var attributeGroupsId : String?
    var attributeId : String?
    var entityId : String?
    var id : String?
}
