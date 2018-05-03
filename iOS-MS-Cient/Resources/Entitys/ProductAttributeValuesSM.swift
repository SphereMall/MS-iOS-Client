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
    public var meta: Meta?
    public var status : String?
    public var ver : String?
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
    public var productAttributeValueId: String?
    public var valueTitle: String?
    public var image: String?
    public var code: String?
    public var title: String?
    public var showInSpecList: String?
    public var description: String?
    public var attributeGroupId: String?
    public var valueCssClass: String?
    public var cssClass: String?
    public var useInFilter: String?
    public var schemaOrgProperty: String?
    public var valueOrderNumber: String?
    public var unitOfMeasureId: String?
    public var displayType: String?
}
