//
//  AttributeGroupsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeGroupsSM: Entity, Decodable {
    public var data : [AttributeGroupsData]!
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct AttributeGroupsData: Decodable {
    public var attributes : AttributeSM?
    public var id : String?
    public var type : String?
}

public struct AttributeSM: Decodable {
    public var id : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var title : String?
    public var visible : String?
}
