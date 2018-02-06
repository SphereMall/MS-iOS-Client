//
//  AttributeTypesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeTypesSM: Entity, Decodable {
    var data : [AttributeTypesData]?
    var error : Error?
    var meta: Meta?
}

public struct AttributeTypesData: Decodable {
    var attributes : AttributeTypes?
    var id : String?
    var type : String?
}

public struct AttributeTypes: Decodable {
    var code : String?
    var fieldTypeId : String?
    var id : String?
    var lastUpdate : String?
    var visible : String?
}

