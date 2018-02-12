//
//  AttributesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AttributesSM: Entity, Decodable {
    public var data : [AttributesResourceData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct AttributesResourceData: Decodable {
    public var attributes : AttributeResourceSM?
    public var id : String?
    public var type : String?
}

public struct AttributeResourceSM: Decodable {
    public var aceCode : String?
    public var attributeGroupId : String?
    public var attributeTypeId : String?
    public var code : String?
    public var cssClass : String?
    public var descriptionField : String?
    public var displayType : String?
    public var id : String?
    public var isSystem : String?
    public var lastUpdate : String?
    public var orderNumber : String?
    public var scaleBottom : String?
    public var scaleInterval : String?
    public var scaleTop : String?
    public var schemaOrgProperty : String?
    public var showInSpecList : String?
    public var title : String?
    public var unitOfMeasureId : String?
    public var useInFilter : String?
    public var visible : String?
}

