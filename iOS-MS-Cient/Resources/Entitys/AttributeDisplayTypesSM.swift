//
//  AttributeDisplayTypes.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributeDisplayTypesSM: Entity, Decodable {
    public var data : [AttributeDisplayTypesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?}

public struct AttributeDisplayTypesData: Decodable {
    public var attributes : Attribute?
    public var id : String?
    public var type : String?
}

public struct Attribute: Decodable {
    public var id : String!
    public var name : String!
}
