//
//  CatalogItemsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CatalogItemsSM: Entity, Decodable {
    var data : [CatalogItemsData]!
    var error : Error?
    var meta: Meta?

    struct CatalogItemsData: Decodable {
        var attributes : CatalogItemsAttribute?
        var id : String?
        var type : String?
    }
    
    struct CatalogItemsAttribute: Decodable {
        var clickable : String?
        var filterSettings : String?
        var hideItemSettings : String?
        var id : String?
        var langId : String?
        var lastUpdate : String?
        var moduleId : String?
        var noindex : String?
        var openLinkInNewWindow : String?
        var orderNumber : String?
        var parentId : String?
        var seoDescription : String?
        var seoKeywords : String?
        var seoTitle : String?
        var treeItemName : String?
        var urlCode : String?
        var visible : String?
        var websiteId : String?
    }
}
