//
//  EntitiesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class EntitiesSM: Entity, Decodable {
    public var data : [EntitiesData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct EntitiesData: Decodable {
    public var attributes : EntitiesAttribute?
    public var id : String?
    public var type : String?
}

public struct EntitiesAttribute: Decodable  {
    public var code : String?
    public var displayField : String?
    public var id : String?
    public var inRelationWithFactor : String?
    public var table : String?
    public var title : String?
    public var visible : String?
    public var `where` : String?
}
