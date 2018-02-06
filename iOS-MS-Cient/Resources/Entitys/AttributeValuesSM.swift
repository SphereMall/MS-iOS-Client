//
//  AttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeValuesSM: Entity, Decodable {
    var data : [AttributeValuesData]?
    var error : Error?
    var meta: Meta?
}

public struct AttributeValuesData: Decodable {
    var attributes : AttributeValues?
    var id : String?
    var type : String?
}

public struct AttributeValues: Decodable {
    var attributeId : String?
    var cssClass : String?
    var hash : String?
    var id : String?
    var image : String?
    var lastUpdate : String?
    var orderNumber : String?
    var title : String?
    var value : String?
}
