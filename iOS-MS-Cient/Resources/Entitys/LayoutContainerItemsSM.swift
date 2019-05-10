//
//  LayoutContainerItemsSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class LayoutContainerItemsSM: Entity, Decodable {
    var data: [LayoutContainerItemsData]?
}

public struct LayoutContainerItemsData: Decodable, Rebuilder {
    public var id: String?
    public var type: String?
    public var attributes: LayoutContainerItemsAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem, includes: [IncludItem]) {
        guard let object = include.item as? LayoutContainerItemsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
        self.rebuildSlider(included: includes)
        self.rebuildBanner(included: includes)
    }
    
    public mutating func rebuildSlider(included: [IncludItem]) {
        
        guard let data = relationships?.sliderObject?.data else { return }
        
        var items: [SliderObjectData] = []
        for item in data  {
            let include = included.first(where: { (includeItem) -> Bool in
                if includeItem.type == "sliderObject" && (includeItem.item as? SliderObjectAttributes)?.id == item.id {
                    return true
                }
                return false
            })
            
            if let itm = include {
                items.append(SliderObjectData(itm, includes: included))
            }
        }
        
        attributes?.sliderObjects = items
    }
    
    public mutating func rebuildBanner(included: [IncludItem]) {
        
        guard let data = relationships?.bannerObject?.data else { return }
        
        var items: [BannerObjectData] = []
        for item in data  {
            let include = included.first(where: { (includeItem) -> Bool in
                if includeItem.type == "bannerObject" && (includeItem.item as? BannerObjectAttributes)?.id == item.id {
                    return true
                }
                return false
            })
            
            if let itm = include {
                items.append(BannerObjectData(itm))
            }
        }
        
        attributes?.bannerObjects = items
    }
}

public struct LayoutContainerItemsAttributes: Decodable {
    public var id: String?
    public var containerId: String?
    public var objectId: String?
    public var orderNumber: String?
    public var sliderObjects: [SliderObjectData]?
    public var bannerObjects: [BannerObjectData]?
}
