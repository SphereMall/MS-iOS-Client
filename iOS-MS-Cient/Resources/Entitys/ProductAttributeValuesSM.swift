//
//  ProductAttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ProductAttributeValuesSM: Entity, Decodable {
    var data : [ProductAttributeValuesData]?
    var error : Error?
    var meta : Meta?
}

public struct ProductAttributeValuesData: Decodable {
    var attributes : ProductAttributeValuesAttribute?
    var id : String?
    var type : String?
}

public struct ProductAttributeValuesAttribute: Decodable {
    var attributeId : String?
    var attributeValueId : String?
    var id : String?
    var lastUpdate : String?
    var orderNumber : String?
    var productId : String?
    var value : String?
}
