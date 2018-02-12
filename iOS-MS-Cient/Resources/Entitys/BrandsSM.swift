//
//  BrandsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BrandsSM: Entity, Decodable {
    public var data : [BrandsData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct BrandsData: Decodable {
    public var attributes : AttributeBrand?
    public var id : String?
    public var type : String?
}

public struct AttributeBrand: Decodable {
    public var id : String?
    public var image : String?
    public var logo : String?
    public var title : String?
    public var urlCode : String?
    public var visible : String?
}
