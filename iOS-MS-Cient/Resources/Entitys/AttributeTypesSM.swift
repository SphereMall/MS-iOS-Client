//
//  AttributeTypesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeTypesSM: Entity, Decodable {
    public var data : [AttributeTypesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeTypesData: Decodable {
    public var attributes : AttributeTypes?
    public var id : String?
    public var type : String?
}

public struct AttributeTypes: Decodable {
    public var code : String?
    public var fieldTypeId : String?
    public var id : String?
    public var lastUpdate : String?
    public var visible : String?
}

