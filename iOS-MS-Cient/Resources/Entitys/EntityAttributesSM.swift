//
//  EntityAttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class EntityAttributesSM: Entity, Decodable{
    var entityId : Int?
    var objectId : Int?
    var attributeId : Int?
    var attributeValueId : Int?
    var lastUpdate : String?
}
