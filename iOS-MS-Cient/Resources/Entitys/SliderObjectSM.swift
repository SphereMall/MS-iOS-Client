//
//  SliderObjectSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class SliderObjectSM: Entity, Decodable {
    var data: [SliderObjectData]?
}

public struct SliderObjectData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: SliderObjectAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem, includes: [IncludItem]) {
        guard let object = include.item as? SliderObjectAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
        self.rebuild(included: includes)
    }
    
    public mutating func rebuild(included: [IncludItem]) {
        
        guard let data = relationships?.relatedItem?.data else { return }
        
        var items: [RelatedData] = []
        for item in data  {
            let include = included.first(where: { (includeItem) -> Bool in
                if includeItem.type == "relatedItem" && (includeItem.item as? RelatedAttributes)?.id == item.id {
                    return true
                }
                return false
            })
            
            if let itm = include {
                items.append(RelatedData(itm))
            }
        }
        
        attributes?.relatedItems = items
    }
}

public struct SliderObjectAttributes: Decodable {
    public var id: String?
    public var name: String?
    public var backgroundColor: String?
    public var backgroundImage: String?
    public var backgroundMobileImage: String?
    public var cssClass: String?
    public var title: String?
    public var type: String?
    public var numberOfBlocks: String?
    public var autoplay: String?
    public var language: String?
    public var relatedItems: [RelatedData]?
}
