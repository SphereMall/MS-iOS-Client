//
//  AttributeValuesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributeValuesSM: Entity, Decodable {
    
    var data : [AttributeValuesData]?
    var error : Error?
    var meta: Meta?

    struct AttributeValuesData: Decodable {
        var attributes : AttributeValues?
        var id : String?
        var type : String?
    }
    
    struct AttributeValues: Decodable {
        var attributeId : String?
        var cssClass : String?
        var hash : String?
        var id : String?
        var image : String?
        var lastUpdate : String?
        var orderNumber : String?
        var title : String?
        var value : String?
    }
}
