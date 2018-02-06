//
//  AttributeDisplayTypes.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeDisplayTypesSM: Entity, Decodable {
    var data : [AttributeDisplayTypesData]?
    var error : Error?
    var meta: Meta?
}

public struct AttributeDisplayTypesData: Decodable {
    var attributes : Attribute?
    var id : String?
    var type : String?
}

public struct Attribute: Decodable {
    var id : String!
    var name : String!
}
