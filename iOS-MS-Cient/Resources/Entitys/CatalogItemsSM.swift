//
//  CatalogItemsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import SwiftyJSON

public class CatalogItemsSM: Entity, Decodable {
    public var data : [CatalogItemsData]!
    public var meta: Meta?
    public var status : String?
    public var ver : String?
    
    public override func rebuild() -> Self {
        _ = data.compactMap { (item) -> Void in
            let settings = item.attributes?.rebuidFilerSettings()
            item.attributes?.pFilterSettings = settings
        }

        return self
    }
}

public struct CatalogItemsData: Decodable {
    public var attributes : CatalogItemsAttribute?
    public var id : String?
    public var type : String?
}

public class CatalogItemsAttribute: Decodable {
    public var clickable : String?
    public var filterSettings : String?
    public var pFilterSettings : String?
    public var hideItemSettings : String?
    public var id : String?
    public var langId : String?
    public var lastUpdate : String?
    public var moduleId : String?
    public var noindex : String?
    public var openLinkInNewWindow : String?
    public var image: String?
    public var orderNumber : String?
    public var parentId : String?
    public var seoDescription : String?
    public var seoKeywords : String?
    public var seoTitle : String?
    public var treeItemName : String?
    public var urlCode : String?
    public var visible : String?
    public var websiteId : String?
    
    func rebuidFilerSettings() -> String? {
        
        var ids: String = ""
        guard let settings = filterSettings else { return ids }
        
        if let dataFromString = settings.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let jsonFromStr = JSON(data: dataFromString)
            if let array = jsonFromStr.first?.1["elements"].array {
                for filterItem in array {
                    if let id = filterItem.string {
                        ids = id + ","
                    }
                }
            }
            
            ids = String(ids.dropLast())
        }
        
        return ids
    }
}
