//
//  EntityAttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class EntityAttributesSM: Entity, Decodable{
    public var entityId : Int?
    public var objectId : Int?
    public var attributeId : Int?
    public var attributeValueId : Int?
    public var lastUpdate : String?
}
