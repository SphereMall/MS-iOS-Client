//
//  AttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributesSM: Entity, Decodable {
    var data : [AttributesResourceData]?
    var error : Error?
    var meta: Meta?
}

struct AttributesResourceData: Decodable {
    var attributes : AttributeResourceSM?
    var id : String?
    var type : String?
}

struct AttributeResourceSM: Decodable {
    var aceCode : String?
    var attributeGroupId : String?
    var attributeTypeId : String?
    var code : String?
    var cssClass : String?
    var descriptionField : String?
    var displayType : String?
    var id : String?
    var isSystem : String?
    var lastUpdate : String?
    var orderNumber : String?
    var scaleBottom : String?
    var scaleInterval : String?
    var scaleTop : String?
    var schemaOrgProperty : String?
    var showInSpecList : String?
    var title : String?
    var unitOfMeasureId : String?
    var useInFilter : String?
    var visible : String?
}

