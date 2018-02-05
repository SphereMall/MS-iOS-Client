//
//  AttributeGroupsEntitiesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributeGroupsEntitiesSM: Entity, Decodable {
    var data : [AttributeGroupsData]?
    var error : Error?
    var meta: Meta?
    struct AttributeGroupsData: Decodable  {
        var attributes : Attribute?
        var id : String?
        var type : String?
        
        struct Attribute: Decodable  {
            var attributeGroupsId : String?
            var attributeId : String?
            var entityId : String?
            var id : String?
        }
    }
}
