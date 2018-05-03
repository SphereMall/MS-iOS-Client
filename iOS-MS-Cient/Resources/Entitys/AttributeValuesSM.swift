//
//  AttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeValuesSM: Entity, Decodable {
    public var data : [AttributeValuesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeValuesData: Decodable {
    public var attributes : AttributeValues?
    public var id : String?
    public var type : String?
}

public struct AttributeValues: Decodable {
    public var attributeId : String?
    public var cssClass : String?
    public var hash : String?
    public var id : String?
    public var image : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var title : String?
    public var value : String?
}
