//
//  AttributeGroupsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributeGroupsSM: Entity, Decodable {
    var data : [AttributeGroupsData]!
    var error : Error?
    var meta: Meta?
}

struct AttributeGroupsData: Decodable {
    var attributes : AttributeSM?
    var id : String?
    var type : String?
}

struct AttributeSM: Decodable {
    
    var id : String?
    var lastUpdate : String?
    var orderNumber : String?
    var title : String?
    var visible : String?
}
