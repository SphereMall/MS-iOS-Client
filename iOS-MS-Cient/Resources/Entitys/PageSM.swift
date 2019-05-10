//
//  PageSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/9/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class PagesSM: Entity, Decodable {
    public var data : [PagesData]?
    public var included: [IncludItem]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    override public func rebuild() -> Self {
        
        guard let data = self.data else { return self }
        guard let included = self.included else { return self }
        
        var pages: [PagesData] = []
        
        for var page in data {
            if page.attributes != nil {
                page.rebuild(included: included)
                pages.append(page)
            }
        }
        
        self.data = pages
        return self
    }
}

public struct PagesData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: PagesAttributes?
    public var relationships: ObjectRelationships?
    
    public mutating func rebuild(included: [IncludItem]) {
        
        guard let data = relationships?.layoutContainers?.data else { return }
        
        var items: [LayoutContainerData] = []
        for item in data  {
            let include = included.first(where: { (includeItem) -> Bool in
                if includeItem.type == "layoutContainers" && (includeItem.item as? LayoutContainerAttributes)?.id == item.id {
                    return true
                }
                return false
            })
            
            if let itm = include {
                items.append(LayoutContainerData(itm, includes: included))
            }
        }
        
        attributes?.containers = items
    }
}

public struct PagesAttributes: Decodable {
    public var id: String?
    public var pageTitle: String?
    public var codePage: String?
    public var seoKeywords: String?
    public var seoDescription: String?
    public var templateWizard: String?
    public var language: String?
    public var seoTitle: String?
    public var noindex: String?
    public var layoutContainers: String?
    public var containers: [LayoutContainerData]?
}

