//
//  ProductAttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ProductAttributeValuesSM: Entity, Decodable {
    public var data : [ProductAttributeValuesData]?
    public var error : Error?
    public var meta : Meta?
    public var success : Bool?
}

public struct ProductAttributeValuesData: Decodable {
    public var attributes : ProductAttributeValuesAttribute?
    public var id : String?
    public var type : String?
}

public struct ProductAttributeValuesAttribute: Decodable {
    public var attributeId : String?
    public var attributeValueId : String?
    public var id : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var productId : String?
    public var value : String?
}
