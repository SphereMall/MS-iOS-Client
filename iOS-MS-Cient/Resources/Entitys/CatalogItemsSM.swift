//
//  CatalogItemsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CatalogItemsSM: Entity, Decodable {
    public var data : [CatalogItemsData]!
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct CatalogItemsData: Decodable {
    public var attributes : CatalogItemsAttribute?
    public var id : String?
    public var type : String?
}

public struct CatalogItemsAttribute: Decodable {
    public var clickable : String?
    public var filterSettings : String?
    public var hideItemSettings : String?
    public var id : String?
    public var langId : String?
    public var lastUpdate : String?
    public var moduleId : String?
    public var noindex : String?
    public var openLinkInNewWindow : String?
    public var orderNumber : String?
    public var parentId : String?
    public var seoDescription : String?
    public var seoKeywords : String?
    public var seoTitle : String?
    public var treeItemName : String?
    public var urlCode : String?
    public var visible : String?
    public var websiteId : String?
}
